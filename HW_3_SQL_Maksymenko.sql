
/*Підключення БД*/
USE Hotels_HW

/*Видалення таблиць*/
DROP TABLE Hotels;
DROP TABLE Users;
DROP TABLE Rooms;
DROP TABLE RoomInHotel;
DROP TABLE Booking;
--DROP TABLE Additionals;

/*Створення таблиць*/


CREATE TABLE Hotels
(
  HotelID int IDENTITY NOT NULL PRIMARY KEY,
  Name nvarchar(50) NOT NULL,
  FoundationYear int NOT NULL,
  Address nvarchar(50) NOT NULL,
  Active bit NOT NULL
)

CREATE TABLE Users
(
  UserID int IDENTITY NOT NULL   PRIMARY KEY,
  Name nvarchar(50) NOT NULL,
  Email nvarchar(50) NOT NULL
)

CREATE TABLE Rooms
(
  RoomID int IDENTITY NOT NULL  PRIMARY KEY,
  Number int NOT NULL,
  Price float NOT NULL,
  ComfortLevel int NOT NULL,
  Capability int NOT NULL
)


CREATE TABLE RoomInHotel
(
  RoomsInHotelID int IDENTITY NOT NULL  PRIMARY KEY,
  HotelID int NOT NULL
  FOREIGN KEY REFERENCES Hotels(HotelID),
  RoomID int NOT NULL
  FOREIGN KEY REFERENCES Rooms(RoomID)
)


CREATE TABLE Booking
(
  ReservationID int IDENTITY NOT NULL  PRIMARY KEY,
  ReservationDate DATE NOT NULL,
  RoomInHotelID int NOT NULL   FOREIGN KEY REFERENCES RoomInHotel(RoomsInHotelID),
  UserID int NOT NULL   FOREIGN KEY REFERENCES Users(UserID),
  ArrivalDate DATE NOT NULL,
  DepartureDate DATE NOT NULL
)

/*Заповнення таблиць*/

INSERT INTO Hotels VALUES ('Turist', 1337, 'Geroiv Maydanu 100', 1);
INSERT INTO Hotels VALUES ('Plaza', 2017, 'Kamyanetska 83', 1);
INSERT INTO Hotels VALUES ('Edelweiss', 2010, 'Nebesnoi Sotni 4B', 1);

INSERT INTO Users VALUES ('Andrew', 'Andrew@gmail.com');
INSERT INTO Users VALUES ('Anton', 'Anton@mail.ru');
INSERT INTO Users VALUES ('Inna', 'Inna@rambler.ru');
INSERT INTO Users VALUES ('Misha', 'Misha@gmail.com');
INSERT INTO Users VALUES ('Vitya', 'Vutya@list.ru');
INSERT INTO Users VALUES ('Natasha', 'Natasha@pochta.ru');
INSERT INTO Users VALUES ('Sasha', 'Sasha@uk.ua');
INSERT INTO Users VALUES ('Vita', 'Vita@mail.ru');
INSERT INTO Users VALUES ('Anton', 'Anton@gmail.com');
INSERT INTO Users VALUES ('Andrew', 'Andrew@mail.ru');

INSERT INTO Rooms VALUES (1, 200, 1, 1);
INSERT INTO Rooms VALUES (7, 100, 1, 2);
INSERT INTO Rooms VALUES (8, 300, 2, 3);
INSERT INTO Rooms VALUES (241, 400, 3, 4);
INSERT INTO Rooms VALUES (100, 500, 2, 4);
INSERT INTO Rooms VALUES (99, 600, 2, 3);
INSERT INTO Rooms VALUES (101, 700, 3, 2);
INSERT INTO Rooms VALUES (101, 800, 3, 2);
INSERT INTO Rooms VALUES (413, 900, 2, 4);
INSERT INTO Rooms VALUES (103, 50, 1, 1);

INSERT INTO RoomInHotel VALUES (1,1);
INSERT INTO RoomInHotel VALUES (1,2);
INSERT INTO RoomInHotel VALUES (1,3);
INSERT INTO RoomInHotel VALUES (1,4);
INSERT INTO RoomInHotel VALUES (1,5);
INSERT INTO RoomInHotel VALUES (1,6);
INSERT INTO RoomInHotel VALUES (1,7);
INSERT INTO RoomInHotel VALUES (2,8);
INSERT INTO RoomInHotel VALUES (3,9);
INSERT INTO RoomInHotel VALUES (3,10);

INSERT INTO Booking VALUES ('2018-05-31', 1,1,'2018-06-01','2018-06-2')
INSERT INTO Booking VALUES ('2018-05-30', 2,2,'2018-06-03','2018-06-04')
INSERT INTO Booking VALUES ('2018-05-29', 3,3,'2018-06-05','2018-06-07')
INSERT INTO Booking VALUES ('2018-05-28', 4,4,'2018-06-08','2018-06-09')
INSERT INTO Booking VALUES ('2018-05-27', 5,5,'2018-06-10','2018-06-12')
INSERT INTO Booking VALUES ('2018-05-26', 6,6,'2018-06-13','2018-06-16')
INSERT INTO Booking VALUES ('2018-05-25', 7,7,'2018-06-17','2018-06-20')
INSERT INTO Booking VALUES ('2018-05-24', 8,8,'2018-06-20','2018-06-23')
INSERT INTO Booking VALUES ('2018-05-23', 9,9,'2018-06-24','2018-06-25')
INSERT INTO Booking VALUES ('2018-05-22', 10,10,'2018-06-27','2018-06-30')

