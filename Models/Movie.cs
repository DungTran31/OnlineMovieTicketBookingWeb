using System.ComponentModel.DataAnnotations;

namespace OnlineMovieTicketBookingWeb.Models
{
    public class Movie
    {
        public Movie()
        {
            Screenings = new HashSet<Screening>();
        }
        [Key]
        [Display(Name = "Mã phim")]
        [Required(ErrorMessage = "Mã phim không được để trống")]
        [StringLength(50, ErrorMessage = "Mã phim không được vượt quá 50 ký tự")]
        public string? Id { get; set; }

        [Display(Name = "Tên phim")]
        [Required(ErrorMessage = "Tên phim không được để trống")]
        [StringLength(100, ErrorMessage = "Tên phim không được vượt quá 100 ký tự")]
        public string? Name { get; set; }

        [Display(Name = "Thời lượng (phút)")]
        [Required(ErrorMessage = "Thời lượng phim không được để trống")]
        [Range(1, int.MaxValue, ErrorMessage = "Thời lượng phải là số dương")]
        public int Duration { get; set; }

        [Display(Name = "Giới hạn độ tuổi")]
        [Required(ErrorMessage = "Giới hạn độ tuổi không được để trống")]
        [Range(0, 100, ErrorMessage = "Giới hạn độ tuổi phải từ 0 đến 100")]
        public int AgeRestriction { get; set; }

        [Display(Name = "Ngày phát hành")]
        public DateTime ReleaseDate { get; set; }

        [Display(Name = "Ngôn ngữ")]
        [StringLength(50, ErrorMessage = "Ngôn ngữ không được vượt quá 50 ký tự")]
        public string? Language { get; set; }

        [Display(Name = "Diễn viên")]
        [StringLength(100, ErrorMessage = "Diễn viên không được vượt quá 100 ký tự")]
        public string? Actors { get; set; }

        [Display(Name = "Quốc gia")]
        [StringLength(50, ErrorMessage = "Quốc gia không được vượt quá 50 ký tự")]
        public string? Country { get; set; }

        [Display(Name = "Nhà sản xuất")]
        [StringLength(100, ErrorMessage = "Nhà sản xuất không được vượt quá 100 ký tự")]
        public string? Producer { get; set; }

        [Display(Name = "Tóm tắt nội dung")]
        [StringLength(255, ErrorMessage = "Tóm tắt không được vượt quá 255 ký tự")]
        public string? Summary { get; set; }

        [Display(Name = "Trạng thái")]
        [StringLength(50, ErrorMessage = "Trạng thái không được vượt quá 50 ký tự")]
        public string? Status { get; set; }

        [Display(Name = "Đã xóa")]
        public bool IsDeleted { get; set; }

        [Display(Name = "Thể loại phim")]
        [StringLength(100, ErrorMessage = "Thể loại phim không được vượt quá 100 ký tự")]
        public string? MovieGenre { get; set; }

        public ICollection<Screening> Screenings { get; set; }
    }
}
