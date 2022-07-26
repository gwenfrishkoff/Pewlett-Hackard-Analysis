---------------------------------------------------------------------------------------
--------------- Deliverable #1: Number of Retiring Employees by Title -----------------
---------------------------------------------------------------------------------------

-- Step #1: CREATE A RETIREMENT TITLES TABLE

-- Create a table of current employees who were born between Jan 1, 1952 & Dec 31, 1955
-- Retrieve emp_no, first_name, & last_name from Employees table
-- Join with title, from_date, & to_date from Titles table (joining on PK)
-- Filter by birth_date (1952-1955), Order by emp_no
-- Save into 'retirement_titles' table & export to CSV
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
-- Check the table
SELECT * FROM retirement_titles;

-- Step #2: CREATE A UNIQUE TITLES TABLE

-- Create a table of current employees together with their most recent titles
-- Retrieve emp_no, first_name, & last_name from Retirement Titles table (Step #1)
-- Use DISTINCT ON statement to retrieve 1st occurrent of emp_no for each set of rows
-- Exclude employees who have already left (filter on to_date = '9999-01-01')
-- Order by emp_no (Ascending) & by to_date (Descending),
-- Save into 'unique_titles' table & export to CSV
SELECT DISTINCT ON (rt.emp_no) t.title,
	rt.emp_no,
    rt.first_name,
    rt.last_name,
	t.from_date,
	t.to_date
INTO unique_titles
FROM retirement_titles as rt
LEFT JOIN titles AS t
ON (rt.emp_no = t.emp_no)
WHERE t.to_date = ('9999-01-01')
ORDER BY rt.emp_no, t.to_date DESC;
-- Check the table
SELECT * FROM unique_titles;

-- Step #3: CREATE A RETIRING TITLES TABLE

-- Determine the number of employees who are about to retire (by most recent job title)
-- Retrieve the number of titles from the Unique Titles table (from Step #2)
-- Group by title, Order by title (Descending),
-- Save into 'retiring_titles' table & export to CSV
SELECT title, COUNT(unique_titles) as "count"
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
-- Check the table
SELECT * FROM retiring_titles;

----------------------------------------------------------------------------------------
------------------ Deliverable #2: Employees Eligible for Mentorship Program -----------
---------------------------------------------------------------------------------------
-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
-- Retrieve the from_date and to_date columns from the Department Employee table.
-- Retrieve the title column from the Titles table.
-- Use a DISTINCT ON statement to retrieve 1st occurrence of emp_no for each set of rows defined by the ON () clause.
-- Create a new table using the INTO clause.
-- Join the Employees and the Department Employee tables on the primary key.
-- Join the Employees and the Titles tables on the primary key.
-- Filter on to_date column to get all current employees, 
-- Then filter on birth_date to get all employees w/DOB betw January 1, 1965 and December 31, 1965.
-- Order the table by the employee number.
SELECT DISTINCT ON (e.emp_no) t.title,
    e.emp_no,    
    e.first_name,
    e.last_name,
    e.birth_date,
    d.from_date,
    d.to_date
INTO mentorship_eligibility
FROM employees AS e
    INNER JOIN dept_emp AS d
        ON (e.emp_no = d.emp_no)
    INNER JOIN titles AS t
        ON (e.emp_no = t.emp_no)
WHERE (d.to_date = '9999-01-01') 
    AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
-- Check the table
SELECT * FROM mentorship_eligibility;