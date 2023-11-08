CREATE TABLE emp2 (
    empno SERIAL PRIMARY KEY,
    ename VARCHAR(255),
    designation VARCHAR(255),
    hire_date DATE,
    salary DECIMAL(10, 2),
    dept_number INT
);

INSERT INTO emp2 (ename, designation, hire_date, salary, dept_number)
VALUES
    ('John Smith', 'Manager', '2022-01-15', 60000.00, 101),
    ('Jane Doe', 'Engineer', '2022-02-20', 55000.00, 102),
    ('Mike Johnson', 'Analyst', '2022-03-10', 50000.00, 103),
    ('Emily Brown', 'Designer', '2022-04-05', 48000.00, 101),
    ('David Lee', 'Developer', '2022-05-12', 52000.00, 102),
    ('Sarah White', 'Manager', '2022-06-18', 61000.00, 101),
    ('Michael Smith', 'Engineer', '2022-07-23', 56000.00, 103),
    ('Jennifer Adams', 'Analyst', '2022-08-30', 50500.00, 102),
    ('Daniel Johnson', 'Designer', '2022-09-11', 49000.00, 103),
    ('Emma Davis', 'Developer', '2022-10-17', 52500.00, 101),
    ('Christopher Wilson', 'Manager', '2022-11-25', 60500.00, 102),
    ('Olivia Miller', 'Engineer', '2022-12-03', 55800.00, 101),
    ('James Anderson', 'Analyst', '2023-01-08', 50300.00, 103),
    ('Ava Martinez', 'Designer', '2023-02-14', 48700.00, 102),
    ('Logan Taylor', 'Developer', '2023-03-21', 53000.00, 101);
	
	
	
	
	
select * from emp2;

select * from emp2  where dept_number= 103;

select distinct designation from emp2;

--concat two string with ' is a ' character.

select concat(concat(ename,' is a '), designation) from emp2;

-- create ename in upper case:
select ename, upper(ename) from emp2;
	
-- lpad = print left side character.
-- rpad = print right side character.
select ename, rpad(ename, 20, '*') from emp2;

select length('Database');

--finding length:
select ename, length(ename) from emp2;

select substr('database tech', -5);

select ceil(1.5);

select power(13, 5);


select sqrt(17.45);

select truncate(23.400, 3);

select min(salary), max(salary), round(avg(salary), 2), sum(salary) from emp2;

select * from emp2 count(ename);

select count(salary),count(*) from emp2
	






