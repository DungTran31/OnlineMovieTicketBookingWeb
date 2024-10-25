using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineMovieTicketBookingWeb.Data;
using OnlineMovieTicketBookingWeb.Models;

namespace OnlineMovieTicketBookingWeb.Controllers
{
    public class TicketPriceController : Controller
    {
        MovieTicketBookingContext _context;

        public TicketPriceController(MovieTicketBookingContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var ticketprices = await _context.TicketPrices.OrderBy(tp => tp.Price).ToListAsync();
            return View(ticketprices);
        }
    }
}
