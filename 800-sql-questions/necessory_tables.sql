-- SQL Server practice tables for the 800+ Interview Questions PDF
-- Run in SSMS (SQL Server 2016+ for DROP TABLE IF EXISTS)

CREATE DATABASE SQLPractice;
GO
USE SQLPractice;
GO

DROP TABLE IF EXISTS ProjectDetail, EmployeeDetail, FuelDetail, TBL_1, TBL_2,
    Table_1, Table_2, Testupdate, Employee, Country, Marks, NTimesDemo, Table1, Table2;
GO

-- 1. EmployeeDetail (Sets 1-6, 10, 11)
CREATE TABLE EmployeeDetail (
    EmployeeID  INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    FirstName   NVARCHAR(50) NULL,
    LastName    NVARCHAR(50) NULL,
    Salary      DECIMAL(10,2) NULL,
    JoiningDate DATETIME NULL,
    Department  NVARCHAR(20) NULL,
    Gender      VARCHAR(10) NULL
);
SET IDENTITY_INSERT EmployeeDetail ON;
INSERT INTO EmployeeDetail (EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender) VALUES
(1, 'Vikas',  'Ahlawat', 600000.00,  '2013-02-15 11:16:28.290', 'IT',      'Male'),
(2, 'nikita', 'Jain',    530000.00,  '2014-01-09 17:31:07.793', 'HR',      'Female'),
(3, 'Ashish', 'Kumar',   1000000.00, '2014-01-09 10:05:07.793', 'IT',      'Male'),
(4, 'Nikhil', 'Sharma',  480000.00,  '2014-01-09 09:00:07.793', 'HR',      'Male'),
(5, 'anish',  'kadian',  500000.00,  '2014-01-09 09:31:07.793', 'Payroll', 'Male');
SET IDENTITY_INSERT EmployeeDetail OFF;
GO

-- 2. ProjectDetail (Sets 5-7, 10). EmployeeDetailID 6 has no match on purpose.
CREATE TABLE ProjectDetail (
    ProjectDetailID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    EmployeeDetailID INT NULL,
    ProjectName NVARCHAR(50) NULL
);
SET IDENTITY_INSERT ProjectDetail ON;
INSERT INTO ProjectDetail (ProjectDetailID, EmployeeDetailID, ProjectName) VALUES
(1, 1, 'Task Track'),
(2, 1, 'CLP'),
(3, 1, 'Survey Managment'),
(4, 2, 'HR Managment'),
(5, 3, 'Task Track'),
(6, 3, 'GRS'),
(7, 3, 'DDS'),
(8, 4, 'HR Managment'),
(9, 6, 'GL Managment');
SET IDENTITY_INSERT ProjectDetail OFF;
GO

-- 3. FuelDetail (Q103 refuel query)
CREATE TABLE FuelDetail (
    ID INT NOT NULL PRIMARY KEY,
    Fuel INT NULL,
    [Date] DATETIME NULL
);
INSERT INTO FuelDetail (ID, Fuel, [Date]) VALUES
(1, 10, '2014-04-25 10:00:00'), (2, 9,  '2014-04-25 11:00:00'),
(3, 8,  '2014-04-25 12:00:00'), (4, 6,  '2014-04-25 13:00:00'),
(5, 12, '2014-04-25 14:00:00'), (6, 11, '2014-04-25 15:00:00'),
(7, 10, '2014-04-25 16:00:00'), (8, 9,  '2014-04-25 17:00:00'),
(9, 8,  '2014-04-25 18:00:00'), (10, 10, '2014-04-25 19:00:00'),
(11, 9, '2014-04-25 20:00:00'), (12, 8,  '2014-04-25 21:00:00'),
(13, 7, '2014-04-25 22:00:00'), (14, 15, '2014-04-25 23:00:00');
GO

-- 4-5. TBL_1, TBL_2 (Q60-65, duplicate-key join puzzles)
CREATE TABLE TBL_1 (ID INT);
CREATE TABLE TBL_2 (ID INT);
INSERT INTO TBL_1 VALUES (1), (1);
INSERT INTO TBL_2 VALUES (1), (1), (1);
GO

-- 6-7. Table_1, Table_2 (Q66-77)
CREATE TABLE Table_1 (ID INT, Name VARCHAR(50));
CREATE TABLE Table_2 (ID INT, Name VARCHAR(50));
INSERT INTO Table_1 VALUES (1, 'Vikas Ahlawat'), (2, 'Sachin Aggarwal'), (3, 'Manoj Kumar');
INSERT INTO Table_2 VALUES (1, 'Vikas Ahlawat'), (4, 'Sanjay Kumar'), (5, 'Sachin Aggarwal'), (3, 'Sandeep Kumar');
GO

-- 8. Testupdate (UPDATE ... MAX(ID) questions)
CREATE TABLE Testupdate (ID INT);
INSERT INTO Testupdate VALUES (1), (2), (3), (4), (5);
GO

-- Optional extras ---------------------------------------------------

-- Employee: swap A<->B (TCS Q2)
CREATE TABLE Employee (EName VARCHAR(10));
INSERT INTO Employee VALUES ('A'),('B'),('A'),('A'),('B'),('D'),('C'),('M'),('A');
GO

-- Country (Set 9 Q91-99). Sample data, PDF gives none.
CREATE TABLE Country (CountryID INT PRIMARY KEY, CountryName VARCHAR(50));
INSERT INTO Country VALUES (1, 'India'), (2, 'USA'), (3, 'UK');
GO

-- Marks (Q356 pivot + max-marks subject)
CREATE TABLE Marks (RN INT, Subject VARCHAR(20), Marks INT);
INSERT INTO Marks VALUES
(100, 'Math', 87), (100, 'Hindi', 56), (100, 'English', 97),
(101, 'Math', 87), (101, 'Hindi', 45), (101, 'English', 78),
(102, 'Math', 56), (102, 'Hindi', 78), (102, 'English', 49);
GO

-- Repeat rows N times (Q24 / Q362)
CREATE TABLE NTimesDemo (Name VARCHAR(20), NTimes INT);
INSERT INTO NTimesDemo VALUES ('Vikas', 4), ('Rohit', 1), ('Vinod', 3);
GO

-- Blank-value join (TCS Q10): Table1 has 'Vikas' and '', Table2 has ''
CREATE TABLE Table1 (Name VARCHAR(20));
CREATE TABLE Table2 (Name VARCHAR(20));
INSERT INTO Table1 VALUES ('Vikas'), ('');
INSERT INTO Table2 VALUES ('');
GO