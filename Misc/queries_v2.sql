---------------------------------------------------------------------------------------
--------------- Deliverable #1: Number of Retiring Employees by Title -----------------

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;


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

-- Use Inner Join & Distinct On Statements to merge info from 'current_emp' and 'titles' tables
-- ***Use Distinct On Statement to select most recent title***
-- Filter by birth_date (1952-1955), Order by emp_no,
-- Save into 'retirement_titles' table & export to retirement_title.csv file
SELECT ce.emp_no,
    ce.first_name,
    ce.last_name.
    t.title,
    t.from_date,
    t.to_date
-- INTO retirement_titles
FROM current_emp as ce
INNER JOIN titles AS t
ON (ce.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY ce.emp_no;

---------------------------------------------------------------------------------------
--------------------------------- END Deliverable #1 -----------------------------------

----------------------------------------------------------------------------------------------
------------------ Deliverable #2: Employees Eligible for Mentorship Program -----------------

