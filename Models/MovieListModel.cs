namespace OnlineMovieTicketBookingWeb.Models
{
    public class MovieListModel
    {
        public int totalMovies { get; set; }
        public int countPages { get; set; }

        public int ITEMS_PER_PAGE { get; set; } = 3;

        public int currentPage { get; set; }

        public List<Movie>? movies { get; set; }
    }
}
