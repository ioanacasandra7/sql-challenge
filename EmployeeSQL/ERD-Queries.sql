-- Queries

--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
    employee.emp_no,
    employee.last_name,
    employee.first_name,
    employee.gender,
    salary.salary
from employee
    JOIN salary on employee.emp_no = salary.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT
    employee.first_name,
    employee.last_name,
    employee.hire_date
FROM employee 
WHERE employee.hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
	department.dep_no,
	department.dept_name,
	dept_manager.emp_no,
	employee.first_name,
	employee.last_name    
from department 
	JOIN dept_manager on dept_manager.dep_no = department.dep_no
	JOIN employee on dept_manager.emp_no = employee.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
employee.emp_no,
employee.last_name,
employee.first_name,
department.dept_name
from employee
    JOIN dep_employee on dep_employee.emp_no = employee.emp_no
    JOIN department on department.dep_no = dep_employee.dep_no
	
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."	
Select
    employee.first_name,
    employee.last_name
from employee
WHERE
employee.first_name = 'Hercules' and employee.last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.   
SELECT
    employee.emp_no,
    employee.last_name,
    employee.first_name,
    department.dept_name
from employee
    JOIN dep_employee on dep_employee.emp_no = employee.emp_no
    JOIN department on department.dep_no = dep_employee.dep_no
Where
	department.dept_name = 'Sales'
	
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.  
SELECT
    employee.emp_no,
    employee.last_name,
    employee.first_name,
    department.dept_name
from employee
    JOIN dep_employee on dep_employee.emp_no = employee.emp_no
    JOIN department on department.dep_no = dep_employee.dep_no
Where
	department.dept_name IN ('Sales', 'Development')
	
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. 
SELECT
    employee.last_name, count(employee.last_name) as Count_Last_Name
from employee
GROUP BY 
employee.last_name
ORDER BY 
Count_Last_Name desc