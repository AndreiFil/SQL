/*==================================================================================
=============================Table creation block==================================*/

--1.Create an employees table 

CREATE TABLE employees(
		id serial PRIMARY KEY,
		employee_name VARCHAR(50) NOT NULL
)

--2.Create a salary table

CREATE TABLE salary(
		id serial PRIMARY KEY,
		monthly_salary INT NOT NULL
);


--3.Create an employee_salary table

CREATE TABLE employee_salary(
		id serial PRIMARY KEY,
		employee_id INT NOT NULL UNIQUE,
		salary_id INT NOT NULL	
);


--4.Ñreate a roles table

CREATE TABLE roles (
		id serial PRIMARY KEY,
		role_name INT NOT NULL UNIQUE NOT 
);


/*5.Create a roles_employee table
	employee_id. Int, not null, unique (foreign key for employees table, id field)
	role_id. Int, not null (foreign key for roles table, id field)*/

CREATE TABLE roles_employee(
		id serial PRIMARY KEY,
		employee_id INT NOT NULL UNIQUE,
		role_id INT NOT NULL,
			FOREIGN KEY (employee_id) REFERENCES employees(id),
			FOREIGN KEY (role_id) REFERENCES roles(id)
);

--==================================================================================

/*==================================================================================
================================Data Type Change block============================*/

--Change type of data in role_name table from integer to varchar(30)
ALTER TABLE roles
ALTER COLUMN role_name TYPE VARCHAR(30) USING roles::VARCHAR(30);

--==================================================================================



/*==================================================================================
================================All select command in the one place===============*/

SELECT * FROM employees;
SELECT * FROM salary;
SELECT * FROM employee_salary;
SELECT * FROM roles;
SELECT * FROM roles_employee;


--==================================================================================




--===============================Filling tables with Data block=====================

--6.Fill employees table  with 70 lines
INSERT INTO employees (employee_name)
VALUES ('Kathy'),('Shawn'),('Sandra'),('Pauline'),('Patricia'),('Christopher'),('Edward'),('Judith'),('Jennifer'),('Julie'),('Shirley'),('Kathy'),('Brandon'),
('Dennis'),('Rene'),('Michael'),('Monica'),('Deborah'),('Gloria'),('Brian'),('Teresa'),('Stephanie'),('Lauren'),('Tracy'),('Virginia'),('Margaret'),('Thomas'),
('William'),('Pamela'),('Norman'),('Rosa'),('Kenneth'),('Charles'),('Karen'),('Edward'),('Cindy'),('Lois'),('Michelle'),('Harold'),('Connie'),('Travis'),
('Lillie'),('Phillip'),('Steven'),('Lori'),('Dawn'),('Philip'),('Chad'),('Peggy'),('Carol'),('Karen'),('Esther'),('Christine'),('Edward'),('Carol'),('Claude'),
('Paul'),('Anna'),('Michael'),('Carlos'),('Donald'),('Jenny'),('Juan'),('Diane'),('Carmen'),('Brett'),('Beverly'),('Larry'),('John'),('Kimberly');

--7.Fill the salary table with 15 lines
INSERT INTO salary (monthly_salary)
VALUES	(1000), (1100), (1200), (1300), (1400), (1500), (1600), (1700), (1800), (1900), (2000), (2100), (2200), (2300), (2400), (2500);
	
--8.Fill the employee_salary table with 40 lines
INSERT INTO employee_salary(employee_id, salary_id)
VALUES (1,2), (2,2), (3,2), (4,4), (5,4), (6,4), (7,3), (8,3), (9,3), (10,10), (11,10), (12,10), (13,11), (14,11), (15,15), (16,16), (17,16),
		(19,16), (20,16), (21,3), (22,4), (23,5), (24,6), (25,7), (26,8), (27,9), (28,10), (29,11), (30,12), (31,13), (18,14), (71,15),
		(72,3), (73,3), (74,4), (75,4), (76,4), (77,4), (78,4), (79,1); 
	

--9.Fill the roles table with 20 lines
INSERT INTO roles(role_name)
VALUES  ('Junior Python developer'), ('Middle Python developer'), ('Senior Python developer'), ('Junior Java developer'), ('Middle Java developer'), ('Senior Java developer'),
		('Junior JavaScript developer'), ('Middle JavaScript developer'), ('Senior JavaScript developer'), ('Junior Manual QA engineer'), ('Middle Manual QA engineer'),
		('Senior Manual QA engineer'), ('Project Manager'), ('Designer'), ('HR'), ('CEO'), ('Sales manager'), ('Junior Automation QA engineer'), ('Middle Automation QA engineer');
	
--10 Fill the roles_employee with Data
INSERT INTO	roles_employee (employee_id, role_id)
VALUES (5,4), (4,3), (3,2), (2,1), (6,6), (7,7), (8,8), (9,9), (10,10), (11,11),
	   (20,12), (19,14), (18,14), (17,15), (16,15), (15,16), (14,17), (13,17), (12,18), (21,19),
	   (22,1), (23,2), (24,13), (25,4), (26,5), (27,6), (28,7), (29,8), (30,9), (31,10), 
	   (40,11), (39,12), (38,13), (37,14), (36,15), (35,16), (34,19), (33,18), (32,13), (1,19);
	
	
/*==================================================================================
==============================Drop tables block===================================*/
--DROP TABLE employee_salary;
--DROP TABLE salary;
--DROP TABLE employees;
--DROP TABLE roles_employee;
--DROP TABLE roles;
--==================================================================================