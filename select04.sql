/****************************************/
일반함수

NVL 
값이 null 일때 기본값

select
    sal,
    comm,
    (sal*12)+comm,
    (sal*12)+NVL(comm, 0)
from emp;

select
    sal*12+comm
from emp
where comm is not null
UNION ALL
select
    sal*12
from emp
where comm is null;

select NVL(123, 0), NVL(null, 0) from dual;


NVL2

select
    NVL(null, 10),
    NVL2(123, '있다', '없다'),
    NVL2(null, '있다', '없다')
from dual;


DECODE

--DECODE(10, 10, DECODE(10, 10, '같다', DECODE(10, 10, '같다', '다르다')), '다르다')

SELECT
    DECODE(10, 10, '같다', '다르다'),
    DECODE(10, 20, '같다', '다르다'),
    DECODE(10, 10, '같다'),
    DECODE(10, 20, '같다'),  --null
    DECODE(10, 20, '같다', null),
    DECODE(10, 20, '20이다', 30, '30이다', 40, '40이다', '아니다'),
    DECODE(10, 20, '20이다', 30, '30이다', 40, '40이다'),
    DECODE(10, 20, '20이다', 30, '30이다', 40, '40이다', null),
    DECODE(10, 20, '20이다', 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', null)
from dual;

select
    name,
    deptno,
    DECODE(deptno, 101, '컴공', 102, '전기', 103, '기계', 201, '물리', '그외문과'),
    '전공 학과:' || DECODE(deptno, 101, '컴공', 102, '전기', 103, '기계', 201, '물리', '그외문과') 전공
from professor;


CASE 문 

select 
    grade ||'학년'
from student;

-- 1,2 저학년  3,4 고학년
select
    grade,
    DECODE(grade, 1, '저학년', 2, '저학년', 3, '고학년', 4, '고학년', '없음. 1~4여야하는데..') 구분,
    CASE grade
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
        --ELSE '그 외'
    END 고저구분,
    
    CASE
        WHEN grade IN (1,2) THEN '저학년'
        WHEN grade BETWEEN 3 AND 4 THEN '고학년'
    END AS "범위로구분"
from student;










