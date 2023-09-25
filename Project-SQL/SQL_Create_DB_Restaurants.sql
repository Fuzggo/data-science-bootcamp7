-- Create the Restaurants Table
CREATE TABLE Restaurants (
    RestaurantID INTEGER PRIMARY KEY,
    RestaurantName TEXT NOT NULL,
    Address TEXT NOT NULL,
    PhoneNumber TEXT,
    Email TEXT,
    Website TEXT,
    OpeningHours TEXT,
    CuisineType TEXT,
    AverageRating REAL
);

-- Create the Menu Items Table
CREATE TABLE MenuItems (
    MenuItemID INTEGER PRIMARY KEY,
    RestaurantID INTEGER,
    ItemName TEXT NOT NULL,
    Description TEXT,
    Price REAL,
    Category TEXT,
    Vegetarian BOOLEAN,
    GlutenFree BOOLEAN,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID)
);

-- Create the Reviews Table
CREATE TABLE Reviews (
    ReviewID INTEGER PRIMARY KEY,
    RestaurantID INTEGER,
    UserID INTEGER,
    Rating REAL,
    ReviewText TEXT,
    DateOfReview DATE,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID),
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
);

-- Create the Users Table
CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY,
    Username TEXT NOT NULL,
    PasswordHash TEXT NOT NULL,
    Email TEXT NOT NULL,
    ProfilePicture BLOB
);

-- Create the Bookings Table
CREATE TABLE Bookings (
    BookingID INTEGER PRIMARY KEY,
    RestaurantID INTEGER,
    UserID INTEGER,
    ReservationDateTime DATETIME,
    NumberOfGuests INTEGER,
    SpecialRequests TEXT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID),
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
);

-- Create the Images Table
CREATE TABLE Images (
    ImageID INTEGER PRIMARY KEY,
    RestaurantID INTEGER,
    MenuItemID INTEGER,
    ImageURL TEXT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems (MenuItemID)
);

-- Create the Payment Information Table
CREATE TABLE PaymentInformation (
    PaymentID INTEGER PRIMARY KEY,
    UserID INTEGER,
    RestaurantID INTEGER,
    PaymentDateTime DATETIME,
    PaymentMethod TEXT,
    Amount REAL,
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID)
);

-- Create the Employee Table
CREATE TABLE Employee (
    EmployeeID INTEGER PRIMARY KEY,
    RestaurantID INTEGER,
    EmployeeName TEXT NOT NULL,
    Position TEXT,
    Performance TEXT,
    Salary DECIMAL(8 , 2),
    ContactInformation TEXT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID)
);

-- Create the Events and Promotions Table
CREATE TABLE EventsAndPromotions (
    EventID INTEGER PRIMARY KEY,
    RestaurantID INTEGER,
    EventName TEXT NOT NULL,
    Description TEXT,
    EventDateTime DATETIME,
    EventImageURL TEXT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID)
);

-- Create the Orders Table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    UserID INTEGER,
    RestaurantID INTEGER,
    OrderDateTime DATETIME,
    TotalAmount REAL,
    Status TEXT,
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID)
);

-- Insert values in DB
-- Insert data into the Restaurants table
INSERT INTO Restaurants (RestaurantName, Address, PhoneNumber, Email, Website, OpeningHours, CuisineType, AverageRating)
VALUES
    ('Best Food Ever', '24 Sukumwit Rd', '081-123-4567', 'info@example.com', 'www.bestfoodever.com', '9:00 AM - 10:00 PM', 'Italian', 4.5),
    ('Tacos and Salsa', 'Phloen Chit Rd', '082-345-6789', 'info2@example.com', 'www.tacosandsalsa.com', '10:00 AM - 11:00 PM', 'Mexican', 4.0),
    ('Subarashi Salmon', '30 Sukumwit Rd', '083-456-7891', 'info3@example.com', 'www.subarashi.com', '11:00 AM - 9:00 PM', 'Japanese', 4.2);

-- Insert data into the MenuItems table
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, Category, Vegetarian, GlutenFree)
VALUES
    (1, 'Spaghetti Carbonara', 'Creamy pasta with bacon and eggs', 12.99, 'Main Course', 0, 0),
    (1, 'Margherita Pizza', 'Classic tomato and mozzarella pizza', 10.99, 'Main Course', 1, 0),
    (2, 'Taco Platter', 'Assorted tacos with salsa and guacamole', 14.99, 'Main Course', 0, 0),
    (2, 'Quesadilla', 'Cheese-filled tortilla with chicken', 8.99, 'Appetizer', 0, 0),
    (3, 'Sushi Combo', 'Assorted sushi rolls with wasabi and soy sauce', 19.99, 'Main Course', 0, 1),
    (3, 'Miso Soup', 'Traditional Japanese soup with tofu and seaweed', 3.99, 'Appetizer', 1, 1);

-- Examples of SQL queries
-- Show Restaurant Informations
SELECT RestaurantName, Address, CuisineType
FROM Restaurants;

-- Find Vegetarian Menu Items
SELECT ItemName, Price
FROM MenuItems
WHERE Vegetarian = 1 AND RestaurantID = 1;

-- Find Glutenfree Menu Items with Informations 
SELECT itemname, description, category, price
FROM MenuItems
where glutenfree = FALSE

-- Find Restaurants have Address in 'Sukumwit Rd'
SELECT *
FROM Restaurants
WHERE Address LIKE '%Sukumwit Rd%';

-- Get Average Price GroupBy RestaurantID
SELECT restaurantid, AVG(Price) AS AveragePrice
FROM MenuItems
GROUP BY restaurantid
