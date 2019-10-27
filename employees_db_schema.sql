-- create employee table
CREATE TABLE employees (
emp_no     INT          NOT NULL,
birth_date DATE         NOT NULL, 
first_name VARCHAR(20)  NOT NULL,
last_name  VARCHAR(20)  NOT NULL,
gender     VARCHAR(1)   NOT NULL,
hire_date  DATE         NOT NULL,
PRIMARY KEY (emp_no)
);

select * from employees
-- create departments table
CREATE TABLE departments (
dept_no VARCHAR(5)   NOT NULL, 
dept_name VARCHAR(20) NOT NULL, 
PRIMARY KEY (dept_no),
UNIQUE (dept_name)
);

-- create dept_manager table - junction table
CREATE TABLE dept_manager (
dept_no VARCHAR(5) NOT NULL,
emp_no INT         NOT NULL,
from_date DATE     NOT NULL, 
to_date DATE       NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no, dept_no)
);

-- create dept_emp table - junction table 
CREATE TABLE dept_emp (
emp_no INT          NOT NULL,
dept_no VARCHAR(5)  NOT NULL, 
from_date DATE      NOT NULL,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
PRIMARY KEY (emp_no, dept_no)
);


-- create titles table
CREATE TABLE titles (
emp_no INT          NOT NULL,
title VARCHAR(50)   NOT NULL,
from_date DATE 		NOT NULL, 
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no, title, from_date)
);

-- create salaries table
CREATE TABLE salaries (
emp_no INT       NOT NULL,
salary INT       NOT NULL,
from_date DATE   NOT NULL,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no, from_date)
);