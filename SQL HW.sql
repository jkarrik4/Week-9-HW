CREATE TABLE employees(
	emp_no serial PRIMARY KEY,
	birth_date timestamp NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date timestamp NOT NULL
);

CREATE TABLE dept_emp(
	emp_no serial REFERENCES employees(emp_no),
	dept_no VARCHAR NOT NULL,
	from_date TIMESTAMP NOT NULL,
	to_date TIMESTAMP NOT NULL
);

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no serial REFERENCES employees(emp_no),
	from_date timestamp NOT NULL,
	to_date timestamp NOT NULL
);

CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL
);

CREATE TABLE salaries(
	emp_no serial REFERENCES employees(emp_no),
	salary INT NOT NULL,
	from_date timestamp NOT NULL,
	to_date timestamp NOT NULL
);

create TABLE titles(
	emp_no serial REFERENCES employees(emp_no),
	title VARCHAR NOT NULL,
	from_date timestamp NOT NULL,
	to_date timestamp NOT NULL
);

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees JOIN salaries on employees.emp_no = salaries.emp_no;


SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;


SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;


SELECT first_name, last_name
FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE departments.dept_name = 'Sales';


SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';


SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;