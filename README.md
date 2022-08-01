# Building a Relational Database for Employee Data Storage & Management (Postgres SQL)

## Project Overview
This project applies SQL data modeling, engineering, & analysis methods. Our client is Pewlett Hackard, a company with several thousand employees. The company anticipates that a substantial number of employees will be retiring in the next few years and wants to address the following questions:	
	<ol>
	<li> Who will be retiring in the next few years?
	<li> Who among them will be eligible for various HP retirement packages?
	<li> How many and what kind of positions will HP need to fill?
	</ol>

To answer these questions, the client wishes to analyze employee data from six csv files, which have been generated with Excel/VBA. Our role is to help migrate data to a SQL database and to use SQL queries to analyze the data. The client has requested the following deliverables:  
	<ol>
	<li> Load source (.csv) data files into SQL tables ("entities");
	<li> Map the relationships between data tables using Quick Database Diagrams ("Quick DB")
	<li> Create a conceptual entity relationship diagram (ERD) for each table that includes the following information:
    	<ol>
		<li> Primary & Identifying (e.g., Foreign) Keys for each table;
		<li> Datatypes for each data column;
		</ol>
	<li> Use XXX to create logical ERD:
		<ol>
		<li> XXXXXXXX;
		<li> XXXXXXXX; and
		<li> XXXXXXXX
		</ol>
    <li> Use XXX to create physical ERD:
		<ol>
		<li> XXXXXXXX;
		<li> XXXXXXXX; and
		<li> XXXXXXXX
		</ol>
	</ol>

## Resources (Source Data & Analysis Software)
To accomplish these tasks, we used the following resources:
	<ol>
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
	<li> Software = pgAdmin (v 4); PostgreSQL (v 11.X); Quick DBD (https://www.quickdatabasediagrams.com/)
	</ol>

## Data Import (Migration to SQL)
We used XXXXXXXX to import the source data (CSV) files and to...:

## Methods for XXXXXXXX
XXXXXXXX


## Results
XXXXXXXX

## Summary & Conclusions

XXXXXXXX
