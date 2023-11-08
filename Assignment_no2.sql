CREATE TABLE dept(
  deptno int,
  dname VARCHAR(14),
  loc VARCHAR(13),
  constraint pk_dept primary key(deptno));



INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES(40, 'OPERATIONS', 'BOSTON');
COMMIT;

CREATE TABLE emp (
  empno    int,
  ename    VARCHAR(10),
  job      VARCHAR(9),
  mgr      int,
  hiredate DATE,
  sal      Decimal(7,2),
  comm     Decimal(7,2),
  deptno   int,
  CONSTRAINT pk_emp PRIMARY KEY (empno),
  CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);

INSERT INTO emp VALUES(
 7839, 'KING', 'PRESIDENT', null,
'1981-11-17',
 5000, null, 10 );

INSERT INTO emp VALUES(
 7698, 'BLAKE', 'MANAGER', 7839,
 '1981-5-1',
 2850, null, 30);

INSERT INTO emp VALUES(
 7782, 'CLARK', 'MANAGER', 7839,
 '1981-6-9',
 2450, null, 10);

INSERT INTO emp VALUES(
 7566, 'JONES', 'MANAGER', 7839,
 '1981-4-2',
 2975, null, 20);

INSERT INTO emp VALUES(
 7788, 'SCOTT', 'ANALYST', 7566,
 '1987-7-13',
 3000, null, 20);

INSERT INTO emp VALUES(
 7902, 'FORD', 'ANALYST', 7566,
 '1981-12-3',
 3000, null, 20 );

INSERT INTO emp VALUES(
 7369, 'SMITH', 'CLERK', 7902,
 '1980-12-17',
 800, null, 20 );

INSERT INTO emp VALUES(
 7499, 'ALLEN', 'SALESMAN', 7698,
 '1981-2-20',
 1600, 300, 30);

INSERT INTO emp VALUES(
 7521, 'WARD', 'SALESMAN', 7698,
 '1981-2-21',
 1250, 500, 30 );
INSERT INTO emp VALUES(
 7654, 'MARTIN', 'SALESMAN', 7698,
 '1981-9-8',
 1250, 1400, 30 );

INSERT INTO emp VALUES(
 7844, 'TURNER', 'SALESMAN', 7698,
'1981-9-8',
 1500, 0, 30);

INSERT INTO emp VALUES(
 7876, 'ADAMS', 'CLERK', 7788,
 '1987-7-12',
 1100, null, 20 );

INSERT INTO emp VALUES(
 7900, 'JAMES', 'CLERK', 7698,
 '1981-12-3',
 950, null, 30 );

INSERT INTO emp VALUES(
 7934, 'MILLER', 'CLERK', 7782,
'1982-1-23',
 1300, null, 10 );

COMMIT;

CREATE TABLE salgrade (
  grade int,
  losal int,
  hisal int
);

INSERT INTO salgrade VALUES (1, 700, 1200);
INSERT INTO salgrade VALUES (2, 1201, 1400);
INSERT INTO salgrade VALUES (3, 1401, 2000);
INSERT INTO salgrade VALUES (4, 2001, 3000);
INSERT INTO salgrade VALUES (5, 3001, 9999);
COMMIT;


/* ================================================================================================ */


--Assingment no.2:

--1.Select all information from Salgrade table.?
select * from salgrade;

--2.Select all information from emp table.
select * from emp;

--3.Select all information from dept table. 
select * from dept;


--4.List all employees who have a salary between 1000 and 2000.
select empno, ename, sal from emp where sal between 1000 and 2000 order by sal;

--5.List department numbers and names in department name order.
select deptno, dname from dept order by dname;

--6.Display all the different job types.
select distinct job from emp order by job;

--7.List the details of the employees in departments 10 and 20 in alphabetical order of employee names.
select ename, deptno from emp where deptno in(10, 20) order by ename;

--8. List names and jobs of all clerks in department 20.
select ename, job from emp where job = 'CLERK'  and deptno = 20 ;

--9.Display all employee names which have TH or LL in them
select empno, ename from emp where ename like '%TH%' or ename like '%LL%';

--10.List the details of the employees who have a manager
select ename, job from emp where job = 'MANAGER';

