using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineMovieTicketBookingWeb.Data;

namespace OnlineMovieTicketBookingWeb.Areas.Database.Controllers
{
    [Area("Database")]
    [Route("/[controller]/[action]")]
    public class DbManageController : Controller
    {
        private MovieTicketBookingContext db;

        public DbManageController(MovieTicketBookingContext context)
        {
            db = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult DeleteDb()
        {
            return View();
        }

        [TempData]
        public string StatusMessage { get; set; }

        [HttpPost]
        public async Task<IActionResult> DeleteDbAsync()
        {
            var success = await db.Database.EnsureDeletedAsync();

            StatusMessage = success ? "Xóa Database thành công" : "Không xóa được Database";

            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        public async Task<IActionResult> Migrate()
        {
            await db.Database.MigrateAsync();

            StatusMessage = "Cập nhật Database thành công";

            return RedirectToAction(nameof(Index));
        }

    }
}
