using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class BookedTicket
    {
        // Khóa chính kết hợp: CustomerId và SoldTicketId
        [Display(Name = "Mã khách hàng")]
        [Required(ErrorMessage = "Mã khách hàng không được để trống")]
        [StringLength(450, ErrorMessage = "Mã khách hàng không được vượt quá 450 ký tự")]
        public string? CustomerId { get; set; }

        [ForeignKey("CustomerId")]
        public Customer? Customer { get; set; }

        [Display(Name = "Mã vé bán")]
        [Required(ErrorMessage = "Mã vé bán không được để trống")]
        [StringLength(50, ErrorMessage = "Mã vé bán không được vượt quá 50 ký tự")]
        public string? SoldTicketId { get; set; }

        [ForeignKey("SoldTicketId")]
        public SoldTicket? SoldTicket { get; set; }
    }
}
