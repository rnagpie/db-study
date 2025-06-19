/****************************************/
기타 복수행 함수


select deptno, job, AVG(sal), COUNT(*)
from emp
group by deptno, job;

--부서와 직업별 평균급여 및 사원수
select deptno, job, AVG(sal) 평균급여 , COUNT(*) 사원수
from emp

--전체 사원의 평균 급여와 사원수
select AVG(sal) 평균급여 , COUNT(*) 사원수
from emp;


select deptno, job, AVG(sal) 평균급여 , COUNT(*) 사원수
from emp
group by deptno, job
UNION ALL
select deptno, null, AVG(sal) 평균급여 , COUNT(*) 사원수
from emp
group by deptno
UNION ALL
select null, null, AVG(sal) 평균급여 , COUNT(*) 사원수
from emp;
order by deptno, 2;




select deptno, job, AVG(sal) 평균급여 , COUNT(*) 사원수
from emp
--group by ROLLUP(deptno, job);
--group by ROLLUP(deptno, job);

group by ROLLUP(deptno, job);
1) deptno, job 그룹화 데이터
2) deptno 그룹화 데이터
3) () 그룹화 데이터



group by ROLLUP(deptno, job);
1) empno, deptno, job
2) empno, deptno
3) empno
4) ()



group by ROLLUP( empno, (deptno, job) );
1) empno, deptno, job
2) empno
3) ()


select deptno, job, AVG(sal) 평균급여 , COUNT(*) 사원수
from emp
group by CUBE (deptno, job);

순위 RANK() OVER (order by 정렬기준대상)
그룹단위 순위 매갤시 RANK() OVER (partition by 기준 order by 정렬기준대상)
DENSE_RANK()
                            -- group by
             
select  
    ename,
    sal,
    RANK() OVER (order by sal desc) 급여순위
from emp
;
--order by sal;


select
    name,
    height,
    RANK() OVER (order by height desc) 키순위,
    DENSE_RANK() OVER (order by height desc) 키순위,
    grade,
    RANK() OVER (partition by grade order by height desc) 키순위,
    DENSE_RANK() OVER (partition by grade order by height desc) 키순위
from
    student
order by 
    grade;
