
1. 조회하기 SELECT

SELECT 조회 대상 컬럼명 FROM 테이블명;
* : 전체 ALL


select * from dept;
SELECT * FROM DEPT; --대소문자 구분안함

테이블 구조 확인 (Describe)
DESC 테이블명;
desc dept;

select * from fruit;
select * from loan;
select * from product; --product 테이블에 있는 모든 칼럼 데이터 조회

select * from emp;
select mgr, hiredate from emp; --emp 테이블에서 mgr, hiredate 컬럼만 조회

---가독성
SELECT *
FROM emp;

SELECT
    empno,
    ename,
    comm
FROM emp;

DESC emp;

----컬럼명 별도로 지정하기 (컬럼 별칭)
SELECT 컬럼명 AS "컬럼별칭"
       컬럼명 "컬럼별칭"
       컬럼명 컬럼별칭
FROM 테이블명;

select empno AS "사원번호",
       ename "사원이름",
       job 직업,
       sal 급여데이터  --- 별칭은 띄어쓰기하고싶으면 "" 넣어야함
from emp;

--조회 데이터 리터럴 값 활용
select '문자', 12313 FROM 테이블명;
select '문자', 123123 FROM dual; --dual 임시테이블
select '문자테스트' AS "문자확인컬럼헤더", 123+123 from dual;

select '이것은문자', 123123, loc, dname  from dept;
select '안녕' from emp; 


--DISTINCT 중복제거
select * from emp;
select DISTINCT job from emp; --job 중복제거
select DISTINCT (job) from emp; 

select distinct deptno from emp;
select DISTINCT deptno, job from emp; --여러개 컬럼 조합해서 중복제거

select DISTINCT(job), sal from emp;  --두개 컬럼 조합 중복제거
select DISTINCT job, sal from emp;
select job, sal from emp;
--출력은 비대칭으로 안나오고 대칭으로 나온다.


/**********************************************/
-- || 연결연산자 앞뒤로 이어붙이기


SELECT '오늘' || '너무덥다' FROM dual;

select '부서번호:' || deptno AS "부서번호" from dept;

select '부서번호:' || (deptno+100) AS "부서번호" from dept;

SELECT q'[여기 안에다가 문자를 "입력 '하면' 됩니다.]' /*문자화*/
FROM dual;


/**************************************************************/
조건 WHERE 절

필터링 ,찾으려고 하는 조건

SELECT ...
FROM ...
WHERE ...
;

select *
from emp;

select *
from emp
where sal > 2500; -- sal 2500 초과하는 직원의 모든 정보 조회

select ename
from emp
where sal > 2500; -- sal 2500 초과하는 직원의 이름을 조회

select * 
from emp
where job = 'SALESMAN';

select * 
from emp
where job deptno = 10;

select * 
from emp
where deptno <> 10;
--where job deptno != 10;


select *
from student;  --50~70kg 조회
--where weight >= 50 AND weight <=70;

--where weight BETWEEN 50 AND 70;



select *  --1~3학년만 조회
from student 
--where grade >= 1 AND grade <=3;
--where grade BETWEEN 1 AND 3;
--where grade = 1 OR grade = 2 OR grade = 3;
--where grade <>4; -- grade !=4
--where grade IN (1,2,3);



-- 2학년 4학년만 조회

select *
from student
--where grade IN (2,4);
--where grade = 2 OR grade =4;
--where grade ! = 1 AND grade <>3;
where grade NOT IN (1,3);


/***********************************************/
LIKE 패턴 검색 (문자)
    %: 아무갯수 0~n 개
    _ : 그 위치에 한개 

select *
from emp
--where ename LIKE '%M%'
--where ename LIKE 'M%'
--where ename LIKE '%M';
--where ename LIKE '_M%'; --SMITH
where ename LIKE '__M%'; --JAMES


select * from emp;
--where comm is null;
where comm is not null;

select * 
from emp
--where hiredate = '1981-05-01'
--where hiredate = '1981-05-01' -- YYYY--MM--DD
where hiredate < '1981-05-01'
;

/***************************************************/
정렬 ORDER BY
* 정렬을 명시하지 않으면 순서보장X
ORDER BY 정렬기준 컬럼명 [ASC/DESC] [오름차순|내림차순]


SELECT
FROM
WHERE
ORDER BY

SELECT
FROM
ORDER BY
;

select *
from student
order by name;  --acs;는 디폴트 기능 생략가능하다.

select *
from student
order by name desc;


--학년 기준 내림차순
select *
from student 
order by grade desc;

-- 1,2,3 학년 중에 키순으로 내림차순 정렬
select *
from student;
where grade IN (1,2,3)
order by height desc
;

-- 1,2,3 학년 중에 각 학년별 (오름차순/내림차순)  키순으로  내림차순 정렬
select *
from student;
where grade IN (1,2,3)
order by grade desc, height 
;

select *
from student;
where grade IN (1,2,3)
order by height, grade desc 
;

select *
from student
order by birthday desc;


/************************************************/
집합 연산자
UNION 합집합
UNION ALL 합집합 (전부다 합치기 중복제거X)
INTERSECT 교집합
MINUS 차집합

    *조건 (제약)
        1. 컬럼 갯수 동일
        2. 컬럼 데이터형(타입) 동일
        3. 컬럼명은 달라도 상관없음 
        
        
--학생들(student) 중 101번학과 학생과 102번 학과 학생들 모음 조회
select * 
from student
where deptno1 IN (101, 102);

select * 
from student
where deptno1 = 101 
UNION ALL
select * 
from student
where deptno1 = 102;


--101학과에 속한 학생들과 교수들을 조회
select studno, name, deptno1
from student
where deptno1 =101
UNION ALL
select profno, name, deptno
from professor
where deptno = 101;

select * -- studno, name, deptno1 tel
from student
where deptno1 =101
UNION ALL
select * -- profno, name, deptno
from professor
where deptno = 101;

select studno, name, deptno1, tel
from student
where deptno1 = 101
UNION ALL
select profno, name, deptno, null
from professor
where deptno = 101;

select *
from student
where deptno1 = 101
INTERSECT  --교집합
select *
from student
where deptno2 = 201;
