using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineMovieTicketBookingWeb.Data;
using OnlineMovieTicketBookingWeb.Models;

namespace OnlineMovieTicketBookingWeb.Controllers
{
    public class MovieController : Controller
    {
        MovieTicketBookingContext _context;

        public MovieController(MovieTicketBookingContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(string status)
        {
            IQueryable<Movie> moviesQuery = _context.Movies.OrderBy(m => m.Name).Include(m => m.MovieGenre);

            if (status == "dangchieu")
            {
                moviesQuery = moviesQuery.Where(m => m.ReleaseDate <= DateTime.Now);
            }
            else if (status == "sapchieu")
            {
                moviesQuery = moviesQuery.Where(m => m.ReleaseDate > DateTime.Now);
            }

            var movies = await moviesQuery.ToListAsync();
            return View(movies);
        }

        public async Task<IActionResult> MovieDetails(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var movie = await _context.Movies.Include(m => m.MovieGenre)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (movie == null)
            {
                return NotFound();
            }

            return View(movie);
        }
    }
}
