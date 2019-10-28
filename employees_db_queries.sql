--1. Employee details with salary 
select e.emp_no, 
	   e.last_name, 
	   e.first_name, 
	   e.gender, 
	   s.salary
from employees e
left outer 
join salaries s on s.emp_no = e.emp_no
order by emp_no asc;

--2. Employees hired in 1986
select e.*
from employees e 
where e.hire_date between '1986-01-01' and '1986-12-31'
order by e.hire_date asc;

--3. Manager of each department with details 
select d.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   dm.from_date,
	   dm.to_date,
	   e.last_name, 
	   e.first_name
from departments d
join dept_manager dm on dm.dept_no = d.dept_no
join employees e      on dm.emp_no  = e.emp_no
order by dm.emp_no asc;

--4. Department details 
select e.emp_no,
	   e.last_name, 
	   e.first_name,
	   d.dept_name
	   
from employees e
join dept_emp de   on de.emp_no = e.emp_no
join departments d  on d.dept_no = de.dept_no
order by e.emp_no asc;	   

--5. Employee where first name is "Hercules" and last names begin with "B"
select e.emp_no, 
	   e.last_name, 
	   e.first_name, 
	   e.gender,
from employees e
where (e.first_name = 'Hercules' and e.last_name like 'B%')
order by emp_no asc;

--6.Employees in the Sales department with details
select e.emp_no,
	   e.last_name, 
	   e.first_name,
	   d.dept_name
	   
from employees e
join dept_emp de   on de.emp_no = e.emp_no
join departments d  on d.dept_no = de.dept_no
where d.dept_name = 'Sales' 
order by e.emp_no asc;	   

--7.Employees in the Sales and Development departments with details
select e.emp_no,
	   e.last_name, 
	   e.first_name,
	   d.dept_name
	   
from employees e
join dept_emp de   on de.emp_no = e.emp_no
join departments d  on d.dept_no = de.dept_no
where (d.dept_name = 'Sales' or d.dept_name ='Development')
order by e.emp_no asc;	

--8. List of frequency count of employee  with same last name
select e.last_name, 
	   count(last_name)
from employees e
group by e.last_name
order by e.last_name desc;
