using Microsoft.AspNetCore.Mvc;
using OnlineMovieTicketBookingWeb.Data;
using OnlineMovieTicketBookingWeb.Models;

namespace OnlineMovieTicketBookingWeb.ViewComponents
{
    public class MovieGenreViewComponent : ViewComponent
    {
        private readonly MovieTicketBookingContext _context;
        private readonly List<MovieGenre> movieGenres;

        public MovieGenreViewComponent(MovieTicketBookingContext context)
        {
            _context = context;
            movieGenres = _context.MovieGenres.ToList();
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            await Task.CompletedTask;
            return View("RenderMovieGenre", movieGenres);
        }
    }
}
