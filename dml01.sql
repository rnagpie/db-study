/*************************************************************/



DML
데이터 저장 INSERT
데이터 수정 UPDATE
데이터 삭제 DELETE
데이터 병합 MERGE



-- 데이터 조회 (SELECT)

INSERT 저장

INSERT INTO 테이블명 (컬럼명...)
VALUES (데이터 값...)

전체 컬럼에 데이터를 저장 + 순서를 맞춰서 저장하는 경우 -> 컬럼명 작성 생략 가능 / 순서를 맞춰서 저장
INSERT INTO 테이블명
VALUES (데이터 값...)
;

insert into new_table (no, name, birth)
VALUES (1, '이름1', SYSDATE);


select * from new_table;


insert into new_table (name, birth, no)--------------insert 컬럼 순대로 맞춰써야함
values ('이름2', SYSDATE, 2);-------------------------e.g) name=이름 name=2 x

insert into new_table (birth, name, no)
--values ('2024-12-12', '이름3', 3);
values (TO_DATE('2024-12-12'),'이름3',3);



insert into new_table-- ----------------------------컬럼명 생략 단, 위치랑 개수는 맞춰야함
values (4, '이름4', SYSDATE);

select * from new_table;

insert into new_table (no, name)--------------------2개만 쓰고싶으면 컬럼을 2개로 고정
values (5,'이름5');

insert into new_table
values (6,'이름6',null);-----------------------------NULL 가능하면 OK NULLABLE 등록안되면 X

insert ALL
INTO new_table values(7, '이름7', null)
INTO new_table values(8, '이름8', SYSDATE)
INTO new_table values(9, '이름9', TO_DATE('2023-01-30'))
select * from dual;

select * from new_table2;

--다른 테이블의 다른 데이터를 조회해서 저장
INSERT INTO new_table2
SELECT 10, '이름10', SYSDATE FROM dual;

INSERT INTO new_table2
select no, name, birth from new_table;

INSERT INTO new_table2
select no, name, birth from new_table;
where no < 5;

테이블 수정 UPDATE

UPDATE 테이블명
SET 컬럼명 = 값,
    컬럼명 = 값
WHERE 조건;

select * from dept3;
--Seoul Branch Office -> Incheon Branch Office

UPDATE dept3
SET area = 'Incheon Branch Office'
--select * from dept3
WHERE area = 'Seoul Branch Office';

UPDATE dept3
SET dname = 'Sales First Team'
--where dcode = 1008;



CREATE TABLE professor2
AS
SELECT * FROM professor;

select * from professor2;

--bonus 받는 교수들의 보너스를 +100증가
UPDATE professor2
SET bonus = bonus + 100
--select * from profesor2
WHERE bonus is not null;

commit;----확정(나중에 취소불가)
rollback;--되돌리기 (취소)

--insert, update, delete (DML)
select * from new_table2;

insert into new_table2
values(99, '이름99', SYSDATE);

DELETE 데이터 삭제 (rollback 가능 단, 자동 COMMIT이 아닐경우)

DELETE FROM 테이블명
WHERE 조건;

select * from dept3;

select *
--delete
from dept3
where dcode = 1007;

commit;