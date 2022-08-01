------------------------------------------------------------------------------------
------------------ BEGIN Determine Retirement Eligibility --------------------------

-- Return a list of employees who are nearing retirement
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
-- FINDING: >10k employees are nearing retirement, which will be creating a substantial
-- number of job openings in the next several years

-- Return a list of employees who were born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Return a list of employees who were born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- Return a list of employees who were born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- Return a list of employees who were born in 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Save to a new table (retirement_info) a list of employees who are eligible for retirement
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Determine the number of employees who are eligible for retirement
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- FINDING: 41380 employees are eligible for retirement. Cross-check 'retirement_info.csv'
-- to verify that there are 41381 rows (incl header row).

------------------------------------------------------------------------------------
------------------ END Determine Retirement Eligibility ----------------------------

------------------------------------------------------------------------------------
------------------ Merge (Join) Tables ---------------------------------------------

DROP TABLE retirement_info;

-- Create new table for retiring employees ('retirement_info')
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Use inner join to merge the 'departments' and 'dept_manager' tables
--SELECT departments.dept_name,
--     dept_manager.emp_no,
--     dept_manager.from_date,
--     dept_manager.to_date
--FROM departments
--INNER JOIN dept_manager
--ON departments.dept_no = dept_manager.dept_no;

-- Use left join to merge 'retirement_info' and 'dept_emp' tables
--SELECT retirement_info.emp_no,
--    retirement_info.first_name,
--retirement_info.last_name,
--    dept_emp.to_date
--FROM retirement_info
--LEFT JOIN dept_emp
--ON retirement_info.emp_no = dept_emp.emp_no;

-- Use inner join & aliases to merge the 'departments' and 'dept_manager' tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Use left join & aliases to merge 'retirement_info' and 'dept_emp' tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
------------------ BEGIN Get count of employees for each dept ----------------------

-- Use left join w/COUNT & GROUP BY functions to get Employee count by dept number
-- Use INTO function to save results to a new table
SELECT COUNT(ce.emp_no), de.dept_no
INTO count_emp_per_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

------------------------------------------------------------------------------------
------------------ END Get count of employees for each dept ------------------------
    
------------------------------------------------------------------------------------
------------------ BEGIN Generate List #1 (employee information list) --------------
SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')  
     AND (de.to_date = '9999-01-01'); 

------------------------------------------------------------------------------------
------------------ END Generate List #1 (employee information list) -----------------


------------------------------------------------------------------------------------
------------------ BEGIN Generate List #2 (managers list) --------------------------
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

------------------------------------------------------------------------------------
------------------ END Generate List #2 (managers list) ----------------------------

------------------------------------------------------------------------------------
---- BEGIN Generate List #3 (current employees who are eligible for retirement)-----
-- List of eligible retirees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);
------------------------------------------------------------------------------------
----- END Generate List #3 (current employees who are eligible for retirement)------

------------------------------------------------------------------------------------
---- BEGIN Generate List #4 -----
-- INSTRUCTIONS (Module 7.3.6)
-- Create a query that will return only the information relevant to the Sales team. The requested list includes:

--Employee numbers
--Employee first name
--Employee last name
--Employee department name

--NOTE: This new list should will contain everything in the retirement_info table, only tailored for the Sales team.
------------------------------------------------------------------------------------
----- END Generate List #4 -----

------------------------------------------------------------------------------------
---- BEGIN Generate List #5 -----
-- INSTRUCTIONS (Module 7.3.6)
-- Create another query that will return the following information for the Sales and Development teams:

--Employee numbers
--Employee first name
--Employee last name
--Employee department name
--Hint: You'll need to use the IN condition with the WHERE clause. See the PostgreSQL documentation (Links to an external site.) for additional information.

--NOTE: The IN condition is necessary because you're creating two items in the same column.

------------------------------------------------------------------------------------
----- END Generate List #5 -----