--11.Display the name and the total remuneration for all employees
select ename, (sal + COALESCE(comm, 0)) as Total_rm  from emp;

--COALESCE(comm, 0) replaces any null values in the "commission" column with 0.

--12. Display name, annual salary and commission of all sales people whose monthly salary is greater than their commission. The output should be ordered by salary highest first. 
--    If two or more employees have the same salary sort by employee name, within the highest salary order.

select ename, (sal*12) as ann_sal, coalesce(comm ,0) from emp where sal >= comm or comm is null order by ann_sal desc, ename;

--13.Display all employees who were hired during 1982.
select empno, ename, hiredate from emp where extract(year from hiredate) = 1982;

--14.Generate a statement, which prompts the user at runtime. 
-- The intention is to display employees hired between two given dates.

--15.  Define a variable representing the expression used to calculate an employee's total annual remuneration.
--     Use this variable in a statement,which finds all employees who earn 30,000 a year or more.
select ename, (sal*12) as ann_sal from emp where sal*12 >= 30000;

--16.List the employee names and their salaries increased by 15% and expressed as a whole number .
select ename, round( (((sal/100)*15) + sal), 2) as incremnt from emp;

--17.Display the employee name and job by concatenating them and give an appropriate heading.
select concat( concat(ename, ' IS A '), job) Designation from emp;

--18.  Display the employee name and the job in brackets.
select concat( concat('(', ename, ' - '), job, ')') bracket_name from emp;

--19.  Do a case insensitive search for a list of employees with a job that the user enters.
-- Prompt the user for a job title
set @var = 'ALLEN'
select ename, job from emp where ename = @var;

DO $$ 
DECLARE
  var VARCHAR := 'ALLEN';
BEGIN
  PERFORM ename, job
  FROM emp
  WHERE ename = var;
END $$;



--20.It has been discovered that the sales people in department 30 are not all male. Hence display the job of salesman as salesperson.
select ename, job as selesperson, deptno from emp where deptno = 30 and job = 'SALESMAN';



----------------------------------------------------------------------------------------------------===========================
--******************************************************************************************************************************


/* Assinment No. 3 */

--1.Display each employee's name and hiredate from department number 20. Make sure that you specify the alias ‘DATE HIRED’.
select * from emp;
select ename, hiredate as DATE_HIRED, deptno from emp where deptno = 20;


---->2.Display each employee's name with hiredate and salary review date. Assume review date is one year after hiredate.
select ename, hiredate, hiredate + interval ' 1 year ' as salary_reviwe from emp;

--3.Print a list of employees displaying just salary if more than 1500. If exactly 1500 then display ‘On Target’, if less than 1500 then display ‘below 1500’.
--select ename, sal from emp where sal = 1500 'on target' and sal <= 1500 'bellow 1500';
select ename, sal, case when sal > 1500 then sal::text when sal = 1500 then 'On target' else 'Below 1500'
	 end as salary_status
	 from emp where sal <= 1500;
	  
	 
--4.Write a query, which will return the day of the week for any date entered in the format dd.mm.yy.
select * from emp;

select hiredate from emp where hiredate like '--/--/----';

SELECT DAYNAME(hiredate('dd.mm.yy', '%d.%m.%y')) AS DayOfWeek;

--5. Employees hired on or before that 15th of any month are paid on the last Friday of that month. 
--   Those hired after 15th are paid the first Friday of the following month.
--    Print the list of employees and their hire date and the first pay date. Sort on hire date.


-->6. Find the minimum salary of all employees.
select * from emp;
select min(sal) as salary from emp;



-->7.Find the minimum, maximum and average salaries of all employees.

select min(sal), max(sal), avg(sal) from emp;

-->8.List the minimum and maximum salary for each job type.

select job, min(sal), max(sal) from emp group by job;


-->9.Find out how many managers are there without listing them.

select count(*) as managers from emp where job = 'MANAGER' ;

-->10.Find out the average salary and total remuneration for each job type.

select job, avg(sal) as Avg_sal from emp group by job;


-->11. Find out the difference between highest and lowest salaries.
select max(sal) - min(sal) as deff_sal from emp;

-->12. Find all departments, which have more than 3 employees.

select deptno, count(*) from emp group by deptno having count(*) > 3;

