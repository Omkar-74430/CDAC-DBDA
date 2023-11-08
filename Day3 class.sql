--Day 3
select * from emp;

--group by stetment:
select deptno, min(sal),max(sal) from emp where job = 'CLERK' group by deptno; 

--q2
select job, avg(sal), sum(sal + COALESCE(comm, 0)) remuneration from emp group by job;
--(ifnull => COALESCE)

----------------------------------------------------------

select deptno, count(deptno) from emp where deptno > 3 group by deptno;

--disply list of 'dept' who have more than 3 employees?
select deptno, count(*) from emp group by deptno having count(*) > 3 order by deptno;

--show max salary name:
select ename, sal from emp where sal = (select max(sal) from emp);

-- who work at dales:
select * from dept;

select * from emp where deptno = (select deptno from dept where loc = (select loc from dept where loc = 'DALLAS'));

--
select * from emp;

select * from emp where deptno = ( select deptno from emp where ename = 'SMITH');


select * from emp where deptno = ( select deptno from dept where dname = 'SALES');

--show no emp in 40:
select * from emp where deptno NOT IN ( select DISTINCT deptno from dept where dname = 'OPERATIONS');

SELECT * FROM EMP WHERE DEPTNO = (SELECT * FROM DEPT WHERE DEPTNO = 40);


select * from dept where deptno not IN ( select DISTINCT deptno from emp);


-- JOIN:
select empno, ename, dname from emp, dept where emp.deptno = dept.deptno;
-- disply empno ename and dname columns

select ename, dname from emp, dept where emp.ename = dept.dname;


--Q:1

select ename, job, dept.deptno, dname from emp, dept where emp.deptno = dept.deptno and job = 'CLERK';

select * from salgrade;

--Q2:
select  ename, sal, grade from emp e, salgrade s where (e.sal between s.losal and s.hisal);
select  ename, sal, grade from emp e, salgrade s where (e.sal between s.losal and s.hisal) and s.grade = 3;

--self join:
--reporting officis find-out?
select e1.ename employee, e2.ename manager from emp e1, emp e2 where e1.mgr = e2.empno;

--outerJoin:

select empno, ename, emp.deptno, dname, loc 
from emp
left join dept
on emp.deptno = dept.deptno;

















