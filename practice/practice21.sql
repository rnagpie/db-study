--1.
--student, department 테이블 활용
--학과 이름, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.

select * from student; --name ,height 
select * from department; -- dname

WITH MaxHeightPerDept AS (
    -- 1단계: 각 학과 번호(deptno1)별로 학생들의 최대 키를 계산합니다.
    SELECT
        deptno1,
        MAX(height) AS MAX_HEIGHT -- 계산된 최대 키 컬럼명을 이미지처럼 'MAX_HEIGHT'로 지정
    FROM
        student
    GROUP BY
        deptno1
)
SELECT
    d.dname AS DNAME,                  -- 학과 이름 (이미지 컬럼명과 일치)
    mhd.MAX_HEIGHT AS MAX_HEIGHT,      -- 각 학과별 최대 키 (이미지 컬럼명과 일치)
    s.name AS NAME,                    -- 학생 이름 (이미지 컬럼명과 일치)
    s.height AS HEIGHT                 -- 학생 키 (이미지 컬럼명과 일치)
FROM
    student s,                         -- student 테이블 (별칭 s)
    department d,                      -- department 테이블 (별칭 d)
    MaxHeightPerDept mhd               -- 위에서 정의한 CTE (별칭 mhd)
WHERE
    s.deptno1 = mhd.deptno1            -- student와 MaxHeightPerDept CTE 간의 조인 조건 (학과 번호 일치)
AND s.height = mhd.MAX_HEIGHT          -- student와 MaxHeightPerDept CTE 간의 조인 조건 (학생 키가 해당 학과의 최대 키와 일치)
AND d.deptno = s.deptno1               -- student와 department 간의 조인 조건 (학과 정보 연결)
ORDER BY
    DNAME ASC,                         -- 이미지처럼 학과 이름 순으로 오름차순 정렬
    MAX_HEIGHT DESC,                   -- 동일 학과 내에서는 최대 키가 큰 순서로 내림차순 정렬
    NAME ASC;  
-------------------------
/* 다중컬럼, (WHERE 방식)
서브쿼리에서 계산 후 비교 
순위 */
select C.dname, A.max_height, B.name, B.height
from( --인라인뷰 임시
    select deptno1, Max(height)
    from student
    group by deptno1) A, student B, department C
where A.deptno1 = B.deptno1
    and A.Max_height - B.height
    and B.deptno1 = C.deptno;


select 
    d.dname,
    s.height MAX_height,
    s.name,
    s.height
from student s, department d
where (deptn01, height) 
IN (select deptno1, MAX(height)
    from student
    group by deptno1)
And s.deptno1 = d.deptno; 



2.
student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
해당 학년의 평균 키를 출력 하세요.
(학년 컬럼으로 오름차순 정렬해서 출력하세요)

select * from student;

select grade, avg(height)
from student;
group by grade;

--1.
SELECT
    A.grade,          -- 학생의 학년 (A는 student 테이블의 별칭입니다)
    A.name,           -- 학생의 이름
    A.height,         -- 학생의 키
    (SELECT AVG(B.height) -- (여기가 첫 번째 서브쿼리이자 상관 서브쿼리입니다)
     FROM student B   -- student 테이블을 B라는 별칭으로 다시 참조합니다.
     WHERE B.grade = A.grade) AS avg_height -- B 테이블의 학년이 현재 A 테이블의 학년과 같은 경우만 선택하여
                                            -- 그 학생들의 키 평균을 계산합니다.
                                            -- 이 결과를 'avg_height'라는 이름의 컬럼으로 출력합니다.
FROM
    student A         -- student 테이블을 A라는 별칭으로 사용합니다.
WHERE
    A.height > (SELECT AVG(B.height) -- (여기가 두 번째 서브쿼리이자 상관 서브쿼리입니다)
                FROM student B        -- student 테이블을 B라는 별칭으로 다시 참조합니다.
                WHERE B.grade = A.grade) -- B 테이블의 학년이 현재 A 테이블의 학년과 같은 경우만 선택하여
                                         -- 그 학생들의 키 평균을 계산합니다.
                                         -- 이 평균 키를 기준으로 A 학생의 키가 더 큰지 비교합니다.
ORDER BY
    A.grade;          -- 최종 결과를 학년(grade) 순으로 정렬합니다.

--2.
select
    B.grade, B.name, B.height, A.avg_height
from (select grade, AVG(height) avg_height
    from student
    group by grade) A, student B
where A.grade = B.grade
AND A.avg_height < B.height;



