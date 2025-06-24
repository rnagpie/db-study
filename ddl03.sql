/***********************************/
DDL 제약조건 KEY

PK(Primary Key) 기본키 (테이블에 한개만 설정 가능)
FK(Foreign Key) 외래키

select * from student; -> profno -> professor
select * from emp; -> deptno -> dept;

CREATE TABLE tt03
(
    no NUMBER(3) PRIMARY KEY,  --NOT NULL UNIQUE
    name VARCHAR2(16) NOT NULL,
    birth DATE
);

CREATE TABLE tt04
(
    no NUMBER(3) PRIMARY KEY,   --PK 한개만 존재 제약때문에 설정 불가
    id VARCHAR2(32) PRIMARY KEY, --PK 한개만 존재 제약때문에 설정 불가
    name VARCHAR2(16) NOT NULL, 
    birth DATE
);

CREATE TABLE tt04
(
    no NUMBER(3),   
    id VARCHAR2(32),
    name VARCHAR2(16) NOT NULL, 
    birth DATE,
    CONSTRAINT tt04_pk PRIMARY KEY (no, id) --두개의 컬럼을 묶어서 PK로 설정
);



/*******************************/
외래키 FK : 다른테이블에 있는 키값을 참조하는 컬럼

- 참조하는 테이블(부모테이블)에 존재하는 값만 사용 가능(+null 가능)
- 외래키 설정된 부모테이블에서 자신을 참조하는 자식테이블의 데이터가 존재하면, 삭제 불가

외래키 삭제 조건
ON DELETE CASCADE;  --부모 데이터 삭제시, 그 값을 참조하는 자식 데이터도 같이 삭제
ON DELETE SET NULL; --부모 데이터 삭제시, 그 값을 참조하는 자식 데이터를 NULL 값으로 변경


CREATE TABLE T_CLUB 
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(32)
);
--T_TABLE
--V_VIEW

DROP TABLE T_MEMBER;

CREATE TABLE T_MEMBER
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(32),
    --club_id REFERENCES T_CLUB(id)  --외래키 설정 FK
    --club_id REFERENCES T_CLUB(id) ON DELETE CASCADE  --외래키 설정 FK
    club_id REFERENCES T_CLUB(id) ON DELETE SET NULL  --외래키 설정 FK
);

select * from t_club;
INSERT INTO T_CLUB VALUES(1, '독서');
INSERT INTO T_CLUB VALUES(2, '게임');
INSERT INTO T_CLUB VALUES(3, '등산');
INSERT INTO T_CLUB VALUES(4, '낚시');

select * from T_MEMBER;
INSERT INTO T_MEMBER VALUES (1, '이름1', 2);
INSERT INTO T_MEMBER VALUES (2, '이름2', 1);
INSERT INTO T_MEMBER VALUES (3, '이름3', 1);

select *
from t_member m, t_club c
where m.club_id = c.id;

INSERT INTO T_MEMBER VALUES (3, '이름3', 1); --member PK id중복 
INSERT INTO T_MEMBER VALUES (4, '이름4', null);
INSERT INTO T_MEMBER VALUES (5, '이름5', 8); 
--FK 에 해당하는 T_CLUB에 id에 8이 존재하지 않아서 불가
INSERT INTO T_MEMBER VALUES (5, '이름5', 4); 

select *
--delete
from t_club     --해당 값을 참조하는 외부 데이터가 있으면 삭제 불가
where id = 4;

select *
--delete
from t_member  --외래키 설정된 상태로 참조하는 데이터를 먼저 삭제
where id = 5;









