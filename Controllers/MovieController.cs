using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OnlineMovieTicketBookingWeb.Data;
using OnlineMovieTicketBookingWeb.Models;
using System.IO;
using System.Threading.Tasks;

namespace OnlineMovieTicketBookingWeb.Controllers
{
    public class MovieController : Controller
    {
        private readonly MovieTicketBookingContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly ILogger<MovieController> _logger;

        public MovieController(MovieTicketBookingContext context, IWebHostEnvironment webHostEnvironment, ILogger<MovieController> logger)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
            _logger = logger;
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

        [Authorize(Roles = RoleName.Administrator + "," + RoleName.Staff)]
        public async Task<IActionResult> Create()
        {
            ViewData["MovieGenreId"] = new SelectList(await _context.MovieGenres.ToListAsync(), "Id", "Name");
            return View();
        }

        [HttpPost]
        [Authorize(Roles = RoleName.Administrator + "," + RoleName.Staff)]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,ReleaseDate,MovieGenreId,PosterFile,Duration,AgeRestriction,Language,Actors,Country,Producer,Summary,Status,IsDeleted")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                if (movie.PosterFile != null)
                {
                    string uniqueFileName = UploadFile(movie.PosterFile);
                    movie.Poster = uniqueFileName;
                }

                _context.Add(movie);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            else
            {
                // Log the validation errors
                foreach (var modelState in ViewData.ModelState.Values)
                {
                    foreach (var error in modelState.Errors)
                    {
                        Console.WriteLine(error.ErrorMessage);
                    }
                }
            }

            ViewData["MovieGenreId"] = new SelectList(await _context.MovieGenres.ToListAsync(), "Id", "Name", movie.MovieGenreId);
            return View(movie);
        }


        [Authorize(Roles = RoleName.Administrator + "," + RoleName.Staff)]
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var movie = await _context.Movies.FindAsync(id);
            if (movie == null)
            {
                return NotFound();
            }
            ViewData["MovieGenreId"] = new SelectList(await _context.MovieGenres.ToListAsync(), "Id", "Name", movie.MovieGenreId);
            return View(movie);
        }


        [HttpPost]
        [Authorize(Roles = RoleName.Administrator + "," + RoleName.Staff)]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,Name,ReleaseDate,MovieGenreId,PosterFile,Duration,AgeRestriction,Language,Actors,Country,Producer,Summary,Status,IsDeleted")] Movie movie)
        {
            if (id != movie.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (movie.PosterFile != null)
                    {
                        string uniqueFileName = UploadFile(movie.PosterFile);
                        movie.Poster = uniqueFileName;
                    }

                    _context.Update(movie);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MovieExists(movie.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["MovieGenreId"] = new SelectList(await _context.MovieGenres.ToListAsync(), "Id", "Name", movie.MovieGenreId);
            return View(movie);
        }
        private bool MovieExists(string id)
        {
            return (_context.Movies?.Any(e => e.Id == id)).GetValueOrDefault();
        }


        [Authorize(Roles = RoleName.Administrator + "," + RoleName.Staff)]
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var movie = await _context.Movies.Include(m => m.Screenings)
                .Include(m => m.MovieGenre)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (movie == null)
            {
                return NotFound();
            }

            return View(movie);
        }


        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = RoleName.Administrator + "," + RoleName.Staff)]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (id == null)
            {
                _logger.LogWarning("DeleteConfirmed: Movie ID is null.");
                return NotFound();
            }

            var movie = await _context.Movies.FindAsync(id);
            if (movie == null)
            {
                _logger.LogWarning("DeleteConfirmed: Movie with ID {MovieId} not found.", id);
                return NotFound();
            }

            try
            {
                _context.Movies.Remove(movie);
                await _context.SaveChangesAsync();
                _logger.LogInformation("DeleteConfirmed: Movie with ID {MovieId} successfully deleted.", id);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "DeleteConfirmed: Error deleting movie with ID {MovieId}.", id);
                throw;
            }

            return RedirectToAction(nameof(Index));
        }


        private string UploadFile(IFormFile file)
        {
            string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "images", "Movies");
            string uniqueFileName = Guid.NewGuid().ToString() + "_" + file.FileName;
            string filePath = Path.Combine(uploadsFolder, uniqueFileName);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                file.CopyTo(fileStream);
            }
            return uniqueFileName;
        }
    }
}
