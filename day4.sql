--Day 4
SELECT * FROM emp;
select * from dept;



--outer join:
select empno, ename, dname 
from emp, dept
where emp.deptno = dept.deptno;

--left join:

select empno, ename, dname
from emp left join dept
on emp.deptno = dept.deptno;


--left join:
select empno, ename, dname
from emp left join dept
on emp.deptno = dept.deptno;

--full join:
select empno, ename, dname
from emp full join dept
on emp.deptno = dept.deptno;


-- SQL Design:


























