using System.ComponentModel.DataAnnotations;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class TicketPrice
    {
        public TicketPrice()
        {
            SoldTickets = new HashSet<SoldTicket>();
        }

        [Key]
        [Display(Name = "Mã Giá vé")]
        public int Id { get; set; }

        [Required(ErrorMessage = "Tên giá vé không được để trống")]
        [StringLength(100, ErrorMessage = "Tên giá vé không được vượt quá 100 ký tự")]
        [Display(Name = "Tên giá vé")]
        public string? Name { get; set; }

        [Required(ErrorMessage = "Giá vé không được để trống")]
        [Range(0, int.MaxValue, ErrorMessage = "Giá vé phải là một số không âm")]
        [Display(Name = "Giá vé")]
        public int Price { get; set; }
        [Display(Name = "Image")]
        [StringLength(255, ErrorMessage = "URL của Image không được vượt quá 255 ký tự")]
        public string? Image { get; set; }

        public ICollection<SoldTicket> SoldTickets { get; set; }
    }
}
