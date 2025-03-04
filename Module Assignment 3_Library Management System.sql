-- Create the database
CREATE DATABASE library;
USE library;

-- Create the tables
--  Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Books table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(10),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Insert Values
-- Branch table
INSERT INTO Branch VALUES
(1, 101, 'Downtown', '1234567890'),
(2, 102, 'Uptown', '0987654321');

-- Employee table
INSERT INTO Employee VALUES
(201, 'Alice', 'Manager', 60000, 1),
(202, 'Bob', 'Assistant', 40000, 1),
(203, 'Charlie', 'Clerk', 35000, 2),
(204, 'Diana', 'Manager', 55000, 2);

-- Books table
INSERT INTO Books VALUES
(1001, 'Book A', 'Fiction', 20, 'Yes', 'Author A', 'Publisher X'),
(1002, 'Book B', 'History', 25, 'No', 'Author B', 'Publisher Y'),
(1003, 'Book C', 'Science', 30, 'Yes', 'Author C', 'Publisher Z');

-- Customer table
INSERT INTO Customer VALUES
(301, 'John Doe', '123 Elm St', '2021-12-15'),
(302, 'Jane Smith', '456 Oak St', '2023-05-10');

-- IssueStatus table
INSERT INTO IssueStatus VALUES
(401, 301, 'Book B', '2023-06-15', 1002);

-- ReturnStatus table
INSERT INTO ReturnStatus VALUES
(501, 301, 'Book B', '2023-06-20', 1002);

-- Queries

#1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price 
FROM Books
WHERE Status = 'Yes';

#2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary 
FROM Employee
ORDER BY Salary DESC;

#3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name 
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

#4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books 
FROM Books
GROUP BY Category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position 
FROM Employee
WHERE Salary > 50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name 
FROM Customer C
WHERE Reg_date < '2022-01-01' 
AND NOT EXISTS (
    SELECT 1 FROM IssueStatus I WHERE I.Issued_cust = C.Customer_Id
);

#7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee
GROUP BY Branch_no;

#8. Display the names of customers who have issued books in the month of June 2023.
SELECT C.Customer_name 
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;

#9. Retrieve book_title from book table containing history.
SELECT Book_title 
FROM Books
WHERE Category LIKE '%History%';

#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

#11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address 
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

#12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT C.Customer_name 
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;