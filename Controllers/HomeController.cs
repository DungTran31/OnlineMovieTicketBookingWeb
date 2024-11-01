using Microsoft.AspNetCore.Mvc;
using OnlineMovieTicketBookingWeb.Models;
using OnlineMovieTicketBookingWeb.Data;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using System.Drawing.Printing;

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

        private int pageSize = 3;
        public async Task<IActionResult> Index(int? mid, int pageIndex = 1)
        {
            var movies = (IQueryable<Movie>)_context.Movies.Include(m => m.MovieGenre);
            if (mid != null && mid != 0)
            {
                movies = (IQueryable<Movie>)_context.Movies
                    .Where(l => l.MovieGenreId == mid)
                    .Include(m => m.MovieGenre);
            }
            //tính số trang
            int pageNum = (int)Math.Ceiling(await movies.CountAsync() / (float)pageSize);
            //trả số trang về view để hiển thị nav-trang
            ViewBag.pageNum = pageNum;
            ViewBag.currentPage = pageIndex;
            //lấy dữ liệu trang đầu
            var result = await movies.Take(pageSize).ToListAsync();
            return View(result);

        }


        public async Task<IActionResult> MovieFilter(int? mid, string? keyword, int? pageIndex)
        {
            var movies = (IQueryable<Movie>)_context.Movies.Include(m => m.MovieGenre);
            //lấy chỉ số trang, nếu chỉ số trang null thì gán ngầm định bằng 1
            int page = (int)(pageIndex == null || pageIndex <= 0 ? 1 : pageIndex);
            //nếu có mid thì lọc learner theo mid (chuyên ngành)
            if (mid != null && mid != 0)
            {
                movies = movies.Where(l => l.MovieGenreId == mid);
                //gửi mid về view để ghi lại trên nav-phân trang 
                ViewBag.mid = mid;
            }

            //nếu có keyword thì tìm kiếm theo tên
            if (!string.IsNullOrEmpty(keyword))
            {
                movies = movies.Where(m => m.Name != null && m.Name.ToLower().Contains(keyword.ToLower()));
                ViewBag.keyword = keyword; // Gửi keyword về view để ghi trên nav-phân trang
            }
            //tính số trang
            int pageNum = (int)Math.Ceiling(await movies.CountAsync() / (float)pageSize);
            //gửi số trang về view để hiển thị nav-trang          
            ViewBag.pageNum = pageNum;
            ViewBag.currentPage = page;
            //chọn dữ liệu trong trang hiện tại
            var result = movies.Skip(pageSize * (page - 1))
                            .Take(pageSize).Include(m => m.MovieGenre);


            return PartialView("MovieList", result);
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
