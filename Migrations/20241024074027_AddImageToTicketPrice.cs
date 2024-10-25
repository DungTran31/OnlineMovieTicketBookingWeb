using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace OnlineMovieTicketBookingWeb.Migrations
{
    /// <inheritdoc />
    public partial class AddImageToTicketPrice : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Image",
                table: "TicketPrice",
                type: "nvarchar(255)",
                maxLength: 255,
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Image",
                table: "TicketPrice");
        }
    }
}
