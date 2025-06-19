--1. emp 테이블에서 평균 급여가 2000 이상인 부서의 부서번호와 평균급여를 구하세요.
--select * from emp;

select 
    deptno AS 부서이름,
    avg(SAL) AS 평균임금
from 
    emp
group by 
    deptno
HAVING
    avg(sal) >=2000;
    
--2. panmae 테이블
--각 판매일자 별 총 판매한 수량과 총 판매한 금액을 출력하세요. sum과 count의 차이


select 
    p_date AS 판매일자,
    Sum(p_qty) AS 판매수량,
    Sum(p_Total) as 판매금액
from 
    panmae
group by 
    P_date
order by 
    p_date;
    
--3. panmae 테이블
--판매일자 기준으로 각 상품코드당 총 판매수량과 총 판매금액을 보여주세요.
--판매일자 기준으로 모든 상품의 판매수량과 판매금액의 소계를 출력하고,
--마지막에 전체 판매수량과 판매금액의 합계도 보여주세요.  
select 
    p_date AS 판매일자,
    P_code AS 상품코드,
    Sum(p_qty) AS 판매수량,
    Sum(p_Total) as 판매금액
from 
    panmae
GROUP BY 
    ROLLUP(p_date, p_code) -- 판매일자별 상품코드, 판매일자별 소계, 전체 합계

    
--1. student, score, hakjum 테이블을 활용하여 다음 정보를 출력하세요.
--각 학생 별로 점수가 몇점이고 그 점수가 어떤 학점인지를 확인라고 싶습니다.
--학번 이름 점수 학점 순으로 조회하세요.

