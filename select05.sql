/****************************************/
복수행 함수

COUNT(대상) 갯수세기

select COUNT(*)
from emp;

--식별자 / 기본키(Primary Key) PK
select 
    COUNT(empno),
    COUNT(mgr),
    COUNT(comm),
    null
from emp;

select COUNT(*)
from emp
where comm is not null;

select COUNT(*)
from student
where grade = 4;

select COUNT(empno), SUM(sal)
from emp;

--10,20부서에 총 몇명? 총 급여 얼마씩?
select COUNT(empno), SUM(sal)
from emp
where deptno IN (10, 20);

select
    SUM(height),
    AVG(height),
    MAX(height),
    MIN(height),
    STDDEV(height),
    VARIANCE(height)
from student;


/****************************************/
GROUP BY 그룹화

그룹화 결과에 대해 조건 -> HAVING

SELECT
FROM
WHERE
GROUP BY 컬럼대상 대상을 기준으로 그룹지어서 계산
         GROUP BY 에 명시한 컬럼은 SELECT 조회에 사용 가능
HAVING
ORDER BY

--각 학년별 평균키
select '1학년' 학년, AVG(height) 평균키
from student
where grade = 1
UNION ALL
select '2학년', AVG(height)
from student
where grade = 2
UNION ALL
select '3학년', AVG(height)
from student
where grade = 3
UNION ALL
select '4학년', AVG(height)
from student
where grade = 4;


select grade, AVG(height)
from student
group by grade
order by grade desc;

select studno, AVG(height)
from student
GROUP BY studno;


select grade, AVG(height) avgh
from student
where grade IN (1,2,3)
group by grade
order by avgh;
--order by 2;
--order by AVG(height) desc;
--order by grade desc;


select deptno, AVG(sal)
from emp
group by deptno
having AVG(sal) >= 2000;


1) 급여가 1600 이상인 직원들 대상, 부서별 평균 급여
select deptno, AVG(sal)
from emp
where sal >= 1600
group by deptno;

2) 부서별 평균 급여가 1600 이상인 경우, 부서별 평균 급여
select deptno, AVG(sal)
from emp
--where AVG(sal) >= 1600;
group by deptno
having AVG(sal) >= 1600;

--
학생 각 학년별 평균 몸무게
평균 몸무게 65키로 이상

select grade, AVG(weight)
from student
GROUP BY grade
HAVING AVG(weight) >= 65;

--
학생 4학년을 제외하고 각 학년별 평균 몸무게
평균 몸무게 65키로 이상

select grade, AVG(weight)
from student
where grade != 4
GROUP BY grade
HAVING AVG(weight) >= 65;

select deptno, job, AVG(sal), COUNT(*)
from emp
group by deptno, job;









