CREATE DATABASE MTMS;
USE MTMS;

CREATE TABLE Theatre (
    theatreId INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE theatreEmail (
    email VARCHAR(100),
    theatreId INT,
    FOREIGN KEY (theatreId) REFERENCES Theatre(theatreId)
);

CREATE TABLE theatreContact (
    contact VARCHAR(15),
    theatreId INT,
    FOREIGN KEY (theatreId) REFERENCES Theatre(theatreId)
);

CREATE TABLE staff (
    staffId INT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(50),
    joiningDate DATE,
    salary DECIMAL(10,2),
    shiftTime VARCHAR(20),
    theatreId INT,
    FOREIGN KEY (theatreId) REFERENCES Theatre(theatreId)
);

CREATE TABLE staffPhone (
    phone VARCHAR(15),
    staffId INT,
    FOREIGN KEY (staffId) REFERENCES staff(staffId)
);

CREATE TABLE staffEmail (
    email VARCHAR(100),
    staffId INT,
    FOREIGN KEY (staffId) REFERENCES staff(staffId)
);

CREATE TABLE screen (
    screenId INT PRIMARY KEY,
    screenName VARCHAR(50),
    capacity INT,
    screenType VARCHAR(30),
    soundSystem VARCHAR(30),
    theatreId INT,
    FOREIGN KEY (theatreId) REFERENCES Theatre(theatreId)
);

CREATE TABLE Movie (
    movieId INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    language VARCHAR(30),
    durationTime INT,
    releaseDate DATE
);

CREATE TABLE shows (
    showId INT PRIMARY KEY,
    startTime TIME,
    isFull BOOLEAN,
    date DATE,
    movieId INT,
    screenId INT,
    FOREIGN KEY (movieId) REFERENCES Movie(movieId),
    FOREIGN KEY (screenId) REFERENCES screen(screenId)
);

CREATE TABLE seat (
    seatNum INT,
    screenId INT,
    rowLINE CHAR(1),
    seatSection VARCHAR(20),
    seatType VARCHAR(20),
    priceMultiplier FLOAT,
    PRIMARY KEY (seatNum, screenId),
    FOREIGN KEY (screenId) REFERENCES screen(screenId)
);

CREATE TABLE showSeat (
    seatNum INT,
    screenId INT,
    showId INT,
    status VARCHAR(20),
    PRIMARY KEY (seatNum, screenId, showId),
    FOREIGN KEY (seatNum, screenId) REFERENCES seat(seatNum, screenId),
    FOREIGN KEY (showId) REFERENCES shows(showId)
);

CREATE TABLE customer (
    customerId INT PRIMARY KEY,
    name VARCHAR(100),
    DOB DATE,
    gender VARCHAR(10)
);

CREATE TABLE customerEmail (
    email VARCHAR(100),
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

CREATE TABLE customerPhone (
    phone VARCHAR(15),
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

CREATE TABLE payment (
    paymentId INT PRIMARY KEY,
    paymentMethod VARCHAR(20),
    paymentTime TIMESTAMP,
    discount DECIMAL(5,2),
    amount DECIMAL(10,2),
    transactionStatus VARCHAR(20),
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

CREATE TABLE Ticket (
    ticketId INT PRIMARY KEY,
    price DECIMAL(10,2),
    bookingTime TIMESTAMP,
    isCancelled BOOLEAN,
    ticketType VARCHAR(20),
    customerId INT,
    seatNum INT,
    screenId INT,
    showId INT,
    paymentId INT,
    FOREIGN KEY (customerId) REFERENCES customer(customerId),
    FOREIGN KEY (seatNum, screenId) REFERENCES seat(seatNum, screenId),
    FOREIGN KEY (showId) REFERENCES shows(showId),
    FOREIGN KEY (paymentId) REFERENCES payment(paymentId)
);

CREATE TABLE snack (
    snackId INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(6,2),
    size VARCHAR(20),
    isAvailable BOOLEAN,
    calories INT,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

CREATE TABLE paymentSnack (
    paymentId INT,
    snackId INT,
    FOREIGN KEY (paymentId) REFERENCES payment(paymentId),
    FOREIGN KEY (snackId) REFERENCES snack(snackId)
);

INSERT INTO Theatre  (theatreId, name , location)
VALUES (1, 'Pak Cineplex', 'Mall Road,Lahore');

INSERT INTO theatreEmail (email, theatreId)
VALUES('info@pakcineplex.com', 1),
('contact@pakcineplex.com', 1);

INSERT INTO theatreContact (contact,theatreId)
 VALUES('03001234567', 1),
('03112345678', 1),
('03211234567', 1);

INSERT INTO staff (staffId , name , designation , joiningDate ,salary ,shiftTime, theatreId)
VALUES (1, 'Ahmed Khan', 'Manager', '2020-01-15', 85000.00, 'Morning', 1),
(2, 'Sara Malik', 'Cashier', '2021-03-22', 40000.00, 'Evening', 1),
(3, 'Ali Raza', 'Projectionist', '2019-07-11', 50000.00, 'Night', 1),
(4, 'Nida Fatima', 'Cleaner', '2022-02-28', 30000.00, 'Morning', 1),
(5, 'Imran Haider', 'Security', '2020-08-05', 35000.00, 'Night', 1),
(6, 'Ayesha Noor', 'Receptionist', '2023-05-01', 38000.00, 'Evening', 1),
(7, 'Zeeshan Tariq', 'Cleaner', '2021-09-10', 25000.00, 'Morning', 1);

INSERT INTO staffPhone (phone , staffId)
VALUES('03001111111', 1),
('03021111111' , 1),
('03112223333', 2),
('03202223333', 2),
('03214445555', 3),
('03315556666', 4),
('03416667777', 5),
('03517778888', 6),
('03917778888', 6),
('03618889999', 7);

INSERT INTO staffEmail (email ,staffId)
VALUES('ahmed.khan@pakcineplex.com', 1),
('sara@megastar.pk', 2),
('ali.raza@royalvision.com', 3),
('nida@galaxy.pk', 4),
('imran@silverscreen.pk', 5),
('ayesha@starcinema.pk', 6),
('zeeshan@cinestar.com', 7);

INSERT INTO staffEmail VALUES
('ahmed.khan@pakcineplex.com', 1),
('sara@megastar.pk', 2),
('ali.raza@royalvision.com', 3),
('nida@galaxy.pk', 4),
('imran@silverscreen.pk', 5),
('ayesha@starcinema.pk', 6),
('zeeshan@cinestar.com', 7);

INSERT INTO Movie (movieId, title, genre, language , durationTime , releaseDate)
VALUES(1, 'Maula Jatt', 'Action', 'Urdu', 150, '2022-10-13'),
(2, 'Zindagi Tamasha', 'Drama', 'Urdu', 120, '2020-01-24'),
(3, 'Donkey King', 'Animation', 'Urdu', 95, '2018-10-13'),
(4, 'Parwaaz Hai Junoon', 'Romance', 'Urdu', 130, '2018-08-22'),
(5, 'Waar', 'Action', 'English', 140, '2013-10-11'),
(6, 'Bol', 'Drama', 'Urdu', 125, '2011-06-24'),
(7, 'Teefa in Trouble', 'Comedy', 'Urdu', 135, '2018-07-20');

INSERT INTO screen (screenId , screenName ,capacity , screenType ,soundSystem , theatreId)
VALUES(1, 'Screen A', 100, '2D', 'Dolby', 1),
(2, 'Screen B', 150, '3D', 'Dolby', 1),
(3, 'Screen C', 120, '2D', 'Stereo', 1),
(4, 'Screen D', 200, 'IMAX', 'Dolby Atmos', 1),
(5, 'Screen E', 130, '2D', 'Mono', 1);


INSERT INTO shows (showId, startTime , isFull, date , movieID , screenId)
VALUES(1, '14:00', FALSE, '2025-06-14', 1, 1),
(2, '18:00', TRUE, '2025-06-14', 2, 2),
(3, '20:30', FALSE, '2025-06-14', 3, 3),
(4, '22:00', TRUE, '2025-06-14', 4, 4),
(5, '16:00', FALSE, '2025-06-14', 5, 5),
(6, '19:00', TRUE, '2025-06-14', 6, 1),
(7, '21:00', FALSE, '2025-06-14', 7, 5);

INSERT INTO seat(seatNum,screenId,rowLINE,seatSection,seatType,priceMultiplier)
VALUES(1, 1, 'A', 'Front', 'Regular', 1.0),
(2, 1, 'A', 'Front', 'Regular', 1.0),
(3, 1, 'B', 'Middle', 'VIP', 1.5),
(4, 1, 'B', 'Middle', 'VIP', 1.5),
(5, 1, 'C', 'Back', 'Premium', 2.0),
(6, 1, 'C', 'Back', 'Premium', 2.0),
(7, 1, 'D', 'Back', 'Regular', 1.0);

INSERT INTO customer  (customerId ,name, DOB, gender)
VALUES(1, 'Hassan Ali', '1995-03-12', 'Male'),
(2, 'Amina Tariq', '1998-07-25', 'Female'),
(3, 'Zubair Shah', '1989-11-02', 'Male'),
(4, 'Sana Rauf', '1992-01-15', 'Female'),
(5, 'Bilal Khan', '2000-05-22', 'Male'),
(6, 'Mariam Iqbal', '1997-09-10', 'Female'),
(7, 'Usman Ashraf', '1994-04-04', 'Male');

INSERT INTO customerEmail (email ,customerId)
VALUES('hassan.ali@email.com', 1),
('amina.tariq@email.com', 2),
('zubair.shah@email.com', 3),
('sana.rauf@email.com', 4),
('bilal.khan@email.com', 5),
('mariam.iqbal@email.com', 6),
('usman.ashraf@email.com', 7);

INSERT INTO customerPhone ( phone ,customerId)
VALUES('03009991111', 1),
('03112223344', 2),
('03213334455', 3),
('03314445566', 4),
('03415556677', 5),
('03516667788', 6),
('03617778899', 7);

INSERT INTO payment (paymentId ,paymentMethod , paymentTime, discount , amount ,transactionStatus ,customerId)
VALUES(1, 'Cash', '2025-06-14 13:00:00', 0.00, 500.00, 'Completed', 1),
(2, 'Card', '2025-06-14 13:10:00', 10.00, 450.00, 'Completed', 2),
(3, 'Cash', '2025-06-14 14:00:00', 0.00, 600.00, 'Completed', 3),
(4, 'Card', '2025-06-14 14:30:00', 5.00, 570.00, 'Completed', 4),
(5, 'Online', '2025-06-14 15:00:00', 20.00, 400.00, 'Completed', 5),
(6, 'Cash', '2025-06-14 15:15:00', 0.00, 550.00, 'Completed', 6),
(7, 'Card', '2025-06-14 16:00:00', 15.00, 485.00, 'Completed', 7);

INSERT INTO Ticket (ticketId,price,bookingTime,isCancelled,ticketType,customerId,seatNum,screenId,showId,paymentId)
VALUES(1, 500.00, '2025-06-14 12:30:00', FALSE, 'Online', 1, 1, 1, 1, 1),
(2, 450.00, '2025-06-14 13:00:00', FALSE, 'BoxOffice', 2, 2, 1, 1, 2),
(3, 600.00, '2025-06-14 13:30:00', FALSE, 'Online', 3, 3, 1, 1, 3),
(4, 570.00, '2025-06-14 14:00:00', FALSE, 'BoxOffice', 4, 4, 1, 1, 4),
(5, 400.00, '2025-06-14 14:30:00', FALSE, 'Online', 5, 5, 1, 1, 5),
(6, 550.00, '2025-06-14 15:00:00', FALSE, 'BoxOffice', 6, 6, 1, 1, 6),
(7, 485.00, '2025-06-14 15:30:00', FALSE, 'Online', 7, 7, 1, 1, 7);

INSERT INTO snack (snackId,name,price,size,isAvailable,calories,customerId)
VALUES(1, 'Popcorn', 250.00, 'Large', TRUE, 500, 1),
(2, 'Nachos', 300.00, 'Medium', TRUE, 400, 2),
(3, 'Soft Drink', 150.00, 'Regular', TRUE, 180, 3),
(4, 'Hot Dog', 200.00, 'Regular', TRUE, 350, 4),
(5, 'Fries', 180.00, 'Small', TRUE, 300, 5),
(6, 'Chocolate Bar', 100.00, 'Single', TRUE, 250, 6),
(7, 'Tea', 80.00, 'Cup', TRUE, 90, 7);

INSERT INTO paymentSnack (paymentId ,snackId)
VALUES(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- Find the total earning of theatre in cash.
SELECT sum(amount) as earning
from payment 
where paymentMethod = 'Cash';

-- Find the total ticket revenue per show and only show those shows where total revenue is greater than 1000.
SELECT showId, SUM(price) AS total_revenue
FROM Ticket
GROUP BY showId
HAVING SUM(price) > 1000;

-- Show the total payment amount per customer, excluding those who paid by 'Card'
SELECT customerId, SUM(amount) AS total_paid
FROM payment
WHERE NOT paymentMethod = 'Card'
GROUP BY customerId;


-- Get the name of customers, their ticket ID, movie title, and payment amount.
SELECT c.name, t.ticketId, m.title, p.amount
FROM customer c
JOIN Ticket t ON c.customerId = t.customerId
JOIN shows s ON t.showId = s.showId
JOIN Movie m ON s.movieId = m.movieId
JOIN payment p ON t.paymentId = p.paymentId;


-- Get all customers who bought snacks and the payment method they used for snacks.
SELECT c.name, s.name AS snackName, p.paymentMethod
FROM customer c
JOIN snack s ON c.customerId = s.customerId
JOIN paymentSnack ps ON s.snackId = ps.snackId
JOIN payment p ON ps.paymentId = p.paymentId;


-- Show staff names, their emails, the theatres they work at, and theatre contact numbers.
SELECT s.name, se.email, t.name AS theatreName, tc.contact
FROM staff s
JOIN staffEmail se ON s.staffId = se.staffId
JOIN Theatre t ON s.theatreId = t.theatreId
JOIN theatreContact tc ON t.theatreId = tc.theatreId;


-- List customer names who made Cash payments and watched a movie in Urdu
SELECT name
FROM customer
WHERE customerId IN (
    SELECT customerId
    FROM payment
    WHERE paymentMethod = 'Cash'
      AND paymentId IN (
          SELECT paymentId
          FROM Ticket
          WHERE showId IN (
              SELECT showId
              FROM shows
              WHERE movieId IN (
                  SELECT movieId
                  FROM Movie
                  WHERE language = 'Urdu'
              )
          )
      )
);


-- List all movies for which at least one seat was booked (i.e. ticket was issued) and paid using Cash.
SELECT title
FROM Movie
WHERE movieId IN (
    SELECT s.movieId
    FROM shows s
    JOIN Ticket t ON s.showId = t.showId
    JOIN payment p ON t.paymentId = p.paymentId
    WHERE p.paymentMethod = 'Cash'
);


-- Find names of customers who booked a seat with a seat type of 'VIP'.
SELECT name
FROM customer
WHERE customerId IN (
    SELECT customerId
    FROM Ticket
    WHERE (seatNum, screenId) IN (
        SELECT seatNum, screenId
        FROM seat
        WHERE seatType = 'VIP'
    )
);




