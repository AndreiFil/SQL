--==================================================================================
--===========================Table creation block===================================

--1.Create an employees table 

create  table employees(
	id serial primary key,
	employee_name varchar(50) not null
)

--2.Create a salary table

create table salary(
	id serial primary key,
	monthly_salary int not null
);


--3.Create an employee_salary table
create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null	
);


--4.Сreate a roles table
create table roles (
	id serial primary key,
	role_name int unique not null 
);


--5.Create a roles_employee table
--- employee_id. Int, not null, unique (foreign key for employees table, id field)
--- role_id. Int, not null (foreign key for roles table, id field)

create table roles_employee(
	id serial primary key,
	employee_id int unique not null,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);
--==================================================================================

--==================================================================================
--================================Data Type Change block============================
--Поменять тип столба role_name с int на varchar(30)
alter table roles alter column role_name type varchar(30) using roles::varchar(30);

--==================================================================================



--==================================================================================
--================================All select command in the one place===============
select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;


-==================================================================================



--===============================Filling tables with Data==========================

--6.Fill employees table  with 70 lines
insert into employees (employee_name)
values ('Kathy'),('Shawn'),('Sandra'),('Pauline'),('Patricia'),('Christopher'),('Edward'),('Judith'),('Jennifer'),('Julie'),('Shirley'),('Kathy'),('Brandon'),
('Dennis'),('Rene'),('Michael'),('Monica'),('Deborah'),('Gloria'),('Brian'),('Teresa'),('Stephanie'),('Lauren'),('Tracy'),('Virginia'),('Margaret'),('Thomas'),
('William'),('Pamela'),('Norman'),('Rosa'),('Kenneth'),('Charles'),('Karen'),('Edward'),('Cindy'),('Lois'),('Michelle'),('Harold'),('Connie'),('Travis'),
('Lillie'),('Phillip'),('Steven'),('Lori'),('Dawn'),('Philip'),('Chad'),('Peggy'),('Carol'),('Karen'),('Esther'),('Christine'),('Edward'),('Carol'),('Claude'),
('Paul'),('Anna'),('Michael'),('Carlos'),('Donald'),('Jenny'),('Juan'),('Diane'),('Carmen'),('Brett'),('Beverly'),('Larry'),('John'),('Kimberly');

--7.Fill the salary table with 15 lines
insert into salary (monthly_salary)
values	(1000), (1100), (1200), (1300), (1400), (1500), (1600), (1700), (1800), (1900), (2000), (2100), (2200), (2300), (2400), (2500);
	
--8.Fill the employee_salary table with 40 lines
insert into employee_salary(employee_id, salary_id)
values (1,2), (2,2), (3,2), (4,4), (5,4), (6,4), (7,3), (8,3), (9,3), (10,10), (11,10), (12,10), (13,11), (14,11), (15,15), (16,16), (17,16),
		(19,16), (20,16), (21,3), (22,4), (23,5), (24,6), (25,7), (26,8), (27,9), (28,10), (29,11), (30,12), (31,13), (18,14), (71,15),
		(72,3), (73,3), (74,4), (75,4), (76,4), (77,4), (78,4), (79,1); 
	

--9.Fill the roles table with 20 lines
insert into roles(role_name)
values  ('Junior Python developer'), ('Middle Python developer'), ('Senior Python developer'), ('Junior Java developer'), ('Middle Java developer'), ('Senior Java developer'),
		('Junior JavaScript developer'), ('Middle JavaScript developer'), ('Senior JavaScript developer'), ('Junior Manual QA engineer'), ('Middle Manual QA engineer'),
		('Senior Manual QA engineer'), ('Project Manager'), ('Designer'), ('HR'), ('CEO'), ('Sales manager'), ('Junior Automation QA engineer'), ('Middle Automation QA engineer');
	
	
	
-==================================================================================
--==============================Drop tables block==================================
drop table employee_salary;
drop table salary;
drop table employees;
drop table roles_employee;
drop table roles;
-==================================================================================