create database library;
use library;

#1
create table Branch(Branch_no int primary key,
Manager_Id  int,
Branch_address varchar(50), 
Contact_no bigint);
desc Branch;
insert into  Branch values
(110,1,'wbc_banks_India',223344),
(111,2,'NFC_banks_India',116644);
insert into  Branch values
(112,3,'Canara_banks',225688),
(113,4,'Baroda_banks',444455566),
(114,3,'South_banks',2266824949),
(115,3,'North_banks',242638173),
(116,3,'East_banks',53138437641),
(117,3,'canara_banks',35167173),
(118,3,'Canara_banks',36157631),
(119,3,'East_banks',71313334),
(120,3,'wbc_banks_india',6513136);

insert into  Branch values
(121,12,'SB_India',5566338),
(122,13,'Fedral_India',12344321),
(123,14,'Canara_banks',229998778),
(124,15,'SB_banks',44451782),
(125,16,'fedral_banks',2283387),
(126,17,'SB_banks',892638173),
(127,18,'Fedral_banks',12138437641),
(128,19,'SB_banks',53167173),
(129,20,'SB_banks',38957631),
(130,21,'SB_banks',6819313334),
(131,22,'canara_banks_india',52713136);
select * from branch;
truncate branch;
update branch set Manager_Id=11 where Branch_no=120;



#2
create table Employee(Emp_Id int PRIMARY KEY,  
Emp_name varchar(20), 
Position varchar(20) ,
Salary int,
Branch_no int,
 FOREIGN KEY(Branch_no) references Branch(Branch_no)
 );
 desc Employee;
 insert into Employee values
(123, 'John Smith', 'Manager', 75000, 110),
       (456, 'Jane Doe', 'Manager', 68000, 111),
       (789, 'Alice Brown', 'Librarian', 45000, 112),
       (012, 'Bob Johnson', 'Librarian', 42000, 113),
       (345, 'Charlie Wilson', 'Assistant Librarian', 38000, 114),
       (678, 'David Miller', 'Assistant Librarian', 40000, 115),
       (901, 'Emily Jones', 'Intern', 25000, 116),
       (234, 'Frank Garcia', 'Intern', 28000, 117),
       (567, 'Grace Garcia', 'Intern', 30000, 118),
       (890, 'Henry Williams', 'Intern', 22000, 119);
       select * from employee;
       insert into employee values
       (666, 'David Miller', 'Assistant Librarian', 40000, 115),
       (647, 'Emily Jones', 'Intern', 25000, 115),
       (891, 'Frank Garcia', 'Intern', 28000, 115),
       (900, 'Grace Garcia', 'Intern', 30000, 115),
       (943, 'Henry Williams', 'Intern', 22000, 115);

 #3
 create table Books( 
ISBN int PRIMARY KEY,
Book_title varchar(20),
Category varchar(20), 
Rental_Price int,
Status char(3) check (status in ('yes' , 'No')),
Author varchar(20),
Publisher varchar(20));
desc Books;
 alter table Books modify Rental_price decimal;
 alter table Books modify Book_title varchar(40);
 alter table Books modify Publisher varchar(40);
 alter table Books modify Author varchar(40);
