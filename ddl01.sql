/*******************************************************/

DDL

테이블 생성 
CREATE TABLE 테이블명
(
    컬럼명, 컬럼타입 기타속성/제약,
    컬럼명, 컬럼타입 기타속성/제약,
    컬럼명, 컬럼타입 기타속성/제약,
    컬럼명, 컬럼타입 기타속성/제약,
    컬럼명, 컬럼타입 기타속성/제약,
    컬럼명, 컬럼타입 기타속성/제약,

);

CREATE TABLE new_table  --테이블 스키마(Schema)
(
    no NUMBER(3),
    name VARCHAR2(16),
    birth DATE
);

select * from new_table;

desc new_table;


CREATE TABLE new_table2
(
    no NUMBER(3),
    name VARCHAR2(16),
    birth DATE
);



---테이블 복사
select * from dept2;

CREATE TABLE dept3
AS
select * from dept2; -- dept2 테이블의 구조 + 데이터 복사 -> 테이블 생성

select * from dept3;

CREATE TABLE dept4
AS
select dcode, dname from dept3; --컬럼 일부 구조 + 데이터 복사 -> 테이블 생성(복사)

select * from dept4;

--컬럼 구조만 동일하게 테이블 복사 (데이터 제외)
CREATE TABLE dept5
AS
select * from dept2
where 1=2
;   --데이터가 조회되지 않도록 거짓 조건 추가

select * from dept5;

--테이블 변경(수정)

--컬럼추가
select * from dept4;

ALTER TABLE dept4
ADD (loc VARCHAR2(32));

ALTER TABLE dept4
ADD (lV NUMBER(4) DEFAULT 5);

--컬럼 삭제
ALTER TABLE dept4
DROP COLUMN lv;

--테이블 삭제(롤백 불가 / 자동 커밋)
DROP TABLE 테이블명;

--테이블 내부 데이터 삭제
TRUNCATE TABLE 테이블명;

select * from dept4;

truncate table dept4;
drop table dept4;
