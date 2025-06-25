/*****************************************************/
데이터 딕셔너리
오라클 DB에서 관련된 각종 정보를 확인할 수 있는 사전

접근 자료 구분

USER_  :현재 로그인한 사용자가 소유한 객체 정보조회
ALL_   :현재 로그인한 사용자가 볼 수 있는 모든 객체 정보 조회 
DBA_   :DB 관리자 계정에서 DB 모든 객체 정보 조회


SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES;
--SELECT * FROM DBA_TABLES;

SELECT * FROM USER_VIEWS;
SELECT * FROM USER_SEQUENCES;
SELECT * FROM USER_OBJECT;
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUNMS;

SELECT * FROM ALL_USERS;
SELECT * FROM USER_ROLE_PRIVS;

--테이블 정보 조회시 사용하기 좋은 테이블
SELECT * FROM TAB
WHERE tname LIKE '%DEPT%';

select * from tab
where tname like '%MENU%';