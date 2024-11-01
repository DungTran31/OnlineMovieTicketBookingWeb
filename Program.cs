 using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using OnlineMovieTicketBookingWeb.Data;
using OnlineMovieTicketBookingWeb.Models;
using OnlineMovieTicketBookingWeb.Services;
using System.Configuration;

namespace OnlineMovieTicketBookingWeb
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            builder.Configuration.AddUserSecrets<Program>();

            // Add services to the container.
            builder.Services.AddDbContext<MovieTicketBookingContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("MovieTicketBookingContext")));

            builder.Services.AddIdentity<AppUser, IdentityRole>()
                .AddEntityFrameworkStores<MovieTicketBookingContext>()
                .AddDefaultTokenProviders();

            // Register UserStore, UserManager, SignInManager, PasswordHasher, UserClaimsPrincipalFactory, and UserConfirmation for Staff and Customer
            builder.Services.AddScoped<IUserStore<Staff>, UserStore<Staff, IdentityRole, MovieTicketBookingContext>>();
            builder.Services.AddScoped<UserManager<Staff>>();
            builder.Services.AddScoped<SignInManager<Staff>>();
            builder.Services.AddScoped<IPasswordHasher<Staff>, PasswordHasher<Staff>>();
            builder.Services.AddScoped<IUserClaimsPrincipalFactory<Staff>, UserClaimsPrincipalFactory<Staff, IdentityRole>>();
            builder.Services.AddScoped<IUserConfirmation<Staff>, DefaultUserConfirmation<Staff>>();

            builder.Services.AddScoped<IUserStore<Customer>, UserStore<Customer, IdentityRole, MovieTicketBookingContext>>();
            builder.Services.AddScoped<UserManager<Customer>>();
            builder.Services.AddScoped<SignInManager<Customer>>();
            builder.Services.AddScoped<IPasswordHasher<Customer>, PasswordHasher<Customer>>();
            builder.Services.AddScoped<IUserClaimsPrincipalFactory<Customer>, UserClaimsPrincipalFactory<Customer, IdentityRole>>();
            builder.Services.AddScoped<IUserConfirmation<Customer>, DefaultUserConfirmation<Customer>>();



            builder.Services.AddOptions();
            builder.Services.Configure<MailSettings>(builder.Configuration.GetSection("MailSettings"));
            builder.Services.AddSingleton<IEmailSender, SendMailService>();

            builder.Services.Configure<IdentityOptions>(options =>
            {
                // Thiết lập về Password
                options.Password.RequireDigit = false; // Không bắt phải có số
                options.Password.RequireLowercase = false; // Không bắt phải có chữ thường
                options.Password.RequireNonAlphanumeric = false; // Không bắt ký tự đặc biệt
                options.Password.RequireUppercase = false; // Không bắt buộc chữ in
                options.Password.RequiredLength = 3; // Số ký tự tối thiểu của password
                options.Password.RequiredUniqueChars = 1; // Số ký tự riêng biệt

                // Cấu hình Lockout - khóa user
                options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5); // Khóa 5 phút
                options.Lockout.MaxFailedAccessAttempts = 3; // Thất bại 3 lầ thì khóa
                options.Lockout.AllowedForNewUsers = true;

                // Cấu hình về User.
                options.User.AllowedUserNameCharacters = // các ký tự đặt tên user
                    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._@+";
                options.User.RequireUniqueEmail = true;  // Email là duy nhất

                // Cấu hình đăng nhập.
                options.SignIn.RequireConfirmedEmail = true;            // Cấu hình xác thực địa chỉ email (email phải tồn tại)
                options.SignIn.RequireConfirmedPhoneNumber = false;     // Xác thực số điện thoại
                options.SignIn.RequireConfirmedAccount = true;
            });

            builder.Services.ConfigureApplicationCookie(options =>
            {
                options.LoginPath = "/login/";
                options.LogoutPath = "/logout/";
                options.AccessDeniedPath = "/khongduoctruycap.html";
            });

            builder.Services.AddAuthentication()
                .AddGoogle(options =>
                {
                    var gconfig = builder.Configuration.GetSection("Authentication:Google");
                    options.ClientId = gconfig["ClientId"] ?? throw new InvalidOperationException("Google ClientId is not configured.");
                    options.ClientSecret = gconfig["ClientSecret"] ?? throw new InvalidOperationException("Google ClientSecret is not configured.");
                    options.CallbackPath = "/dang-nhap-tu-google";
                });
                //.AddFacebook(options =>
                //{
                //    var fconfig = builder.Configuration.GetSection("Authentication:Facebook");
                //    options.AppId = fconfig["AppId"] ?? throw new InvalidOperationException("Facebook AppId is not configured.");
                //    options.AppSecret = fconfig["AppSecret"] ?? throw new InvalidOperationException("Facebook AppSecret is not configured.");
                //    options.CallbackPath = "/dang-nhap-tu-facebook";
                //});
            // .AddTwitter()
            // .AddMicrosoftAccount()

            builder.Services.AddAuthorization(Services =>
            {
                Services.AddPolicy("ViewManageMenu", policy => policy.RequireAuthenticatedUser().RequireRole(RoleName.Administrator));
            });

            builder.Services.AddSingleton<IdentityErrorDescriber, AppIdentityErrorDescriber>();

            builder.Services.AddControllersWithViews();

            var app = builder.Build();

            using (var scope = app.Services.CreateScope())
            {
                var services = scope.ServiceProvider;
                DbInitializer.Initialize(services);
            }

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseStatusCodePagesWithRedirects("/Home/NotFound");

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.MapControllerRoute(
                name: "areas",
                pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}
