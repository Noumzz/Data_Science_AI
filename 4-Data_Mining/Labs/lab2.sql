-- create database CompanyDB;
-- use CompanyDB;
-- create table Employee(
-- EmpId int auto_increment primary key,
-- FirstName varchar(50),
-- LastName varchar(50),
-- email varchar(50),
-- PhoneNumber varchar(50),
-- DepId int,
-- salary decimal,
-- foreign key (DepId) references Departments(DepId)
-- );
-- create table Departments(
-- DepId int auto_increment primary key,
-- DepartmentName varchar(50));

-- insert into departments values
-- (1, 'Sales'),
-- (2, 'Marketing'),
-- (3, 'Engineering'),
-- (4, 'HR'),
-- (5, 'Finance');
-- insert into employee values
-- (1, 'John', 'Doe', 'john.doe@example.com', '555-1234', 1, 55000.00),
-- (2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', 2, 62000.00),
-- (3, 'Emily', 'Jones', 'emily.jones@example.com', '555-8765', 3, 70000.00),
-- (4, 'Michael', 'Brown', 'michael.brown@example.com', '555-4321', 4, 45000.00),
-- (5, 'Jessica', 'Davis', 'jessica.davis@example.com', '555-6789', 5, 48000.00),
-- (6, 'Chris', 'Wilson', 'chris.wilson@example.com', '555-2468', 1, 53000.00),
-- (7, 'Sarah', 'Miller', 'sarah.miller@example.com', '555-1357', 2, 67000.00),
-- (8, 'David', 'Taylor', 'david.taylor@example.com', '555-9753', 3, 72000.00),
-- (9, 'Ashley', 'Anderson', 'ashley.anderson@example.com', '555-8642', 4, 52000.00),
-- (10, 'Joshua', 'Thomas', 'joshua.thomas@example.com', '555-7531', 5, 51000.00),
-- (11, 'Stephanie', 'Moore', 'stephanie.moore@example.com', '555-6428', 1, 59000.00),
-- (12, 'Ryan', 'Martin', 'ryan.martin@example.com', '555-4812', 2, 68000.00),
-- (13, 'Laura', 'Jackson', 'laura.jackson@example.com', '555-3214', 3, 75000.00),
-- (14, 'Andrew', 'White', 'andrew.white@example.com', '555-2145', 4, 47000.00),
-- (15, 'Megan', 'Harris', 'megan.harris@example.com', '555-8647', 5, 49000.00),
-- (16, 'Kevin', 'Clark', 'kevin.clark@example.com', '555-7539', 1, 54000.00),
-- (17, 'Brittany', 'Lewis', 'brittany.lewis@example.com', '555-9876', 2, 66000.00),
-- (18, 'Brian', 'Walker', 'brian.walker@example.com', '555-7538', 3, 73000.00),
-- (19, 'Rebecca', 'Hall', 'rebecca.hall@example.com', '555-8649', 4, 50000.00),
-- (20, 'Justin', 'Allen', 'justin.allen@example.com', '555-3215', 5, 47000.00);



-- alter table employee
-- add column hiredate date;
-- update employee set hiredate ='2024-05-1' where empid = 1;
-- update employee set hiredate ='2022-01-1' where empid = 2;
-- update employee set hiredate ='2018-05-15' where empid = 3;
-- update employee set hiredate ='2017-06-22' where empid = 4;
-- update employee set hiredate ='2016-07-02' where empid = 5;
-- update employee set hiredate ='2015-08-04' where empid = 6;
-- update employee set hiredate ='2014-05-01' where empid = 7;
-- update employee set hiredate ='2023-05-15' where empid = 8;
-- update employee set hiredate ='2021-05-05' where empid = 9;
-- update employee set hiredate ='2021-05-04' where empid = 10;
-- update employee set hiredate ='2023-05-15' where empid = 11;
-- update employee set hiredate ='2023-05-15' where empid = 12;
-- update employee set hiredate ='2023-05-15' where empid = 13;
-- update employee set hiredate ='2023-05-15' where empid = 14;
-- update employee set hiredate ='2023-05-15' where empid = 15;
-- update employee set hiredate ='2023-05-15' where empid = 16;
-- update employee set hiredate ='2020-05-10' where empid = 17;
-- update employee set hiredate ='2020-05-22' where empid = 18;
-- update employee set hiredate ='2021-01-15' where empid = 19;
-- update employee set hiredate ='2022-04-15' where empid = 20;

-- use companydb;
-- alter database companydb modify name= fatory;

-- select * from employee;

-- select * from departments;

-- select firstname,lastname
-- from employee
-- where empid=1;

-- select firstname,lastname
-- from employee
-- where lastname like"%s";
-- select firstname,lastname,depid
-- from employee
-- where depid=(select depid from departments where departmentname='sales');
-- select *
-- from employee
-- where hiredate>"2022-01-01";




