using Microsoft.AspNetCore.Mvc;
using OnlineMovieTicketBookingWeb.Models;

namespace OnlineMovieTicketBookingWeb.ViewComponents
{
    public class RenderViewComponent : ViewComponent
    {
        private List<MenuItem> MenuItems = new List<MenuItem>();
        public RenderViewComponent()
        {
            MenuItems = new List<MenuItem>() {
                    new MenuItem() {Id=1, Name="Home", Link="Home/List", Icon="fas fa-home" },
                    new MenuItem() {Id=2, Name="Phim đang chiếu", Link="Phim đang chiếu/List", Icon="fas fa-film" },
                    new MenuItem() {Id=3, Name="Giá vé", Link="Giá vé/List", Icon="fas fa-ticket-alt" },
                    new MenuItem() {Id=4, Name="Rạp", Link="Rạp/List", Icon="fas fa-building" },
                    new MenuItem() {Id=5, Name="Tin mới và ưu đãi", Link="Tin mới và ưu đãi/List", Icon="fas fa-newspaper" }
                };
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View("RenderLeftMenu", MenuItems);
        }
    }
}
