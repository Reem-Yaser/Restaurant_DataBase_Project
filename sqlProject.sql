create DATABASE RestaurantDBase;
use RestaurantDBase;

CREATE TABLE Restaurant (
    ID INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
);
CREATE TABLE Customer (
    ID INT PRIMARY KEY,
    name VARCHAR(30),
    phone VARCHAR(20)
);

CREATE TABLE Tables (
    ID INT PRIMARY KEY,
    Rest_id INT,
    table_number INT,
    capacity INT,
    status VARCHAR(50),
    FOREIGN KEY (Rest_id) REFERENCES Restaurant(ID)
);

DROP TABLE IF EXISTS Dishes;

CREATE TABLE Dishes (
    ID INT PRIMARY KEY,
    name VARCHAR(100),
    price INT,
    category VARCHAR(50),
    restaurant_id INT,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(ID)
);


CREATE TABLE Reservation (
    ID INT PRIMARY KEY,
    Npeople INT,
    customer_id INT,
    table_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(ID),
    FOREIGN KEY (table_id) REFERENCES Tables(ID)
);

CREATE TABLE Reservation_Order (
    ID INT PRIMARY KEY,
    reservation_id INT,
    dishes_id INT,
    quantity INT,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(ID),
    FOREIGN KEY (dishes_id) REFERENCES Dishes(ID)
);
INSERT INTO Restaurant VALUES
(1, 'Pizza House', '01111111111', 'Cairo'),
(2, 'Burger King', '01111111112', 'Giza'),
(3, 'Koshary Express', '01111111113', 'Alexandria'),
(4, 'Sushi Bar', '01111111114', 'Nasr City'),
(5, 'Steak House', '01111111115', 'Heliopolis'),
(6, 'Shawarma King', '01111111116', 'Zamalek'),
(7, 'Seafood Grill', '01111111117', 'Port Said'),
(8, 'Taco Town', '01111111118', 'Maadi'),
(9, 'Feteer Station', '01111111119', '6 October'),
(10, 'Chicken Planet', '01111111120', 'New Cairo');


INSERT INTO Customer VALUES
(1, 'Ahmed', '01000000001'),
(2, 'Sara', '01000000002'),
(3, 'Omar', '01000000003'),
(4, 'Nada', '01000000004'),
(5, 'Youssef', '01000000005'),
(6, 'Layla', '01000000006'),
(7, 'Hassan', '01000000007'),
(8, 'Mona', '01000000008'),
(9, 'Ali', '01000000009'),
(10, 'Dina', '01000000010');


INSERT INTO Tables VALUES
(1, 1, 1, 4, 'available'),
(2, 1, 2, 2, 'reserved'),
(3, 2, 1, 6, 'available'),
(4, 2, 2, 4, 'available'),
(5, 3, 1, 8, 'reserved'),
(6, 3, 2, 6, 'available'),
(7, 4, 1, 4, 'reserved'),
(8, 4, 2, 2, 'available'),
(9, 5, 1, 6, 'available'),
(10, 5, 2, 4, 'reserved');


INSERT INTO Dishes VALUES
(1, 'Margherita', 60, 'Pizza', 1),
(2, 'Beef Burger', 75, 'Burger', 2),
(3, 'Koshary', 25, 'Egyptian', 3),
(4, 'Sushi Roll', 120, 'Japanese', 4),
(5, 'Steak', 200, 'Main', 5),
(6, 'Shawarma', 50, 'Wraps', 6),
(7, 'Grilled Fish', 150, 'Seafood', 7),
(8, 'Taco', 45, 'Mexican', 8),
(9, 'Feteer Mix', 80, 'Pastry', 9),
(10, 'Fried Chicken', 90, 'Main', 10);



INSERT INTO Reservation VALUES
(1, 2, 1, 1),
(2, 3, 2, 2),
(3, 4, 3, 3),
(4, 1, 4, 4),
(5, 5, 5, 5),
(6, 2, 6, 6),
(7, 6, 7, 7),
(8, 2, 8, 8),
(9, 4, 9, 9),
(10, 3, 10, 10);


INSERT INTO Reservation_Order VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 2),
(5, 5, 5, 1),
(6, 6, 6, 4),
(7, 7, 7, 1),
(8, 8, 8, 2),
(9, 9, 9, 1),
(10, 10, 10, 3);

SELECT * FROM Restaurant;
SELECT * FROM Customer;
SELECT * FROM Tables;
SELECT * FROM Dishes;
SELECT * FROM Reservation;
SELECT * FROM Reservation_Order;
/* Queries*/
/*1*/
SELECT name, address FROM Restaurant;
/*2*/
SELECT * FROM Tables WHERE status = 'available';
/*3*/
SELECT * FROM Customer WHERE phone LIKE '010%';
/*4*/
SELECT * FROM Customer ORDER BY ID;
/*5*/
SELECT * FROM Customer ORDER BY ID;
/*6*/
SELECT customer_id, COUNT(*) AS number_of_reservations
FROM Reservation
GROUP BY customer_id;
/*7*/
SELECT R.name, T.table_number
FROM Tables T
JOIN Restaurant R ON T.Rest_id = R.ID;
/*8*/
SELECT customer_id, COUNT(*) AS total_reservations
FROM Reservation
GROUP BY customer_id
HAVING COUNT(*) > 1;