/*Add 3 hotels to DB, one with name 'Edelweiss’*/
INSERT INTO Hotels VALUES ('Turist', 1337, 'Geroiv Maydanu 100', 1);
INSERT INTO Hotels VALUES ('Plaza', 2017, 'Kamyanetska 83', 1);
INSERT INTO Hotels VALUES ('Edelweiss', 2010, 'Nebesnoi Sotni 4B', 1);

/*Get All hotels from DB*/
SELECT * FROM Hotels;

/*Update first hotel foundation year from existing value to 1937*/
UPDATE Hotels  
    SET FoundationYear = 1937
    WHERE HotelID = 1 


/*Insert 10 users to Database, but have at least 2 users with Name Andrew or Anton*/
INSERT INTO Users VALUES ('Andrew', 'Andrew@gmail.com');
INSERT INTO Users VALUES ('Anton', 'Anton@mail.ru');
INSERT INTO Users VALUES ('Inna', 'Inna@rambler.ru');
INSERT INTO Users VALUES ('Misha', 'Misha@gmail.com');
INSERT INTO Users VALUES ('Vitya', 'Vutya@list.ru');
INSERT INTO Users VALUES ('Natasha', 'Natasha@pochta.ru');
INSERT INTO Users VALUES ('Sasha', 'Sasha@uk.ua');
INSERT INTO Users VALUES ('Vita', 'Vita@mail.ru');
INSERT INTO Users VALUES ('Anton', 'Anton@gmail.com');
INSERT INTO Users VALUES ('Andrew', 'Andrew@mail.ru');

/*Get all users which name starts from "A"*/
SELECT u.Name FROM Users u WHERE u.Name LIKE 'A%';

/*Insert 10 rooms in DB. 7 to first hotel and 3 to other. 
Make sure both hotels have room number 101. 
Make sure 'Edelweiss' has room number 301, but other hotel no. 
Also make sure 'Edelweiss' do not have rooms with comfort level 3, 
but second hotel has at least one room with such comfort level*/
INSERT INTO Rooms VALUES (1, 200, 1, 1);
INSERT INTO Rooms VALUES (101, 100, 1, 2);
INSERT INTO Rooms VALUES (102, 300, 1, 3);
INSERT INTO Rooms VALUES (103, 400, 2, 4);
INSERT INTO Rooms VALUES (100, 500, 2, 4);
INSERT INTO Rooms VALUES (99, 600, 2, 3);
INSERT INTO Rooms VALUES (3, 700, 3, 2);
INSERT INTO Rooms VALUES (8, 800, 3, 2);
INSERT INTO Rooms VALUES (413, 900, 3, 4);
INSERT INTO Rooms VALUES (211, 50, 1, 1);

/*Select All rooms from DB sorted by Price*/
SELECT Price, RoomID, Number, ComfortLevel, Capability FROM Rooms ORDER BY Rooms.Price;

/*Select All rooms from DB that belong to 'Edelweiss' hotel and sorted by price*/
SELECT * FROM Rooms r 
JOIN RoomInHotel rih ON r.RoomID=rih.RoomID 
JOIN Hotels h ON h.HotelID=rih.HotelID
WHERE h.Name='Edelweiss'
ORDER BY r.Price;

/*Select Hotels that have rooms with comfort level 3*/
SELECT h.Name FROM Hotels h 
JOIN RoomInHotel rih ON h.HotelID=rih.HotelID
JOIN Rooms r ON r.RoomID=rih.RoomID 
WHERE r.ComfortLevel=3
GROUP BY h.Name

/*Select Hotelname and room number for rooms that have comfort level 1*/
SELECT h.Name, r.Number FROM Hotels h
JOIN RoomInHotel rih ON h.HotelID=rih.HotelID
JOIN Rooms r ON r.RoomID=rih.RoomID
WHERE r.ComfortLevel=1


/*Select Hotel names and count of hotel rooms*/
SELECT h.Name, COUNT(r.RoomID) AS [Number of rooms] FROM Hotels h
JOIN RoomInHotel rih ON h.HotelID=rih.HotelID
JOIN Rooms r ON r.RoomID=rih.RoomID
GROUP BY h.Name

/*Insert 10 different reservations to db*/
INSERT INTO RoomInHotel VALUES (1,1);
INSERT INTO RoomInHotel VALUES (1,2);
INSERT INTO RoomInHotel VALUES (1,3);
INSERT INTO RoomInHotel VALUES (1,4);
INSERT INTO RoomInHotel VALUES (1,5);
INSERT INTO RoomInHotel VALUES (1,6);
INSERT INTO RoomInHotel VALUES (1,7);
INSERT INTO RoomInHotel VALUES (2,8);
INSERT INTO RoomInHotel VALUES (2,9);
INSERT INTO RoomInHotel VALUES (3,10);

/*Select Username, room number, reservation period.*/
SELECT u.Name, r.Number, h.Name, DATEDIFF(day,b.ArrivalDate,b.DepartureDate) 
AS [Reservation period (days)] FROM Booking b
JOIN RoomInHotel rih ON b.RoomInHotelID=rih.RoomsInHotelID
JOIN Rooms r ON r.RoomID=rih.RoomID
JOIN Hotels h ON h.HotelID=rih.HotelID
JOIN Users u ON u.UserID=b.UserID


/*Delete 3d hotel from DB by Id*/
DELETE FROM Hotels 
WHERE HotelID=3