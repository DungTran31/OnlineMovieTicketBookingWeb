using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineMovieTicketBookingWeb.Data;
using OnlineMovieTicketBookingWeb.Models;
using Microsoft.Extensions.Logging;

namespace OnlineMovieTicketBookingWeb.Controllers
{
    [Authorize]
    public class TicketsController : Controller
    {
        private readonly MovieTicketBookingContext _context;
        private readonly ILogger<TicketsController> _logger;

        public TicketsController(MovieTicketBookingContext context, ILogger<TicketsController> logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<IActionResult> Purchase(string movieId)
        {
            _logger.LogInformation($"Received movieId: {movieId}");

            if (string.IsNullOrEmpty(movieId))
            {
                _logger.LogWarning("Movie ID is null or empty.");
                return BadRequest("Movie ID cannot be null or empty.");
            }

            var screenings = await _context.Screenings
                .Where(s => s.MovieId == movieId)
                .Include(s => s.Movie!)
                .Include(s => s.ScreeningRoom!)
                    .ThenInclude(sr => sr.Seats!.Where(seat => seat.IsChosen == "Chưa chọn"))
                    .ThenInclude(seat => seat.SeatType)
                .Include(s => s.SoldTickets)
                    .ThenInclude(st => st.TicketPrice)
                .ToListAsync();

            if (screenings == null || !screenings.Any())
            {
                _logger.LogWarning($"No screenings found for movie ID: {movieId}");
                return NotFound($"No screenings found for movie ID: {movieId}");
            }

            return View(screenings);
        }


        [HttpPost]
        public async Task<IActionResult> ConfirmPurchase(int selectedSeatId)
        {
            var seat = await _context.Seats
                .Include(s => s.ScreeningRoom)
                .ThenInclude(sr => sr.Screenings) // Include the Screenings
                .FirstOrDefaultAsync(s => s.Id == selectedSeatId);

            if (seat == null)
            {
                return NotFound("Selected seat not found.");
            }

            string ticketPriceName;
            if (seat.RowPosition == "A" || seat.RowPosition == "B")
            {
                ticketPriceName = "Vé Deluxe";
            }
            else
            {
                var userName = User.Identity?.Name;
                if (string.IsNullOrEmpty(userName))
                {
                    return Unauthorized("User is not authenticated.");
                }

                var customer = await _context.Users.FirstOrDefaultAsync(u => u.UserName == userName);
                if (customer == null)
                {
                    return NotFound("Customer not found.");
                }

                var dateOfBirth = customer.DateOfBirth;
                if (dateOfBirth == default)
                {
                    return BadRequest("Customer's date of birth is not set.");
                }

                int age = DateTime.Now.Year - dateOfBirth.Year;
                if (dateOfBirth.Date > DateTime.Now.AddYears(-age)) age--;

                if (age < 10)
                {
                    ticketPriceName = "Vé trẻ em";
                }
                else if (age < 22)
                {
                    ticketPriceName = "Vé sinh viên";
                }
                else if (age > 60)
                {
                    ticketPriceName = "Vé người già";
                }
                else
                {
                    ticketPriceName = "Vé người lớn";
                }
            }

            // Fetch the correct TicketPrice entity based on the name (case-insensitive and trimmed)
            var ticketPrices = await _context.TicketPrices.ToListAsync();
            var ticketPrice = ticketPrices
                .FirstOrDefault(tp => string.Equals(tp.Name?.Trim(), ticketPriceName, StringComparison.OrdinalIgnoreCase));

            if (ticketPrice == null)
            {
                return NotFound("Ticket price not found.");
            }

            // Ensure ScreeningRoom and Screenings are not null
            if (seat.ScreeningRoom == null || seat.ScreeningRoom.Screenings == null)
            {
                return NotFound("Screening room or screenings not found.");
            }

            // Assuming there is only one screening per screening room for simplicity
            var screening = seat.ScreeningRoom.Screenings.FirstOrDefault();
            if (screening == null)
            {
                return NotFound("Screening not found.");
            }

            // Fetch the current staff user
            var staffUser = await _context.Users.OfType<Staff>().FirstOrDefaultAsync(u => u.UserName == User.Identity.Name);
            string staffId = staffUser?.Id ?? "NV01"; // Use default staff ID if staff user is not found

            var ticket = new SoldTicket
            {
                Id = Guid.NewGuid().ToString(), // Generate a unique ID for the SoldTicket
                SeatId = selectedSeatId,
                ScreeningId = screening.Id, // Ensure ScreeningId is correctly assigned
                TicketPriceId = ticketPrice.Id, // Ensure TicketPriceId is correctly assigned
                StaffId = staffId, // Set the StaffId
                SoldDate = DateTime.Now, // Set the SoldDate
                TotalPrice = ticketPrice.Price // Set the TotalPrice
            };

            // Update the seat's IsChosen status to "Đã chọn"
            seat.IsChosen = "Đã chọn";
            _context.Seats.Update(seat);

            _context.SoldTickets.Add(ticket);
            await _context.SaveChangesAsync();

            return RedirectToAction("PurchaseConfirmation", new { id = ticket.Id });
        }









        public async Task<IActionResult> PurchaseConfirmation(string id)
        {
            var ticket = await _context.SoldTickets
                .Include(t => t.Screening!)
                .ThenInclude(s => s.Movie!)
                .FirstOrDefaultAsync(t => t.Id == id);

            if (ticket == null)
            {
                return NotFound();
            }

            return View(ticket);
        }

    }
}
