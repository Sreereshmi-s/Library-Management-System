# Library Management System

## Overview
This project is based on a **Library Management System** designed to keep track of all the information about books in the library, including their cost, status, and total number of books available. 

## Database Details
The system uses a database named `library`, which consists of the following tables:

### Tables and Attributes

1. **Branch**
    - **Branch_no**: Primary Key
    - **Manager_Id**
    - **Branch_address**
    - **Contact_no**

2. **Employee**
    - **Emp_Id**: Primary Key
    - **Emp_name**
    - **Position**
    - **Salary**
    - **Branch_no**: Foreign Key (references `Branch_no` in the `Branch` table)

3. **Books**
    - **ISBN**: Primary Key
    - **Book_title**
    - **Category**
    - **Rental_Price**
    - **Status**: "Yes" if the book is available, "No" if not
    - **Author**
    - **Publisher**

4. **Customer**
    - **Customer_Id**: Primary Key
    - **Customer_name**
    - **Customer_address**
    - **Reg_date**

5. **IssueStatus**
    - **Issue_Id**: Primary Key
    - **Issued_cust**: Foreign Key (references `Customer_Id` in the `Customer` table)
    - **Issued_book_name**
    - **Issue_date**
    - **Isbn_book**: Foreign Key (references `ISBN` in the `Books` table)

6. **ReturnStatus**
    - **Return_Id**: Primary Key
    - **Return_cust**
    - **Return_book_name**
    - **Return_date**
    - **Isbn_book2**: Foreign Key (references `ISBN` in the `Books` table)

## SQL Queries
Below are the some SQL query results:
1. **Retrieve the book title, category, and rental price of all available books:**
 ![Query 1](https://github.com/user-attachments/assets/8495f943-f944-4699-ad2d-a9616ec80678)
2. **List the employee names and their respective salaries in descending order of salary:**
 ![Query 2](https://github.com/user-attachments/assets/91777f38-a30d-4c3e-88d7-2170f2f5c7be)
3. **Retrieve the book titles and the corresponding customers who have issued those books:**
 ![Query 3](https://github.com/user-attachments/assets/f860188b-9833-4e66-a6c2-c1ab0bc1d9c0)
4. **Display the total count of books in each category:**
 ![Query 4](https://github.com/user-attachments/assets/1bfe7258-24f9-4e7b-89cd-254269251278)
5. **Retrieve the employee names and their positions for employees with salaries above Rs.50,000:** 
![Query 5](https://github.com/user-attachments/assets/4d7a70ca-05af-43a5-a91f-acfb0d62d3a1)
6. **List the customer names who registered before 2022-01-01 and have not issued any books yet:** 
![Query 6](https://github.com/user-attachments/assets/8f071252-f9d7-427e-9bf3-4cc844bcf9bf)
7. **Display the branch numbers and the total count of employees in each branch:** 
![Query 7](https://github.com/user-attachments/assets/3e4f48fe-c2ce-491d-ace3-19497b881c1f)
8. **Display the names of customers who have issued books in June 2023:**
![Query 8](https://github.com/user-attachments/assets/3df77fa9-b55b-4f58-9a5a-d28c28a22ef7)
9. **Retrieve book titles from the `Books` table containing the word "history":**
![Query 9](https://github.com/user-attachments/assets/7255005a-0b9f-4041-875c-54d64d64cd34)
10. **Retrieve the branch numbers along with the count of employees for branches having more than 5 employees:**
![Query 10](https://github.com/user-attachments/assets/7a68a8eb-dd4f-460a-9a1b-9bd4fe76c26d)
11. **Retrieve the names of employees who manage branches and their respective branch addresses:** 
![Query 11](https://github.com/user-attachments/assets/d953ca5e-2f15-459b-8585-90e016134772)
12. **Display the names of customers who have issued books with a rental price higher than Rs. 25:**
![Query 12](https://github.com/user-attachments/assets/3a3a46f8-4c83-4515-b87a-47fc3a42a4aa)


