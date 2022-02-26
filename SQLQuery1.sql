---UC1 Create DataBase---
create database Payroll_Service;
use Payroll_Service;

---UC2 Create Table---
create table employee_payroll
(
 id int identity(1,1) primary key,
 name varchar(100),
 salary float,
 startdate date,
);

---UC3 Create Employee payroll database service as a part of CURD operation---
INSERT INTO employee_payroll (Name, Salary, Startdate) VALUES ('Mohammed', 45986.58, CAST('2018-02-02' as Date));
INSERT INTO employee_payroll  VALUES ('Sajid', 95986.58, getdate());
INSERT INTO employee_payroll  VALUES ('Sakil', 685986.58, getdate());
INSERT INTO employee_payroll (Name, startdate) VALUES ('Roy', getdate());

--- UC4 Ability to retrieve all the data that is added in payroll service database----
select * from employee_payroll where Name= 'Sajid';
select id,Name from employee_payroll where Name= 'Sajid';

---UC5 Ability to retrieve salary data for a particular employee-----
select salary from employee_payroll where Name= 'Sajid';
select * from employee_payroll;

---UC6 Ability to Add Gender To Employee----
ALTER TABLE employee_payroll ADD Gender char(1);

update employee_payroll set Gender='M' WHERE id=3;
update employee_payroll set Gender='M' WHERE id=1;
update employee_payroll set Gender='F' WHERE id=2;
update employee_payroll set Gender='M' WHERE id=1;
update employee_payroll set Gender='F' WHERE id=4;

select sum(Salary) as TotalSalary,Gender from employee_payroll group by Gender;
select * from employee_payroll;
select Avg(salary) as NumbOfEmployees,Gender from employee_payroll group by Gender;

----UC7 Ability to find sum, average, min, max no of male and female---


select sum(salary) as 'totalSalary',Gender from employee_payroll group by Gender;
select avg(salary) as 'averageSalary',Gender from employee_payroll group by Gender;
select min(salary) as 'minimumSalary',Gender from employee_payroll group by Gender;
select max(salary) as 'maximumSalary',Gender from employee_payroll group by Gender;
select count(Gender) as 'male' from employee_payroll where Gender='M';
select count(Gender) as 'female' from employee_payroll where Gender='F'; 

select * from employee_payroll;

---UC8 Ability to store employee information like employee phone, address-----

alter table employee_payroll add 
phone varchar(200),
department varchar(100) not null default 'CSE',
address varchar(250) not null default 'Banglore';

---UC9 Ability to extend employee payroll table----


alter table employee_payroll add
basicPay float,
deduction float,
taxablePay float,
incomeTax float;

---UC10 Ability To Make Terissa of sales and marketing department----

insert into employee_payroll values
('Terisa',700000.0,'2020-08-14','F','8734586245','sales','india',100.0,12000.0,2000.0,1233.0)

insert into employee_payroll values
('Terisa',500000.0,'2020-08-14','F','8723586245','Marketing','india',100.0,12000.0,2000.0,1233.0)

select * from employee_payroll where name='Terisa';