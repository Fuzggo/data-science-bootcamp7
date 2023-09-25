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

-- Create the Location Data Table
CREATE TABLE LocationData (
    RestaurantID INTEGER PRIMARY KEY,
    Latitude REAL,
    Longitude REAL,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID)
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

-- Create the Employee Information Table
CREATE TABLE EmployeeInformation (
    EmployeeID INTEGER PRIMARY KEY,
    RestaurantID INTEGER,
    EmployeeName TEXT NOT NULL,
    Position TEXT,
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

-- Create the Categories and Tags Table
CREATE TABLE CategoriesAndTags (
    CategoryTagID INTEGER PRIMARY KEY,
    RestaurantID INTEGER,
    CategoryTagName TEXT NOT NULL,
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
