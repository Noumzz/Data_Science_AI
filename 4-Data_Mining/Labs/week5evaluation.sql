-- create database CompanyDB;
use CompanyDB;

-- create table Departments(
-- DepId int auto_increment primary key,
-- DepName varchar(50)
-- );
-- create table Employees(
-- EmpId int auto_increment primary key,
-- FirstName varchar(50),
-- LastName varchar(50),
-- HireDate DATE,
-- DepId int,
-- foreign key (DepId) references Departments(DepId)
-- );
-- insert into Departments(DepName) values
-- ('Sales'),
-- ('Marketing'),
-- ('HR');
-- insert into Departments(DepName) values
-- ('Finances'),
-- ('IT'),
-- ('Operation');
-- select * from Departments;
-- insert into Employees(FirstName,LastName,HireDate,DepId) values
-- ('Jhon','Doe','2023-01-15',1),
-- ('Jane','Smith',"2022-05-22",2),
-- ('Michael','Johnson','2021-09-10',3);
-- insert into Employees(FirstName,LastName,HireDate,DepId) values
-- ('Alice', 'Williams', '2023-02-10', 4),
-- ('Bob', 'Smith', '2023-03-15', 5),
-- ('Charlie', 'Johnson', '2023-04-20', 6),
-- ('David', 'Brown', '2023-05-25', 4),
-- ('Eva', 'Jones', '2023-06-30', 5);

-- Write a query to find all employees in the Finance department.
select *
from employees
where depid=(
select DepId 
from departments 
where DepName='Finances');
-- Write a query to find all employees hired in 2023.
select *
from employees
where hiredate >= '2023-01-01' and hiredate <= '2023-12-31';
-- where hiredate between '2023-1-01' and '2023-12-31';

-- Write a query to count employees per department, sorted by the number of employees.

SELECT e.depid,d.depname, count(e.depid) as NumEmployees
FROM Employees e
JOIN Departments d ON e.DepId = d.DepId
group by e.depid, d.depname
order by NumEmployees desc;
-- Write a query to update the department name from operations to operations and logistics
SET SQL_SAFE_UPDATES = 0;
-- update Departments
-- set DepName='Operations and Logistics'
-- where DepName='Operation';

-- delete from employees
-- where empid=(
-- select empid
-- from(select empid from employees where hiredate=
-- (select max(hiredate) from employees where depid=(select depid from departments where depname='IT')
-- )
-- )as temp
-- );

-- Write a query to find departments with more than two employees and list their employees.
select e.FirstName,e.LastName,d.DepName
from employees e
join departments d on e.depid=d.depid
where e.depid in(
select  e.depid
from employees e
join departments d on e.depid=d.depid
group by d.depid
having count(e.depid)>=2
);


























