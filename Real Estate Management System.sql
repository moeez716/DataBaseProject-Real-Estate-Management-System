create database RealState;
use RealState;

CREATE TABLE Landlords (
    LandlordID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20)
);
CREATE TABLE Clients (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20)
);
CREATE TABLE Properties (
    PropertyID INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    OwnerID INT,
    FOREIGN KEY (OwnerID) REFERENCES Landlords(LandlordID) on delete cascade on update cascade
);


CREATE TABLE Listings_Agent (
    ListingAgentID INT AUTO_INCREMENT PRIMARY KEY,
	FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20)
	
);
CREATE TABLE Listings (
    ListingID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT,
    ListingType ENUM('Sale', 'Rent'),
    Price DECIMAL(10, 2),
    ListingDate DATE,
    Status ENUM('Available', 'Sold', 'Rented', 'Pending'),
	ListingAgentID INT,
    FOREIGN KEY (ListingAgentID) REFERENCES Listings_Agent(ListingAgentID)on delete cascade on update cascade,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)on delete cascade on update cascade
);
CREATE TABLE comission (
    comissionID INT AUTO_INCREMENT PRIMARY KEY,
    agents_comission INT,
    ListingAgentID INT,
    ListingID INT,
    FOREIGN KEY (ListingID) REFERENCES Listings(ListingID)on delete cascade on update cascade,
    FOREIGN KEY (ListingAgentID) REFERENCES Listings_Agent(ListingAgentID)on delete cascade on update cascade
);
CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    ListingID INT,
    ClientID INT,
    SaleDate DATE,
    SalePrice DECIMAL(10, 2),
    FOREIGN KEY (ListingID) REFERENCES Listings(ListingID)on delete cascade on update cascade,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)on delete cascade on update cascade
);

CREATE TABLE Rents (
    RentID INT AUTO_INCREMENT PRIMARY KEY,
    ListingID INT,
    ClientID INT,
    StartDate DATE,
    EndDate DATE,
    RentAmount DECIMAL(10, 2),
    FOREIGN KEY (ListingID) REFERENCES Listings(ListingID)on delete cascade on update cascade,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)on delete cascade on update cascade
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    ClientID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(100),
     ListingID INT,
    FOREIGN KEY (ListingID) REFERENCES Listings(ListingID)on delete cascade on update cascade,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)on delete cascade on update cascade
    
);

CREATE TABLE MaintenanceRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT,
    ClientID INT,
    Description TEXT,
    RequestDate DATE,
    Status ENUM('Pending', 'In Progress', 'Completed'),
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)on delete cascade on update cascade,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)on delete cascade on update cascade
);

INSERT INTO Landlords (FirstName, LastName, Email, Phone)
VALUES 
    ('John', 'Doe', 'johndoe@example.com', '123-456-7890'),
    ('Jane', 'Smith', 'janesmith@example.com', '987-654-3210'),
    ('Michael', 'Brown', 'mbrown@example.com', '555-111-2222'),
    ('Sarah', 'Johnson', 'sjohnson@example.com', '555-333-4444'),
    ('David', 'Williams', 'dwilliams@example.com', '555-555-6666');
INSERT INTO Clients (FirstName, LastName, Email, Phone)
VALUES 
    ('Alice', 'Johnson', 'alice@example.com', '111-222-3333'),
    ('Bob', 'Brown', 'bob@example.com', '444-555-6666'),
    ('Emily', 'Davis', 'emily@example.com', '777-888-9999'),
    ('Ryan', 'Wilson', 'ryan@example.com', '111-333-5555'),
    ('Sophia', 'Moore', 'sophia@example.com', '666-777-8888');
INSERT INTO Properties (Address, City, State, PostalCode, Country, OwnerID)
VALUES 
    ('789 Elm St', 'Springfield', 'IL', '62702', 'USA', 1),
    ('101 Pine Ave', 'Riverside', 'CA', '92502', 'USA', 2),
    ('555 Cedar Ln', 'New York', 'NY', '10001', 'USA', 3),
    ('321 Oak St', 'Los Angeles', 'CA', '90001', 'USA', 4),
    ('456 Maple Dr', 'Chicago', 'IL', '60601', 'USA', 5);
INSERT INTO Listings_Agent (FirstName, LastName, Email, Phone)
VALUES 
    ('Michael', 'Adams', 'michaeladams@example.com', '555-123-4567'),
    ('Emily', 'Clark', 'emilyclark@example.com', '555-987-6543'),
    ('Daniel', 'Brown', 'dbrown@example.com', '555-222-3333'),
    ('Olivia', 'Garcia', 'olivia@example.com', '555-444-5555'),
    ('Jacob', 'Martinez', 'jacob@example.com', '555-666-7777');
INSERT INTO Listings (PropertyID, ListingType, Price, ListingDate, Status, ListingAgentID)
VALUES 
    (1, 'Sale', 275000.00, '2024-06-24', 'Sold', 1),
    (2, 'Rent', 1700.00, '2024-06-25', 'Rented', 2),
    (3, 'Sale', 400000.00, '2024-06-26', 'Sold', 3),
    (4, 'Rent', 2000.00, '2024-06-27', 'Rented', 4),
    (5, 'Sale', 350000.00, '2024-06-28', 'Pending', 5);
INSERT INTO comission (agents_comission, ListingAgentID, ListingID)
VALUES 
    (7, 1, 1),
    (10, 2, 2),
    (8, 3, 3),
    (12, 4, 4),
    (6, 5, 5);
INSERT INTO Sales (ListingID, ClientID, SaleDate, SalePrice)
VALUES 
    (1, 2, '2024-06-25', 260000.00),
    (3, 4, '2024-06-26', 390000.00),
    (5, 1, '2024-06-27', 340000.00);
INSERT INTO Rents (ListingID, ClientID, StartDate, EndDate, RentAmount)
VALUES 
    (2, 1, '2024-07-01', '2024-12-31', 1700.00),
    (4, 3, '2024-07-01', '2024-12-31', 2000.00);
INSERT INTO Payments (ClientID, Amount, PaymentDate, PaymentMethod, ListingID)
VALUES 
    (1, 1700.00, '2024-06-30', 'Credit Card', 2),
    (3, 2000.00, '2024-06-30', 'Bank Transfer', 4),
    (2, 10000.00, '2024-06-30', 'Cash', 1),
    (4, 15000.00, '2024-06-30', 'Bank Transfer', 3);
INSERT INTO MaintenanceRequests (PropertyID, ClientID, Description, RequestDate, Status)
VALUES 
    (1, 2, 'Leaky faucet in the kitchen', '2024-06-25', 'Pending'),
    (2, 1, 'Broken window in the living room', '2024-06-24', 'Completed'),
    (3, 4, 'Clogged drain in the bathroom', '2024-06-26', 'Pending'),
    (4, 3, 'Heating issue in the bedroom', '2024-06-27', 'In Progress'),
    (5, 5, 'Electrical problem in the basement', '2024-06-28', 'Pending');
    