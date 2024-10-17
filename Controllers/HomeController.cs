using Microsoft.AspNetCore.Mvc;
using OnlineMovieTicketBookingWeb.Models;
using OnlineMovieTicketBookingWeb.Data;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;

namespace OnlineMovieTicketBookingWeb.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        MovieTicketBookingContext _context;

        public HomeController(ILogger<HomeController> logger, MovieTicketBookingContext context)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<IActionResult> Index([FromQuery(Name = "p")] int currentPage)
        {
            var model = new MovieListModel();
            model.currentPage = currentPage;

            var qr = _context.Movies.OrderBy(m => m.Name);

            model.totalMovies = await qr.CountAsync(); 
            model.countPages = (int)Math.Ceiling((double)model.totalMovies / model.ITEMS_PER_PAGE);

            if (model.currentPage < 1)
                model.currentPage = 1;
            if (model.currentPage > model.countPages)
                model.currentPage = model.countPages;

            var qr1 = qr.Skip((model.currentPage - 1) * model.ITEMS_PER_PAGE)
                        .Take(model.ITEMS_PER_PAGE);

            model.movies = await qr1.ToListAsync();
            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
