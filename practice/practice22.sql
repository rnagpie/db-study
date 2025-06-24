--'AL Pacino'와 "같은 지역"에서 area
--근무하는 직원들의 평균 연봉보다 많이 받는 직원들의 pay >avg(pay)
--사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요. 


--해결방법'AL Pacino'사번을 찾는다-> 사번으로 지역을찾는다-> 지역의 근무직원 조회  
--->근무직원 평균연봉을 구한다-> 평균연봉보다 많은직원 구하기 ->조건 맞추기 

select * from emp2;-- emono, deptno, pay 

select * from dept2; -- area, dname. pdetp 

        



select empno, name, deptno, d.dname, d.area, pay
from emp2 e, dept2 d
WHERE 
    e.deptno = d.dcode
AND e.pay > (select AVG(pay)
            from emp2
            where deptno in (select dcode
                            from dept2
                            where area =(select area
                                          from dept2
                                        where dcode = (
                                                       select deptno
                                                       from emp2
                                                       where name = 'AL Pacino' ))));
                