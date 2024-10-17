using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace OnlineMovieTicketBookingWeb.Migrations
{
    /// <inheritdoc />
    public partial class AddPosterToMovie : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Poster",
                table: "Movie",
                type: "nvarchar(255)",
                maxLength: 255,
                nullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "RegistrationDate",
                table: "Customer",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Poster",
                table: "Movie");

            migrationBuilder.AlterColumn<DateTime>(
                name: "RegistrationDate",
                table: "Customer",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);
        }
    }
}
