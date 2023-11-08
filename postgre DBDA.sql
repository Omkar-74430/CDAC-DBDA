create table dept(dept_no int,
				 dept_name varchar(20),
				 constraint dept_deptno_pk primary key(dept_no));

select * from dept;

create table emp(emp_no int,
				emp_name varchar(20),
				sal decimal(7, 2),
				dept_no int,
				constraint emp_nopk primary key(emp_no),
				constraint emp_dept_fk foreign key(dept_no) references dept(dept_no));
				
				
select * from emp;
set autocommit = 0;
insert into emp(emp_no, emp_name, sal) values(12, 'omkar', 2000.00);

insert into emp(emp_no, emp_name, sal) values(13, 'aniket', 4000.00);

insert into emp(emp_no, emp_name, sal) values(14, 'hrikesh', 5000.00);

insert into emp(emp_no, emp_name, sal) values(15, 'omkar', 9000.00);
savepoint ab;

begin;

insert into emp(emp_no, emp_name, sal) values(16, 'ajay', 2000.00);
delete from emp;




CREATE TABLE emp (
    empno SERIAL PRIMARY KEY,
    ename VARCHAR(255),
    designation VARCHAR(255),
    hire_date DATE,
    salary DECIMAL(10, 2),
    dept_number INT
);

























