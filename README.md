# Building a Relational Database for Employee Data Storage & Management (Postgres SQL)

## Project Overview
This project applies SQL data modeling, engineering, & analysis methods. Our client is Pewlett Hackard, a company with several thousand employees. The company wishes to address two main questions:	
	<ol>
	<li> *Question 1*: How many roles will need to be filled as the "silver tsunami" begins to make an impact?	
	<li> *Question 2*: Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
	</ol>

## Resources (Source Data & Analysis Software)
To address these questions, we used the following data and resources:
	<ol>
	<li> Software = pgAdmin (v 4); PostgreSQL (v 11.X); Quick DBD (https://www.quickdatabasediagrams.com/)
	<li> CSV Source Data Files (Note: pk = primary key, fk = foreign key):
    	<ol>
		<li> 'departments.csv' (Look-up Table): 2 cols; 10 rows:
            	<ol>
		        <li> ColA = 'dept_no' (varchar pk), 
		        <li> ColB ='dept_name' (varchar);
                </ol>
        <li> 'dept_emp.csv' (4 cols; 331604 rows):
                <ol>
		        <li> ColA = 'emp_no' (int pk), 
		        <li> ColB = 'dept_no' (varchar pk fk - departments.dept_no), 
                <li> ColC = 'from_date' (date);
                <li> ColD = 'to_date' (date);
                </ol>
        <li> 'dept_manager.csv' (4 cols; 25 rows):
                <ol>
		        <li> ColA = 'dept_no' (varchar pk fk - departments.dept_no), 
                <li> ColB = 'emp_no' (int pk fk - employees.emp_no), 
                <li> ColC = 'from_date' (date);
                <li> ColD = 'to_date' (date);
                </ol>
        <li> 'employees.csv' (6 cols; 300025 rows):
                <ol>
                <li> ColA = 'emp_no' (int pk fk - employees.emp_no), 
                <li> ColB = 'birth_date' (date);
                <li> ColC = 'first_name' (varchar), 
                <li> ColD = 'last_name' (varchar), 
                <li> ColE = 'gender' (varchar), 
                <li> ColF = 'hire_date' (date);
                </ol>
		<li> 'salaries' (4 cols; 300025 rows):
                <ol>
                <li> ColA = 'emp_no' (int pk fk - employees.emp_no), 
                <li> ColB = 'salary' (int), 
                <li> ColC = 'from_date' (date);
                <li> ColD = 'to_date' (date);
                </ol>
		<li> 'titles.csv' (4 cols; 443309 rows):
                <ol>
                <li> ColA = 'emp_no' (int pk fk - employees.emp_no), 
                <li> ColB = 'title' (varchar), 
                <li> ColC = 'from_date' (date);
                <li> ColD = 'to_date' (date);
                </ol>
		</ol>
	</ol>


## Methods
Quick DBD was used to design the entity relationship database (ERD), and Postgres/pgAdmin was used to create the physical ERD, to import and export data, and to generate the following files:
	<ol>
	<li> A relational database schema ('schema.sql' file);
	<li> A SQL queries ('Employee_Database_Challenge. sql') file, together with the following query results (tabular data, exported to CSV files):
    	<ol>
		<li> A Retirement Titles table (Deliverable #1a: 'retirement_titles.csv'), which meets the following requirements: 
		    <ol> It contains a list of employees who were born between Jan 1, 1952 & Dec 31, 1955;
		    <li> It includes emp_no, first_name, & last_name from the 'Employees' table;
		    <li> Data from the 'Employees' table are joined with title, from_date, & to_date data from the 'Titles' table; and
		    <li> The data are ordered by emp_no.
			</ol> 
		<li> A Unique Titles table (Deliverable #1b: 'unique_titles.csv'), which meets the following requirements: 
		    <ol> It contains a list of current employees together with their most recent titles (DISTINCT ON statement used to filter out duplicate entries);
		    <li> It includes emp_no, first_name, & last_name from the Retirement Titles table (Deliverable #1a);
		    <li> It excludes employees who have already left (filtered on to_date = '9999-01-01'); and
		    <li> It is ordered by emp_no (Ascending) & by to_date (Descending).
			</ol> 
		<li> A Retiring Titles table (Deliverable #1c: 'retiring_titles.csv'), which meets the following requirements: 
		    <ol> It contains a count of employees who are about to retire;
		    <li> Data are grouped by title (referencing the Unique Titles table, Deliverable #1b); and
		    <li> It is ordered by count (Descending).
			</ol> 
		<li> A Mentorship Eligibility table (Deliverable #2: 'mentorship_eligibility.csv'), which meets the following requirements: 
		    <ol> It contains a list of employees who are eligible for the PH Mentorship Program;
		    <li> It includes emp_no, first_name, last_name, and birth_date from the Employees table, from_date and to_date columns from the Department Employee table, and current title (from the Titles table);
		    <li> It is generated using a DISTINCT ON statement to exclude duplicate entries;
		    <li> Data are filtered on to_date to retrieve only current employees and on birth_date to get all employees who were born in 1965; and
		    <li> It is ordered by employee number.
			</ol> 
		</ol>
	</ol>


## Results
The code to generate the database schema was saved to 'schema.sql', and the SQL queries (in 'queries.sql') were saved to 'Employee_Database_Challenge.sql' (in ./Queries). The four tables were exported to .csv files ( in ./Data)/

Results suggest the following conclusions:
	<ol>
	<li> *Conclusion 1*: Approximately 72,500 positions will need to be filled in the next several years, including ~25,000 senior engineers, ~25,000 senior staff ~ 10,000 engineers, and ~7,500 staff;	
	<li> *Conclusion 2*: There is a sufficient number of senior staff to mentor the next generation of employees (~434 current senior staff who are eligible for the mentorship program), but the number of senior engineers (~300 eligible for the mentorship program) could place a strain on current resources (assuming they are more costly to train).
	</ol>