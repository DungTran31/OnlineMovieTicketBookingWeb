using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class Customer : AppUser
    {
        public Customer()
        {
            BookedTickets = new HashSet<BookedTicket>();
        }

        [Key]
        [Display(Name = "Mã khách hàng")]
        [Required(ErrorMessage = "Mã khách hàng không được để trống")]
        public string? Id { get; set; }

        [Display(Name = "Họ và tên")]
        [Required(ErrorMessage = "Họ và tên không được để trống")]
        [StringLength(100, ErrorMessage = "Họ và tên không được vượt quá 100 ký tự")]
        public string? FullName { get; set; }

        [Display(Name = "Số CMND/CCCD")]
        [Required(ErrorMessage = "Số CMND/CCCD không được để trống")]
        [StringLength(50, ErrorMessage = "Số CMND/CCCD không được vượt quá 50 ký tự")]
        public string? IdentityNumber { get; set; }

        [Display(Name = "Số điện thoại")]
        [StringLength(15, ErrorMessage = "Số điện thoại không được vượt quá 15 ký tự")]
        public string? PhoneNumber { get; set; }

        [Display(Name = "Email")]
        [StringLength(100, ErrorMessage = "Email không được vượt quá 100 ký tự")]
        [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ")]
        public string Email { get; set; }


        [Display(Name = "Ngày đăng ký")]
        [DataType(DataType.Date, ErrorMessage = "Ngày đăng ký không hợp lệ")]
        public DateTime RegistrationDate { get; set; }

        [Display(Name = "Giới tính")]
        [StringLength(10, ErrorMessage = "Giới tính không được vượt quá 10 ký tự")]
        public string? Gender { get; set; }

        public ICollection<BookedTicket> BookedTickets { get; set; }
    }
}
