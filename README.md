# Building a Relational Database for Employee Data Storage & Management (Postgres SQL)

## Project Overview
This project applies SQL data modeling, engineering, & analysis methods. Our client is Pewlett Hackard, a company with several thousand employees. The company anticipates that a substantial number of employees will be retiring in the next few years and wants to address the following questions:	
	<ol>
	<li> Who will be retiring in the next few years?
	<li> Who among them will be eligible for various HP retirement packages?
	<li> How many and what kind of positions will HP need to fill?
	</ol>

## Resources (Source Data & Analysis Software)
To accomplish these tasks, we used the following resources:
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


## Methods for creating the SQL database (db), db schema, and db queries
To answer these questions, the client wishes to analyze employee data from six csv files, which have been generated with Excel/VBA. Our role is to help migrate data to a SQL database and to use SQL queries to analyze the data. The client has requested the following deliverables:  
	<ol>
	<li> A relational database schema ('schema.sql') file;
	<li> A PostgreSQL employee database that contains data from the six .csv source data files;
	<li> A SQL queries ('queries. sql') file, together with the following query results:
    	<ol>
		<li> A file that contains a list of employees who are nearing retirement;
		<li> A file that contains a count (number) of employees for each department;
		<li> An Employee Information file that contains list of employees containing their unique employee number, their last name, first name, gender, and salary
		<li> A Management file that contains a list of managers for each department, including the department number, name, and the manager's employee number, last name, first name, and the starting and ending employment dates
		<li> A Department Retirees file that contains an updated current_emp list that includes the employee's departments
		</ol>
	</ol>


## Results
Quick DBD was used to design the entity relationship database (ERD), and Postgres/pgAdmin was used to create the physical ERD, import and export data, and run queries. The code to generate the database schema was saved to a file (file name = 'schema.sql').

SQL queries (in 'queries.sql') to generate new data (query results) were saved to a file (file name = 'queries.sql'). These queries created the following new tables, which we exported to file:
	<ol>
	<li> A file that contains a list of employees who are nearing retirement ('retirement_info.csv');
	<li> A file that contains a count (number) of employees for each department ('count_emp_per_dept.csv');
	<li> An Employee Information file ('emp_info.csv');
	<li> A Management file ('manager_info'); and
	<li> A Department Retirees file that contains an updated current_emp list ('dept_info').
	</ol>