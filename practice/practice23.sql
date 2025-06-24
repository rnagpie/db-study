CREATE TABLE temp_professor
AS
SELECT * FROM professor;


/*1.
temp_professor 테이블에서 직급이 조교수(assistant professor) 인 교수들의 BONUS 를 200 만원으로 인상하세요.*/
select * from temp_professor;

update temp_professor
set bonus = bonus + 200
--select NVL(bonus,0)+200
--from temp_professor
where position = 'assistant professor';

select * from temp_professor
where position = 'assistant professor';

/*2.
temp_professor 테이블에서 'Sharon Stone' 교수의 직급과 동일한 직급을 가진 교수들 중 
현재 급여가 250 만원이 안 되는 교수들의 급여를 15% 인상하세요. */
select * from temp_professor;

select *
from temp_professor
where position = (select position
                    from temp_professor
                    where name = 'Sharon Stone')
                    and pay <250;

UPDATE temp_professor
SET pay = pay * 1.15
WHERE position =(select position from temp_professor WHERE name ='Sharon Stone')
    AND PAY < 250;
    
TRUNCATE TABLE temp_professor;
Drop table temp_professor;
