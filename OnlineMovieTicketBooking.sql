CREATE DATABASE MovieTicketBooking;

-- Table: seat_type (loai_ghe)
CREATE TABLE SeatType (
    id NVARCHAR(50) PRIMARY KEY,
    seatname NVARCHAR(100),
    surcharge INT
);

-- Table: ticket_price (gia_ve)
CREATE TABLE TicketPrice (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    price INT
);

-- Table: customer (khach_hang)
CREATE TABLE Customer (
    id NVARCHAR(450) PRIMARY KEY,
    fullname NVARCHAR(100),
    identitynumber NVARCHAR(50),
    address NVARCHAR(255),
    registrationdate DATETIME2(7),
    dateofbirth DATETIME2(7),
    gender NVARCHAR(10)
);


-- Table: screening_room (phong_chieu)
CREATE TABLE ScreeningRoom (
    id INT PRIMARY KEY,
    rowcount INT,
    seatcount INT
);

-- Table: seat (ghe_ngoi)
CREATE TABLE Seat (
    id INT PRIMARY KEY,
    rowposition NVARCHAR(50),
    seatposition INT,
    ischosen NVARCHAR(10),
    screeningroomid INT,
    seattypeid NVARCHAR(50),
    FOREIGN KEY (screeningroomid) REFERENCES screeningroom(id),
    FOREIGN KEY (seattypeid) REFERENCES seattype(id)
);

-- phim 
CREATE TABLE Movie (
    id NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(100),
    duration INT,
    agerestriction INT,
    releasedate DATETIME2(7),
    language NVARCHAR(50),
    actors NVARCHAR(100),
    country NVARCHAR(50),
    producer NVARCHAR(100),
    summary NVARCHAR(255),
    status NVARCHAR(50),
    isdeleted BIT,
    moviegenre NVARCHAR(100) 
);


--suat_chieu
CREATE TABLE Screening (
    id NVARCHAR(50) PRIMARY KEY,
    starttime TIME(7),
    endtime TIME(7),
    screeningdate DATETIME2(7),
    movieid NVARCHAR(50),
    screeningroomid INT,
    movieformat NVARCHAR(100), 
    FOREIGN KEY (movieid) REFERENCES movie(id),
    FOREIGN KEY (screeningroomid) REFERENCES screeningroom(id)
);

--nguoi_dung
CREATE TABLE Staff (
    id NVARCHAR(50) PRIMARY KEY,
    fullname NVARCHAR(100),
    identitynumber NVARCHAR(50),
    address NVARCHAR(255),
    hire_date DATETIME2(7),
    gender NVARCHAR(10),
    isactive bit,
    role NVARCHAR(50)
);

-- Table: sold_ticket (ve_ban)
CREATE TABLE SoldTicket (
    id NVARCHAR(50) PRIMARY KEY,
    solddate DATETIME2(7),
    totalprice INT,
    screeningid NVARCHAR(50),
    ticketpriceid INT,
    seatid INT,
    staffid NVARCHAR(50),
    FOREIGN KEY (screeningid) REFERENCES screening(id),
    FOREIGN KEY (ticketpriceid) REFERENCES ticketprice(id),
    FOREIGN KEY (seatid) REFERENCES seat(id),
    FOREIGN KEY (staffid) REFERENCES staff(id)
);

-- Table: booked_ticket (ve_dat)
CREATE TABLE BookedTicket (
    soldticketid NVARCHAR(50),  
    customerid NVARCHAR(450),
	PRIMARY KEY (customerid, soldticketid),
	FOREIGN KEY (soldticketid) REFERENCES soldticket(id),
    FOREIGN KEY (customerid) REFERENCES customer(id),           
);

INSERT INTO SeatType (id, seatname, surcharge) VALUES
(N'LG01', N'Ghế thường', 0),
(N'LG02', N'Ghế VIP', 50000),
(N'LG03', N'Ghế đôi', 100000),
(N'LG04', N'Ghế Deluxe', 75000);

INSERT INTO TicketPrice (name, price) VALUES
(N'Vé trẻ em', 50000),
(N'Vé người lớn', 100000),
(N'Vé sinh viên', 80000);

