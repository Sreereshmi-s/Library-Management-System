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
1. ![Query 1](https://github.com/user-attachments/assets/8495f943-f944-4699-ad2d-a9616ec80678)
2. ![Query 2](https://github.com/user-attachments/assets/91777f38-a30d-4c3e-88d7-2170f2f5c7be)
3. ![Query 3](https://github.com/user-attachments/assets/f860188b-9833-4e66-a6c2-c1ab0bc1d9c0)
4. ![Query 4](https://github.com/user-attachments/assets/1bfe7258-24f9-4e7b-89cd-254269251278)
5. ![Query 5](https://github.com/user-attachments/assets/4d7a70ca-05af-43a5-a91f-acfb0d62d3a1)
6. ![Query 6](https://github.com/user-attachments/assets/8f071252-f9d7-427e-9bf3-4cc844bcf9bf)
7. ![Query 7](https://github.com/user-attachments/assets/3e4f48fe-c2ce-491d-ace3-19497b881c1f)
8. ![Query 8](https://github.com/user-attachments/assets/3df77fa9-b55b-4f58-9a5a-d28c28a22ef7)
9. ![Query 9](https://github.com/user-attachments/assets/7255005a-0b9f-4041-875c-54d64d64cd34)
10. ![Query 10](https://github.com/user-attachments/assets/7a68a8eb-dd4f-460a-9a1b-9bd4fe76c26d)
11. ![Query 11](https://github.com/user-attachments/assets/d953ca5e-2f15-459b-8585-90e016134772)
12. ![Query 12](https://github.com/user-attachments/assets/3a3a46f8-4c83-4515-b87a-47fc3a42a4aa)


