/*************************************/
서브쿼리

SELECT 스칼라 서브쿼리
FROM 인라인 뷰
WHERE 서브쿼리

select * from emp;

20번 부서 사람들만 조회

select * from emp
where deptno = 20;

사번이 7844인 사원과 같은 부서사람들 조회
select * from emp
--where deptno = 7844사람의 부서번호;
where deptno = (select deptno
                from emp
                where empno = 7844);
                
select * from emp2;
select * from dept2;

포항 사무실에서 일하는 직원들의 목록 조회

--JOIN 버전
select *
from emp2 e, dept2 d
where e.deptno = d.dcode
AND area = 'Pohang Main Office';

select *
from emp2
where deptno IN (select dcode
                  from dept2
                  where area = 'Pohang Main Office')
        -- IN (0001, 1003, 1006, 1007)
;


select *
from emp2
where deptno IN (select dcode
                  from dept2
                  where area = 'Pohang Main Office'
                  and dcode = 1003);
                  
select *
from emp2
where deptno IN (select dcode
                  from dept2
                  where area = 'Pohang Main Office'
                  and dcode = deptno);

select *
from emp2
where EXISTS (select dcode
                from dept2
                where area = 'Pohang Main Office'
                and dcode = deptno);                  


--학생들 중에 학번이 9513 학생보다 키가 작은 학생들 조회
select *
from student;

select *
from student
where height < ( select height
                 from student
                 where studno = 9513)
order by height;

select grade, MAX(weight)
from student
group by grade;

select *
from student    
where weight > ( select MAX(weight)
                    from student
                    where grade = 2
                    );


select *
from student    --   >ANY <ANY >ALL <ALL
where weight <ANY ( select MAX(weight)
                    from student
                    group by grade
                    );
                 
--각 학년별로 몸무게가 제일 많이 나가는 학생의 정보를 조회

-- 다중행 비교 (IN)
-- 다중컬럼 비교
select *
from student 
where (grade, weight) IN (select grade, MAX(weight)
                 from student
                 group by grade )
ORDER BY grade;

--전체 평균 급여보다 많이 받는 직원 목록 조회
select *
from emp2
where pay > ( select AVG(pay)
              from emp2);

--직급 직책
--자신과 같은 직책(position)의 평균 급여보다 많이 받는 직원 목록 조회
select *
from emp2 A
where pay > (select AVG(pay)
             from emp2 B
             where B.position = A.position);

--자신과 같은 고용형태(emp_type)의 평균 급여보다 적게 받는 직원 목록 조회
select *
from emp2 A
where pay < (select AVG(pay)
             from emp2 B
             where B.emp_type = A.emp_type);


/************************************************/
select * from emp2;
select * from dept2;
--사원이름, 부서번호, 부서이름
--join
select e.name, e.deptno, d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode;

--서브쿼리
select 
    name,
    deptno,
    (select dname
       from dept2
       where dcode = deptno)
       --where dcode > deptno
from emp2;

select dname
from dept2
where dcode = 1000;

select * from panmae;
select * from product;

select 
    p_date,
    p_code,
    (select p_name 
        from product pd
        where pd.p_code = pm.p_code ) 상품명    
from panmae pm;

/****************************************/

select *
from 
    (select empno, ename, job
    from emp)
;


select 
    emp_number, emp_name
from (
    select
        e.empno emp_number,
        e.ename emp_name,
        e.job,
        e.deptno,
        d.dname,
        d.loc
    from emp e, dept d
    where e.deptno = d.deptno)
;

--자신과 같은 고용형태(emp_type)의 평균 급여보다 적게 받는 직원 목록 조회

--고용형태별 평균 급여
select emp_type, AVG(pay) avg_pay
    from emp2
    group by emp_type;
    
select *
from emp2 A, (select emp_type, AVG(pay) avg_pay
                from emp2
                group by emp_type) B
where A.emp_type = B.emp_type
AND A.pay < B.avg_pay ;

select 
    ROWNUM,
    CEIL(ROWNUM / 3),
    studno,
    name,
    grade,
    height
from student
order by height desc;

select
    ROWNUM,
    studno,
    height
from 
    (
        select 
            studno,
            name,
            grade,
            height
        from student
        order by height desc
    );

emp테이블, dept 테이블 조회. 부서번호와 부서별 최대급여, 부서명 조회

select * from emp;
select * from dept;

-- group by 집계 -> join
select
    e.deptno, e.max_sal, d.dname
from 
(select deptno, MAX(sal) max_sal
    from emp e
    group by deptno) e, dept d
where e.deptno = d.deptno;

-- group by 집계 -> 서브쿼리
select
    e.deptno,
    e.max_sal,
    (select dname 
        from dept d
        where d.deptno = e.deptno) 부서명
from 
(select deptno, MAX(sal) max_sal
    from emp e
    group by deptno) e;


-- join -> group by 집계
select
    deptno, MAX(sal), dname
from (
    select e.deptno, e.sal, d.dname
    from emp e, dept d
    where e.deptno = d.deptno)
GROUP BY deptno, dname
;

