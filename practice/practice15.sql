--1. student, score, hakjum 테이블을 활용하여 다음 정보를 출력하세요.
--각 학생 별로 점수가 몇점이고 그 점수가 어떤 학점인지를 확인라고 싶습니다.
--학번 이름 점수 학점 순으로 조회하세요.



select * from student;
select * from score;
select * from hakjum;

select  st.studno 학번, st.name 이름, sc.total 점수, hj.grade 학점
FROM student st, score sc, hakjum hj
where 
    st.studno = sc.studno
    AND sc.total Between hj.min_point And hj.max_point;
    
--2.
--student, score, hakjum 테이블을 활용하여 다음 정보를 출력하세요.
--각 학생 별로 점수가 몇점이고 그 점수가 어떤 학점인지를 확인하고 싶습니다.
--학번 이름 점수 학점 순으로 조회하세요.
--위 내역에서 101, 102 학과에 속한 학생들의 정보만 보여주세요.

SELECT
    st.studno AS 학번,
    st.name AS 이름,
    sc.total AS 점수,
    hj.grade AS 학점
FROM
    student st,
    score sc,
    hakjum hj
WHERE
    st.studno = sc.studno
    AND sc.total BETWEEN hj.min_point AND hj.max_point
    AND st.deptno1 IN (101, 102) -- 101 또는 102 학과에 속한 학생만 필터링
ORDER BY
    st.studno; -- 학번, 이름, 점수, 학점 순으로 조회 (이미지 정렬 대신 학번 기준으로 정렬)
    
    
--3.
--학생 테이블(student)과 학과 테이블(department) , 교수 테이블(professor) 을 Join하여
--301학과 속한 교수를 제외한 교수를 지도교수로 두고 있는
--학생의 이름과 학생의 학년, 학생의 지도교수 이름, 지도교수의 학과 번호, 지도교수가 속한 학과이름을 출력하세요.

select * from student;
select * from professor
where deptno != 301;

select * from department;

select * 
from student s, professor p, department d
where
    s.profno = p.profno
    AND p.deptno != 301
    AND p.deptno = d.deptno;