insert into Books values
(9781234, 'The Lord of the Rings', 'Fantasy', 10.00, 'yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
(9780987, 'Pride and Prejudice', 'Romance', 38.50, 'no', 'Jane Austen', 'Penguin Classics'),
(9781111, 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic Inc.'),
(9783333, 'The Hitchhiker\'s Guide to the Galaxy', 'Science Fiction', 49.25, 'yes', 'Douglas Adams', 'Pan Books'),
(9782222, 'To Kill a Mockingbird', 'Fiction', 8.00, 'no', 'Harper Lee', 'J.B. Lippincott & Co.'),
(9785555, 'The Great Gatsby', 'Fiction', 7.50, 'yes', 'F. Scott Fitzgerald', 'Charles Scribner\'s Sons'),
(9787777, 'One Hundred Years of Solitude', 'Magical Realism', 29.75, 'yes', 'Gabriel García Márquez', 'Editorial Sudamericana'),
(9786666, 'Crime and Punishment', 'Novel', 8.25, 'no', 'Fyodor Dostoevsky', 'Fyodor Stellovsky'),
(9788888, 'The Catcher in the Rye', 'Coming-of-age', 37.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
(9784444, 'The Adventures of nemo','adventure',30.0,'no','ashik','D_C_books');
select * from Books;
update books set category = 'history' where ISBN= 9787777;
select book_title,Category,rental_price from books;
update books set category = 'history' where ISBN=9782222 ;


#4
create table Customer(  
Customer_Id int PRIMARY KEY,  
Customer_name  varchar(15),
Customer_address  varchar(20),
Reg_date date);
alter table Customer modify Customer_name varchar (40);
insert into Customer values
(1004, 'David Lee', '4th Avenue, Seattle', '2023-07-12'),
(1005, 'Emily Hernandez', '5th Street, Miami', '2020-05-15'),
(1006, 'Frank Lopez', '6th Street, Atlanta', '2020-06-01'),
(1007, 'Grace Johnson', '7th Avenue, Denver', '2023-01-10'),
(1008, 'Henry Garcia', '8th Street, Phoenix', '2021-12-10'),
(1009, 'Isabella Rodriguez', '9th Avenue, San Antonio', '2023-04-20'),
(1010, 'Jacob Young', '10th Street, San Diego', '2022-08-01'),
(1001, 'Haary Garcia', '8th Street, Phoenix', '2021-12-31'),
(1002, 'moris Rodriguez', '9th Avenue, San Antonio', '2023-04-20'),
(1003, 'Jaxon Young', '10th Street, San Diego', '2022-08-01');
select * from Customer;
insert into Customer values
(1011, 'David Cooper', '4th Avenue', '2020-07-12'),
(1012, 'zam Hernandez', '5th Street, pondi', '2020-05-15'),
(1013, 'Frank kops', '6th Street, jomzy', '2019-06-01');


#5. 
create table IssueStatus(  
Issue_Id int PRIMARY KEY,  
Issued_cust int,FOREIGN KEY(Issued_cust) references Customer(customer_id), 
Issue_date date,
Isbn_book int, FOREIGN KEY (Isbn_book) references Books(ISBN)); 
insert into Issuestatus values
(1, 1001, '2023-07-10',9788888),
(2, 1002, '2023-06-20', 9780987),
(3, 1003, '2023-06-15', 9781111),
(4, 1004, '2022-04-25', 9781234),
(5, 1005, '2022-02-25', 9782222),
(6, 1006, '2023-04-25', 9783333),
(7, 1007, '2022-02-25', 9784444),
(8, 1008, '2024-01-25', 9785555),
(9, 1009, '2022-03-25', 9786666),
(10,1010, '2023-02-23', 9787777);
select * from books;
select * from IssueStatus;
 
#6. 
create table ReturnStatus(  
Return_Id int PRIMARY KEY,  
Return_cust varchar(50), 
Return_book_name varchar(15) ,
Return_date  date,
Isbn_book2 int, FOREIGN KEY( Isbn_book2)references Books(ISBN)
);
select * from ReturnStatus;

insert into ReturnStatus values
(01,1001,'The Catcher in the Rye','2023-07-30',9788888),
(02,1002,'Pride and Prejudice','2023-06-30',9780987
),
(03,1003,'Harry Potter and the Sorcerers Stone','2023-07-20',9781111
),
(04,1004,'The Lord of the Rings','2023-05-10',9781234
),
(05,1005,'To Kill a Mockingbird','2023-05-30',9782222
),
(06,1006,'The Hitchhikers Guide to the Galaxy','2023-08-10',9783333
),
(07,1007,'The Adventures of nemo','2023-10-30',9784444
),
(08,1008,'The Great Gatsby','2024-05-12',9785555
),
(09,1009,'Crime and Punishment','2022-08-10',9786666
),
(10,1010,'One Hundred Years of Solitude','2023-03-10',9787777);
select * from Returnstatus;
show tables;



	
    

select emp_name, salary from employee order by salary desc;


# 3 
Select b.Book_title, c.Customer_name
from Books b
INNER JOIN IssueStatus i ON b.ISBN = i.Isbn_book
INNER JOIN Customer c ON i.Issued_cust = c.Customer_Id;

select count(ISBN),category from Books group by Category;

select Emp_name,Position,salary from Employee where salary >50000;

Select Customer_name
from Customer
where Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

select Branch_no,count(Branch_address) from branch group by Branch_address ;

Select Branch_no, COUNT(*) as Employee_Count
from Employee
GROUP BY Branch_no;


select Book_title , category from books where Category = 'history' ;

Select c.Customer_name
From Customer c
Inner join IssueStatus i ON c.Customer_Id = i.Issued_cust
Where Month(i.Issue_date) = 6 and Year(i.Issue_date) = 2023;


select student.name,student.age,student.gender,department.D_Name from student left join department on student.roll_No = department.roll_No;
select Branch.Branch_no,employee.count(Emp_Id) from Branch left join employee on branch.Branch_no= employee.branch_no;

Select Branch_no, COUNT(*) AS Employee_Count
from Employee
Group by Branch_no
Having COUNT(*) > 5;

select employee.emp_name ,branch.Branch_address from employee inner join branch  on
employee.Branch_no= branch.branch_no
where employee.position = 'manager';

SELECT c.Customer_name,b.Rental_price
FROM Customer c
INNER JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
INNER JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;


select customer.Customer_name,issuestatus.Issued_cust from customer inner join issuestatus on customer.Customer_name