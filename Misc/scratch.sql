----------------------------------------------------------------------------------------------
-- Create new table for retiring employees (--> 'retirement_info')
DROP TABLE retirement_info;
SELECT emp_no, first_name, last_name, birth_date
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Creat new table of current employees (--> 'current_emp')
DROP TABLE current_emp;
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
    ri.birth_date,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');
-- Check the table
SELECT * FROM current_emp;

-- Determine the number of current employees who are eligible for retirement
SELECT COUNT(first_name)
FROM current_emp
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- FINDING: 33118 current employees are eligible for retirement. 

-- Determine the number of current employees in each dept
SELECT COUNT(ce.emp_no), de.dept_no
INTO count_emp_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY dept_no;
----------------------------------------------------------------------------------------------