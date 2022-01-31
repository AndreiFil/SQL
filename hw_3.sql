--1.Output names and salaries who has a salary in a base

SELECT emp.employee_name, sal.monthly_salary
  FROM employees AS emp 
  JOIN employee_salary AS emps
	ON emp.id = emps.employee_id
  JOIN salary AS sal 
	ON sal.id = emps.salary_id;
	
--2. Output employees who has a salary less than 2000
	
SELECT emp.employee_name, sal.monthly_salary
  FROM employees AS emp
  JOIN employee_salary AS emps 
	ON emp.id = emps.employee_id
  JOIN salary AS sal
	ON emps.salary_id = sal.id 
 WHERE sal.monthly_salary < 2000;
		
--3. Output all salary positions, but the employee is not assigned to them.

SELECT sal.monthly_salary, emp.employee_name
  FROM salary AS sal
LEFT JOIN employee_salary AS emps 	
	ON sal.id = emps.salary_id
LEFT JOIN employees AS emp 
	ON emp.id = emps.employee_id 
 WHERE emp.employee_name IS NULL;
		
-- 4.Output  all payroll positions less than 2000 but no employee assigned to them.
		
SELECT * FROM salary sal
LEFT JOIN employee_salary emps 	
	ON sal.id = emps.salary_id 
LEFT JOIN employees emp 
	ON emp.id = emps.employee_id
 WHERE emp.employee_name IS NULL 
   AND sal.monthly_salary <2000;
		
--5.Find all employees who have not been paid.
	
SELECT emp.id AS id,
	   emp.employee_name AS employee,
	   emps.salary_id AS salary
  FROM employees AS emp
LEFT JOIN employee_salary emps 	
	ON emp.id = emps.employee_id
 WHERE emps.salary_id IS NULL 
ORDER BY emp.id;
			
			
	
--6. Output all staff and their position name

SELECT e.employee_name AS staff,
	   r.role_name AS profession
  FROM employees AS e 
  JOIN roles_employee AS re 
	ON e.id = re.employee_id
  JOIN roles AS r 
	ON r.id = re.role_id;
	
--7. Output the names and position of Java developers only

SELECT emp.employee_name AS staff,
	   rol.role_name AS occupation
  FROM employees AS emp
  JOIN roles_employee AS rolemp 
    ON emp.id = rolemp.employee_id
  JOIN roles AS rol 
    ON rolemp.role_id = rol.id
 WHERE role_name LIKE '%Java%';


--8. Output the names and positions of Python developers only

SELECT emp.employee_name AS staff,
	   rol.role_name AS occupation
  FROM employees AS emp
  JOIN roles_employee AS rolemp 
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%Python%';

--9.Output the names and positions of QA engineers only
 
 SELECT emp.employee_name AS staff,
	   rol.role_name AS occupation
  FROM employees AS emp
  JOIN roles_employee AS rolemp 
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%QA%';


--Output the names and positions of manual QA engineers only

SELECT emp.employee_name AS staff,
	   rol.role_name AS occupation
  FROM employees AS emp
  JOIN roles_employee AS rolemp 
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%Manual QA%';

--11.Output the names and positions of automation QA engineers only

SELECT emp.employee_name AS staff,
	   rol.role_name AS occupation
  FROM employees AS emp
  JOIN roles_employee AS rolemp 
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%Automation QA%';

--12. Output the names and salaries of QA junior

SELECT emp.employee_name AS staff,
	   sal.monthly_salary AS salary,
	   rol.role_name AS occupation
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee AS rolemp
    ON emp.id = rolemp.id
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%Junior%';

--18. Output the names and salaries of Middle JS developers only

SELECT emp.employee_name AS staff,
	   sal.monthly_salary AS salary,
	   rol.role_name AS occupation
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee AS rolemp
    ON emp.id = rolemp.id
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%Middle JavaScript%';

--19.Output the names and salaries of  Senior Java developers only

SELECT emp.employee_name AS staff,
	   sal.monthly_salary AS salary,
	   rol.role_name AS occupation
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee AS rolemp
    ON emp.id = rolemp.id
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%Senior Java %';

--20.Output salaries of Junior QA engineers only

