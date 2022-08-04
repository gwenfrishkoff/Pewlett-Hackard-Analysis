DROP TABLE departments CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE dept_emp CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE titles CASCADE;


-- Create 'departments' table for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

-- Create 'employees' table for PH-EmployeeDB
CREATE TABLE employees (
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

-- Create 'dept_manager' table for PH-EmployeeDB
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Create 'dept_emp' table for PH-EmployeeDB
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  PRIMARY KEY (emp_no, dept_no)
);


-- Create 'titles' table for PH-EmployeeDB
CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(50) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no, title, from_date)
);

-- Create 'salaries' table for PH-EmployeeDB
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no, from_date)
);

-- Import .CSV data from public folder (on Dropbox) to SQL Tables
COPY departments FROM '/Users/GwenF/Dropbox/Public/Pewlett-Hackard-Analysis Folder/Data/departments.csv' DELIMITER ',' CSV HEADER;
COPY employees FROM '/Users/GwenF/Dropbox/Public/Pewlett-Hackard-Analysis Folder/Data/employees.csv' DELIMITER ',' CSV HEADER;
COPY dept_manager FROM '/Users/GwenF/Dropbox/Public/Pewlett-Hackard-Analysis Folder/Data/dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY dept_emp FROM '/Users/GwenF/Dropbox/Public/Pewlett-Hackard-Analysis Folder/Data/dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY titles FROM '/Users/GwenF/Dropbox/Public/Pewlett-Hackard-Analysis Folder/Data/titles.csv' DELIMITER ',' CSV HEADER;
COPY salaries FROM '/Users/GwenF/Dropbox/Public/Pewlett-Hackard-Analysis Folder/Data/salaries.csv' DELIMITER ',' CSV HEADER;

-- Check that data were successfully imported to SQL (uncomment and run one line at a time)
SELECT * FROM departments;
--SELECT * FROM employees;
--SELECT * FROM dept_manager;
--SELECT * FROM dept_emp;
--SELECT * FROM titles;
--SELECT * FROM salaries;