INSERT INTO movie (id, name, duration, agerestriction, releasedate, language, actors, country, producer, summary, status, isdeleted, moviegenre) VALUES
(N'P01', N'Avengers: Endgame', 181, 13, '2019-04-26', N'Tiếng Anh', N'Robert Downey Jr., Chris Evans', N'Mỹ', N'Marvel Studios', N'Cuộc chiến cuối cùng giữa các siêu anh hùng và Thanos', N'Đang chiếu', 0, N'Hành động'),
(N'P02', N'Frozen II', 103, 0, '2019-11-22', N'Tiếng Anh', N'Idina Menzel, Kristen Bell', N'Mỹ', N'Walt Disney Animation Studios', N'Hành trình mới của Elsa và Anna để khám phá quá khứ của gia đình họ', N'Đang chiếu', 0, N'Hoạt hình'),
(N'P03', N'Parasite', 132, 16, '2019-05-30', N'Tiếng Hàn', N'Song Kang-ho, Lee Sun-kyun', N'Hàn Quốc', N'Barunson E&A', N'Câu chuyện về sự chênh lệch giàu nghèo trong xã hội Hàn Quốc', N'Đã chiếu', 0, N'Kinh dị'),
(N'P04', N'The Conjuring', 112, 18, '2013-07-19', N'Tiếng Anh', N'Vera Farmiga, Patrick Wilson', N'Mỹ', N'New Line Cinema', N'Một cặp vợ chồng điều tra những hiện tượng siêu nhiên', N'Đã chiếu', 0, N'Kinh dị'),
(N'P05', N'Avatar', 162, 13, '2009-12-18', N'Tiếng Anh', N'Sam Worthington, Zoe Saldana', N'Mỹ', N'20th Century Fox', N'Một câu chuyện khoa học viễn tưởng về hành tinh Pandora', N'Đang chiếu', 0, N'Phiêu lưu');