SELECT emp.employee_name AS staff,
	   sal.monthly_salary AS salary,
	   rol.role_name AS occupation
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee AS rolemp
    ON emp.id = rolemp.id
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%Junior%QA%';


--21.Output average salary of all specealist on the Junior position

SELECT AVG(sal.monthly_salary) AS average_Junior_salary
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee rolemp
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%Junior%';

 --22.Output average wage of all specialist of the JS developers
 
 SELECT SUM(sal.monthly_salary) AS sum_JS_dev_salaries
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee rolemp
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%JavaScript%';
 
 
--23.Output the minimum salary for QA engineers 
 
 SELECT MIN(sal.monthly_salary) AS QA_engineers_min_salary
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee rolemp
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%QA%';


--24.Output the maximum salary for quality Control Engineers
 
SELECT MAX(sal.monthly_salary) AS QA_engineers_max_salary
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee rolemp
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%QA%';

--25.Output amount of QA engineers

SELECT COUNT(rol.role_name) AS amount_of_QA_engineers
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee rolemp
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%QA%';

--26. Output amount of specialist on the Middle positions.

SELECT COUNT(rol.role_name) AS amount_of_QA_engineers
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee rolemp
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%Middle%';

--27.Output amount of developers

SELECT COUNT(rol.role_name) AS amount_of_developers
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee rolemp
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%eveloper%';

--28.Output sum of salaries of Developers

SELECT SUM(sal.monthly_salary) AS amount_of_QA_engineers
  FROM employees AS emp
  JOIN employee_salary AS empsal
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON sal.id = empsal.salary_id 
  JOIN roles_employee rolemp
    ON emp.id = rolemp.employee_id 
  JOIN roles AS rol
    ON rolemp.role_id = rol.id
 WHERE rol.role_name LIKE '%eveloper%';

--29.Output names, position and Wage  in ascending order

SELECT emp.employee_name AS staff,
	   rol.role_name AS occupation,
	   sal.monthly_salary AS wage
  FROM employees AS emp
  JOIN employee_salary AS empsal 
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON empsal.salary_id = sal.id 
  JOIN roles_employee AS rolemp 
    ON rolemp.employee_id = emp.id 
  JOIN roles AS rol
    ON rol.id = rolemp.role_id 
ORDER BY wage


--30.Output names, position and wage of specialist in ascending order if the  wage is between 1700 and 2300 

SELECT emp.employee_name AS staff,
	   rol.role_name AS occupation,
	   sal.monthly_salary AS wage
  FROM employees AS emp
  JOIN employee_salary AS empsal 
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON empsal.salary_id = sal.id 
  JOIN roles_employee AS rolemp 
    ON rolemp.employee_id = emp.id 
  JOIN roles AS rol
    ON rol.id = rolemp.role_id 
 WHERE sal.monthly_salary
BETWEEN 1700 AND 2300
ORDER BY wage

--31.Output names, position and wage of specialist  in ascending order if the wage is less than 2300 

SELECT emp.employee_name AS staff,
	   rol.role_name AS occupation,
	   sal.monthly_salary AS wage
  FROM employees AS emp
  JOIN employee_salary AS empsal 
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON empsal.salary_id = sal.id 
  JOIN roles_employee AS rolemp 
    ON rolemp.employee_id = emp.id 
  JOIN roles AS rol
    ON rol.id = rolemp.role_id 
 WHERE sal.monthly_salary < 2300
ORDER BY wage 

--32.Output names, position and wage of specialis in ascending order if the wage are equal with 1100, 1500, 2000

SELECT emp.employee_name AS staff,
	   rol.role_name AS occupation,
	   sal.monthly_salary AS wage
  FROM employees AS emp
  JOIN employee_salary AS empsal 
    ON emp.id = empsal.employee_id 
  JOIN salary AS sal
    ON empsal.salary_id = sal.id 
  JOIN roles_employee AS rolemp 
    ON rolemp.employee_id = emp.id 
  JOIN roles AS rol
    ON rol.id = rolemp.role_id 
 WHERE sal.monthly_salary IN (1100, 1500, 2000)
ORDER BY wage 





