using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using OnlineMovieTicketBookingWeb.Data;
using OnlineMovieTicketBookingWeb.Models;
using System.Linq;
using System.Threading.Tasks;

namespace OnlineMovieTicketBookingWeb.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class StaffController : Controller
    {
        private readonly MovieTicketBookingContext _context;
        private readonly ILogger<StaffController> _logger;

        [TempData]
        public string StatusMessage { get; set; } = string.Empty;

        public StaffController(MovieTicketBookingContext context, ILogger<StaffController> logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<IActionResult> Index()
        {
            var staffs = await _context.Staffs.Include(s => s.SoldTickets).ToListAsync();
            return View(staffs);
        }

        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var staff = await _context.Staffs
                .FirstOrDefaultAsync(m => m.Id == id);
            if (staff == null)
            {
                return NotFound();
            }

            return View(staff);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,FullName,IdentityNumber,HireDate,Gender,IsActive,Role")] Staff staff)
        {
            if (ModelState.IsValid)
            {
                _context.Add(staff);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(staff);
        }

        public async Task<IActionResult> Edit(string id)
        {
            if (string.IsNullOrEmpty(id) || _context.Staffs == null)
            {
                _logger.LogWarning("Edit action called with null or empty id.");
                return NotFound();
            }

            var staff = await _context.Staffs.FindAsync(id);
            if (staff == null)
            {
                _logger.LogWarning("Edit action: Staff with id {Id} not found.", id);
                return NotFound();
            }
            return View(staff);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, Staff staff)
        {
            if (id != staff.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var existingStaff = await _context.Staffs.FindAsync(id);
                    if (existingStaff == null)
                    {
                        return NotFound();
                    }

                    // Manually update the properties you want to change
                    existingStaff.FullName = staff.FullName;
                    existingStaff.IdentityNumber = staff.IdentityNumber;
                    existingStaff.HireDate = staff.HireDate;
                    existingStaff.Gender = staff.Gender;
                    existingStaff.Role = staff.Role;

                    _context.Update(existingStaff);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    if (!StaffExists(staff.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        _logger.LogError(ex, "Concurrency error occurred while updating staff with id {Id}.", staff.Id);
                        ModelState.AddModelError(string.Empty, "Unable to save changes. The staff was updated or deleted by another user.");
                        return View(staff);
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(staff);
        }



        private bool StaffExists(string id)
        {
            return (_context.Staffs.Any(s => s.Id == id));
        }


        public async Task<IActionResult> Delete(string id)
        {
            if (string.IsNullOrEmpty(id) || _context.Staffs == null)
            {
                _logger.LogWarning("Delete action called with null or empty id.");
                return NotFound();
            }

            var staff = await _context.Staffs.Include(s => s.SoldTickets)
                .FirstOrDefaultAsync(s => s.Id == id);
            if (staff == null)
            {
                _logger.LogWarning("Delete action: Staff with id {Id} not found.", id);
                return NotFound();
            }

            if (staff.SoldTickets.Count() > 0)
            {
                StatusMessage = "Error: Staff has sold tickets. Please delete sold tickets first.";
                return RedirectToAction(nameof(Index));
            }

            return View(staff);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Staffs == null)
            {
                return Problem("Entity set 'Staffs' is null.");
            }
            var staff = await _context.Staffs.FindAsync(id);
            if (staff != null)
            {
                _context.Staffs.Remove(staff);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }
    }
}
