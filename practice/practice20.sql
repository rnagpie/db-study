--1. professor 테이블과 department 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의
--교수번호화 이름, 학과명을 출력하세요
--(입사일 순으로 오름차순 정렬)
--with 사용
select * from professor;--profno , name, hiredate 
select * from department; --dname 

with oldhiredate as 
    (select 
        deptno,
     MIN(hiredate) as min_hiredate
     from
        professor
     group by
        deptno)
    select
        p.profno,
        p.name,
        d.dname
    from 
        professor p,
        oldhiredate o,
        department d
    where
        p.deptno = o.deptno
    and p.hiredate = o.min_hiredate
    and p.deptno  = d.deptno
    order by
        p.hiredate asc;

-----WHERE 방식

--1)
select p.profno, p.name, d.dname
from professor p, department d
where (p.deptno, p.hiredate) IN 
        (select deptno, MIN(hiredate)
            from professor
           group by deptno)
    AND p.deptno = d.deptno
ORDER BY hiredate
;

--2)
select * from department;
select * from professor;

--각 과마다 입사일이 가장빠른 값 구하기
select deptno, MIN(hiredate)
from professor
group by deptno;

select p1.profno, 
        p1.name, 
        (select d.dname 
            from department d
            where d.deptno = p1.deptno) dname
from professor p1
where p1.hiredate = (select MIN(p2.hiredate)
                    from professor p2
                    where p2.deptno = p1.deptno                   
                    );
                    
--3)
--가장 입사일이 빠른 날짜 구하기
select MIN(hiredate)
from professor
where deptno = 101;

--랭크순으로 표기
select profno, name, dname
from (
    select profno, name,
           deptno, hiredate,
           RANK() OVER (PARTITION BY deptno ORDER BY hiredate) rank
    from professor) A, department B
where rank = 1
AND A.deptno = B.deptno;




--2. emp2 테이블 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요
--(연봉순으로 오름차순 정렬)   

select * from emp2; 
--position , name, pay, 

with highpay as
   (select 
    position,
    max(pay) as max_pay
    from
        emp2
    Group by    
        position)
    select 
        e.name,
        e.position,
        e.pay   
    from 
        emp2 e,
        highpay hi
    where 
        e.position = hi.position
    and e.pay = hi.max_pay
    order by 
        e.pay ASC;
        
--WHERE 방식으로 구하기
select *
from emp2
where (position, pay) IN (                     
    select position, MAX(pay)
    from emp2
    group by position)
    order by pay;
                         
                        