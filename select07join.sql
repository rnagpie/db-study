/*************************************************/

Join

select * from emp;

select * from dept;


--JOIN 기준 deptno가 같은!!

select empno, ename, dname, loc, d.deptno
from emp e, dept d
where e.deptno = d.deptno

select *
from emp e INNER JOIN dept d
ON e.deptno = d.deptno;

select*
from emp, dept d; --join 조건 누락 -> 카티션 곱
--where e.deptno = d.deptno;



select * from student;
select * from professor;
---student <- join(profno) -> professor

--select *
select 
    s.name, p.name, s.studno, p.profno, p.email
from student s INNER JOIN professor p
ON s.profno = p.profno;


INNER JOIN, OUTER JOIN

select COUNT (*) from student;
select * from student;

select * 
from student s, professor p
--where s.profno = p.profno(+);
--where p.profno = s.profno(+);
where p.profno(+) = s.profno;


select *
from student s LEFT OUTER JOIN professor p
--from student s  RIGHT OUTER JOIN professor p
--from professor p LEFT OUTER JOIN student s
--from professor p RIGHT OUTER JOIN student s
ON s.profno = p.profno;

--professor  테이블 기준

select COUNT (*) from professer; 16명


select 
    s.name, p.name, s.studno, p.profno, p.email
from student s , professor p
where p.profno = s.profno;

select
    s.name, p.name, s.studno, p.profno, p.email
from student s , professor p
where p.profno = s.profno;



select s.name 학생이름, s.profno 교수번호, p.name 교수이름
from student s, professor p
where s.profno = p.profno;


select 
    s.name,p.name,s.studno,p.profno,p.email
from student s INNER JOIN professor p 
ON s.profno = p.profno







-----ANSI Join 문법

SELECT
    s.name AS "STU_NAME",
    p.name AS "PROF_NAME"
FROM
    student s
JOIN
    professor p ON s.profno = p.profno; -- 명시적인 JOIN 조건
    
    
    
SELECT * from department;

select s.name STU_NAME, d.name DEPT_NAME , p.name PROF_NAME
from student  s, professor p, department d
where s.profno = p.profno;
AND s.deptno1 = d.deptno;
    

select s.name STU_NAME, d.dname DEPT_NAME , p.name PROF_NAME
from
    student s
    INNER JOIN professor p
    ON s.profno = p.profno
    INNER JOIN department d
    ON s.deptno1 = d.deptno;
    
    
select s.name, p.profno, p.name
from student s, professor p
where s.deptno1= 101
AND s.profno = p.profno;


--1) 학생명, 학생의 학과명, 교수명,교수학과 번호

select  s.name, s.deptno1, d.dname, p.name, p.depto
--select *
from student s, professor p, department d
where s.profno = p.profno
AND d.deptno = .deptno1;
--2) 학생명, 교수의 학과명, 교수명
select  s.name, s.deptno1, d.dname, p.name, p.deptno
from student s, professor p, department d
where s.profno = p.profno
AND d.deptno = p.deptno;
--AND s.deptno1 <> p.deptno;

--3) 학생명, 학생학과번호, 학생의 학과명, 교수명, 교수학과번호, 교수의 학과명
select  s.name, s.deptno1, ds.dname, p.name, p.deptno, dp.dname
from student s, professor p, department d
where s.profno = p.profno
AND dp.deptno = p.deptno  --학과 <ㅡ>교수 
AND ds.deptno = s.deptno1; --학과 <ㅡ>교수




/************************************************/
비등가 Join

select * from customer;
select * from gift;

select *
from customer c, gift g
where c.point BETWEEN g.g_Start AND g.g_end;

select * from hakjum;

Self Join

select * from emp;

select *
from emp e1, emp e2
where el.mgr = e2.empno;


select * from emp2;

select A.empno 내사번, A.name 내이름, A.pempno 상사사번, B.name 상사이름
from emp2 A, emp2 B
where A.pempno = B.empno;