INSERT INTO Users (Id, UserName, NormalizedUserName, Email, NormalizedEmail, PasswordHash, SecurityStamp, ConcurrencyStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, AccessFailedCount, EmailConfirmed) 
VALUES 
(N'KH01', N'kh01@example.com', N'KH01@EXAMPLE.COM', N'kh01@example.com', N'KH01@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0),
(N'KH02', N'kh02@example.com', N'KH02@EXAMPLE.COM', N'kh02@example.com', N'KH02@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0),
(N'KH03', N'kh03@example.com', N'KH03@EXAMPLE.COM', N'kh03@example.com', N'KH03@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0),
(N'KH04', N'kh04@example.com', N'KH04@EXAMPLE.COM', N'kh04@example.com', N'KH04@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0),
(N'KH05', N'kh05@example.com', N'KH05@EXAMPLE.COM', N'kh05@example.com', N'KH05@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0);

INSERT INTO customer (id, fullname, identitynumber, address, registrationdate, dateofbirth, gender) VALUES
(N'KH01', N'Nguyễn Văn T', N'123456789', N'Số 1, Đường T, Quận 1', '2024-01-01', '1990-05-15', N'Nam'),
(N'KH02', N'Trần Thị Y', N'987654321', N'Số 2, Đường Y, Quận 2', '2024-02-01', '1995-07-20', N'Nữ'),
(N'KH03', N'Phạm Minh H', N'321321321', N'Số 3, Đường H, Quận 3', '2024-03-01', '1992-11-11', N'Nam'),
(N'KH04', N'Lê Thị K', N'654987321', N'Số 4, Đường K, Quận 4', '2024-04-01', '1988-03-30', N'Nữ'),
(N'KH05', N'Vũ Văn M', N'456123789', N'Số 5, Đường M, Quận 5', '2024-05-01', '1991-12-25', N'Nam');

INSERT INTO ScreeningRoom ([RowCount], seatcount) VALUES
(10, 15),
(8, 12),
(12, 18),
(6, 10),
(14, 20);

INSERT INTO seat ( rowposition, seatposition, ischosen, screeningroomid, seattypeid) VALUES
(N'A', 1, N'Chưa chọn', 1, N'LG01'),
(N'A', 2, N'Chưa chọn', 1, N'LG02'),
(N'B', 3, N'Đã chọn', 1, N'LG03'),
(N'C', 4, N'Chưa chọn', 2, N'LG04'),
(N'D', 5, N'Đã chọn', 2, N'LG02');

INSERT INTO screening (id, starttime, endtime, screeningdate, movieid, screeningroomid, movieformat) VALUES
(N'SC01', '14:00:00', '16:00:00', '2024-10-10', N'P01', 1, N'DD01'),
(N'SC02', '18:00:00', '20:30:00', '2024-10-10', N'P03', 2, N'DD02'),
(N'SC03', '20:00:00', '22:00:00', '2024-10-11', N'P02', 3, N'DD03'),
(N'SC04', '15:30:00', '17:30:00', '2024-10-12', N'P04', 4, N'DD04'),
(N'SC05', '10:00:00', '12:30:00', '2024-10-13', N'P05', 5, N'DD05');

INSERT INTO Users (Id, UserName, NormalizedUserName, Email, NormalizedEmail, PasswordHash, SecurityStamp, ConcurrencyStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEnd, LockoutEnabled, AccessFailedCount, EmailConfirmed) 
VALUES 
(N'NV01', N'nv01@example.com', N'NV01@EXAMPLE.COM', N'nv01@example.com', N'NV01@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0),
(N'NV02', N'nv02@example.com', N'NV02@EXAMPLE.COM', N'nv02@example.com', N'NV02@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0),
(N'NV03', N'nv03@example.com', N'NV03@EXAMPLE.COM', N'nv03@example.com', N'NV03@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0),
(N'NV04', N'nv04@example.com', N'NV04@EXAMPLE.COM', N'nv04@example.com', N'NV04@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0),
(N'NV05', N'nv05@example.com', N'NV05@EXAMPLE.COM', N'nv05@example.com', N'NV05@EXAMPLE.COM', N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0, 0);

INSERT INTO staff (id, FullName, identitynumber, address, hiredate, gender, isactive, role) VALUES
(N'NV01', N'Nguyễn Văn A', N'123456789', N'Số 1, Đường A, Quận 1', '2024-01-01', N'Nam', 1, N'Nhân viên bán vé'),
(N'NV02', N'Trần Thị B', N'987654321', N'Số 2, Đường B, Quận 2', '2024-02-01', N'Nữ', 1, N'Quản lý'),
(N'NV03', N'Phạm Minh C', N'123123123', N'Số 3, Đường C, Quận 3', '2024-03-01', N'Nam', 1, N'Nhân viên bán vé'),
(N'NV04', N'Lê Thị D', N'321321321', N'Số 4, Đường D, Quận 4', '2024-04-01', N'Nữ', 1, N'Nhân viên bán vé'),
(N'NV05', N'Vũ Văn E', N'456456456', N'Số 5, Đường E, Quận 5', '2024-05-01', N'Nam', 1, N'Nhân viên bán vé');

INSERT INTO SoldTicket (id, solddate, totalprice, screeningid, ticketpriceid, seatid, staffid) VALUES
(N'VB01', '2024-10-10', 50000, N'SC01', 1, 1, N'NV01'),
(N'VB02', '2024-10-10', 150000, N'SC02', 2, 2, N'NV02'),
(N'VB03', '2024-10-11', 180000, N'SC03', 3, 3, N'NV03'),
(N'VB04', '2024-10-12', 200000, N'SC04', 3, 4, N'NV04'),
(N'VB05', '2024-10-13', 180000, N'SC05', 3, 5, N'NV05');

INSERT INTO BookedTicket (soldticketid, customerid) VALUES
(N'VB01', N'KH01'),  
(N'VB02', N'KH02'),  
(N'VB03', N'KH03'),  
(N'VB04', N'KH01'),  
(N'VB05', N'KH04');  


DELETE FROM SoldTicket;
DELETE FROM BookedTicket;
DELETE FROM Screening;
DELETE FROM Seat;
DELETE FROM ScreeningRoom;
DELETE FROM Customer;
DELETE FROM staff;
DELETE FROM movie;
DELETE FROM TicketPrice;
DELETE FROM SeatType;

DBCC CHECKIDENT ('ticketprice', RESEED, 0);
