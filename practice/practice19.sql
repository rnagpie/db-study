--1.emp2 테이블 직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.

--select * from emp2; 
--name,position,pay, min(pay) where section head
    
select 
    name,
    position,
    pay
from 
    emp2 
where
     pay > (SELECT MIN(pay) 
            FROM emp2 
            WHERE position = 'Section head')
order by pay desc;
    

--2.
--Student 테이블.전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적게 나가는 학생보다 몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력  
  
--select * from student;   
--grade, name , weight

select 
    name,
    grade,
    weight
from 
    student
where
    weight < (select min(weight) 
              from student 
              where grade = '2');

--3.
--emp2, dept2 활용
--각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의 부서명, 직원명, 연봉 출력 

select * from emp2;
select * from dept2;
 e.name, e.pay, d.dname
 
 
select 
    d.dname,
    avg(pay)
from
    dept2, emp2
group by
    d.dname;
 
 
select 
    d.dname,
    avg(e.pay)
from 
    emp2 e 
JOIN
    dept2 d ON e.DEPTNO = d.DCODE 
GROUP BY
    d.DNAME,               
    d.DCODE               
ORDER BY
    d.DNAME; 
    
 
 SELECT
    d.DNAME AS 부서명,   -- dept2 테이블에서 부서명
    e.NAME AS 직원명,     -- emp2 테이블에서 직원명
    e.PAY AS 연봉        -- emp2 테이블에서 연봉
FROM
    emp2 e             -- emp2 테이블 (별칭 e)
JOIN
    dept2 d ON e.DEPTNO = d.DCODE -- emp2의 DEPTNO와 dept2의 DCODE를 조인
WHERE
    e.PAY < (SELECT MIN(25000000) -- 전체 부서의 평균 연봉 중 가장 작은 값
             FROM (SELECT DEPTNO, AVG(PAY) AS 평균연봉 -- 각 부서별 평균 연봉 계산
                   FROM emp2
                   GROUP BY DEPTNO));   
                   
----------------------------------
--(각 부서 평균연봉중 가장 작은 연봉 구하는 방식)

/*1) 부서별 평균 연봉 구하기 */
select deptno, AVG(pay)  
from emp2
group by deptno;

/*2) 부서별 평균 연봉 중 가장 작은 연봉 구하는 방식1 */
select MIN(avg_pay)
from (  select AVG(pay) avg_pay
        from emp2
        group by deptno);
 /*2) 부서별 평균 연봉 중 가장 작은 연봉 구하는 방식2 */
select MIN(AVG(pay))
from emp2
group by deptno;

select * from dept2; --*체크포인트


----where 방식
--1.
select d.dname, e.name, e.pay
from emp2 e, dept2 d
where e.pay <  (select MIN(avg_pay)
                from (  select AVG(pay) avg_pay
                        from emp2
                        group by deptno))   --(각 부서 평균연봉중 가장 작은 연봉)
AND e.deptno = d.dcode;
;

----where 방식
select d.dname, e.name, e.pay
from emp2 e, dept2 d
where e.pay <ALL (select AVG(pay) avg_pay
                   from emp2
                   group by deptno)   --(각 부서 평균연봉중 가장 작은 연봉)
AND e.deptno = d.dcode;
;