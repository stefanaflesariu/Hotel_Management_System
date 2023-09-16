CREATE DATABASE Hotel_Management_System 
USE [Hotel_Management_System ]
CREATE TABLE Clients (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(10),
    LastName VARCHAR(10),
    EmailAddress VARCHAR(30),
    PasswordHash BINARY(50),
    AddressId INT REFERENCES Addresses(Id),
    RoleId INT REFERENCES Roles(Id)
);
CREATE TABLE Addresses (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    City VARCHAR(10),
    Street VARCHAR(15),
    Number INT,
    PostalCode INT
);
CREATE TABLE Reviews (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Description VARCHAR(50),
    ClientId INT REFERENCES Clients(Id)
);
CREATE TABLE Roles (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(5),
);
CREATE TABLE RoomTypes (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    RoomType VARCHAR(10),
    Quantity INT,
    Price FLOAT,
    Description VARCHAR(50),
);
CREATE TABLE Rooms (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    RoomTypeId INT REFERENCES Rooms(Id),
    IsBooked BIT NOT NULL
);
CREATE TABLE Reservations (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ClientId INT REFERENCES Clients(Id),
    RoomId INT REFERENCES Rooms(Id),
    CheckInDate DATETIME,
    CheckOutDate DATETIME
);
GO
CREATE PROCEDURE AddUser
    @FirstName NVARCHAR(40) = NULL, 
    @LastName NVARCHAR(40) = NULL,
    @EmailAddress NVARCHAR(250),
    @Password NVARCHAR(50),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN

    BEGIN TRY

        INSERT INTO Clients (FirstName, LastName, EmailAddress, PasswordHash)
        VALUES(@FirstName,  @LastName, @EmailAddress, HASHBYTES('SHA2_512', @Password))

        SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
GO