-->13. Check whether all employee numbers are indeed unique.
select distinct empno as unique_ from emp;

-->14. List the lowest paid employees working for each manager. 
--     Exclude any groups where the minimum salary is less than 1000. Sort the output by salary.

--select ename, min(sal) from emp group by sal having sal > 1000;

WITH ManagerMinSalary AS ( SELECT mgr,
    MIN(sal) AS min_salary
  FROM
    emp
  GROUP BY
    mgr
  HAVING
    MIN(sal) >= 1000)

SELECT
  e.empno,
  e.ename,
  e.job,
  e.mgr,
  e.sal FROM emp e
INNER JOIN ManagerMinSalary mms
ON e.mgr = mms.mgr AND e.sal = mms.min_salary
ORDER BY e.sal;


--15. Display all employee names and their department names, in the order of department name.
select * from emp;
select e.ename as emp_name, d.dname as dpt_name from emp e inner join dept d on e.deptno = d.deptno order by d.dname;

-->16. Display all employee names, department number and department name.

select e.ename as emp_name, d.deptno as dept_num, d.dname from emp e, dept d;


-->17. Display the name, location and department of employees whose salary is more than 1500 a month.
select * from dept
select * from emp

select e.ename as EMP_Name, e.sal as salary, d.loc as Locatio, d.dname as Dept_name from emp e, dept d where e.sal > 1500;


-->18. Show only employees on grade 3.
select e.ename as emp_name, s.grade as grade from emp e, salgrade s where s.grade = 3;


-->19. Show all employees in ‘Dallas’

select e.ename as emp_name, d.loc as Location_ from emp e, dept d where d.loc = 'DALLAS';



select * from emp
select * from dept
select * from salgrade
-->20.List the employee name, job, salary, and grade and department name for everyone in the company except clerks.
-- Sort on salary, displaying the highest salary first.

select e.ename as emp_name, e.job as designation,e.sal as salary, s.grade as grade, d.dname from emp e, salgrade s, dept d
where e.job = 'CLERK' and e.max(sal);


-->21. List the details of employees who earn 36000 a year or who are clerks.
SELECT ename, (sal*12) from emp where job = 'CLERK' and sal*12 = 36000;


-->22. Display the department that has no employees.
select * from dept where deptno not in (select DISTINCT deptno from emp);


-->23. Find the employees who earn the highest salary in each job type. Sort in descending salary order.
SELECT distinct ename, job, max(sal) from emp group by deptno, ename, job;

-->24. Find the most recently hired employees in each department ordered by hire date.
select * from emp order by hiredate limit 1;


-->25. Display the details of employees hired between Jan and June.
SELECT *
FROM emp
WHERE EXTRACT(MONTH FROM hiredate) = 4 and extract(month from hiredate) = 5; 

-->26. Display the count, total salary and average salary of all employees in each department.
SELECT
  deptno,
  COUNT(*) AS employee_count,
  SUM(sal) AS total_salary,
  AVG(sal) AS average_salary
FROM
  emp
GROUP BY
  deptno;


-->27. Find a square root of the number 36.1111. The result should not contain any decimal spaces.
SELECT CAST(SQRT(36.1111) AS INTEGER);


-->28. Given a string ‘HELLO_THERE_’. Replace all  ‘_’ with ‘!’ marks.
SELECT REPLACE('HELLO_THERE_', '_', '!');


-->29. Find the sum of the length of the stirngs. The String are CDAC, HYDERABAD.
SELECT LENGTH('CDAC') + LENGTH('HYDERABAD') AS sum_of_lengths;


-->30. Find the job that was filled in the first half of the 1980 and the job that was filled during the same period in 1981.
SELECT DISTINCT job
FROM emp
WHERE 
    (hiredate >= '1980-01-01' AND hiredate <= '1980-06-30') -- First half of 1980
    OR
    (hiredate >= '1981-01-01' AND hiredate <= '1981-06-30') -- First half of 1981;


-->31. Select all employee names  , hiredate whose department is 20. 
--     The format of the date should be December 20, 1983 for 20-Dec-83.

SELECT
  ename,
  TO_CHAR(hiredate, 'FMDay DD, YYYY') AS formatted_hiredate
FROM
  emp
WHERE
  deptno = 20;


























	 