--Query #1: List employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;

--Query #2: List first name, last name, and hire date for employees 
--who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--Query #3: List the manager of each department with the following: 
--department number, department name, the manager's employee number, 
--last name, first name.
SELECT mg.dept_no, d.dept_name, mg.emp_no, e.last_name, e.first_name
FROM dept_manager AS mg
INNER JOIN employees AS e ON
e.emp_no=mg.emp_no
INNER JOIN departments AS d ON
d.dept_no=mg.dept_no;

--Query #4: List the department of each employee with the following:
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON
e.emp_no=de.emp_no
INNER JOIN departments AS d ON
d.dept_no=de.dept_no;

--Query #5: List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND SUBSTRING(last_name,1,1)='B';

--Query #6: List all employees in the Sales department, including 
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON
e.emp_no=de.emp_no
INNER JOIN departments AS d ON
d.dept_no = de.dept_no
WHERE d.dept_name='Sales';

--Query #7: List all employees in the Sales and Development depts, including 
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON
e.emp_no=de.emp_no
INNER JOIN departments AS d ON
d.dept_no = de.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

--Query #8: In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;