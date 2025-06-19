/*emp2 테이블을 기준으로 아래 정보를 출력
사원들 중에 70년대 생이면서 지역번호를 기준으로 서울(02), 경기도(031)에 거주하는
사원들의 정보를 아래와 같이 출력하시오.
사번, 이름, 생년월일, 취미, 급여(pay), 성과급(급여의 150%)
, 직원분류(단, 가족과 같은 직원이라서 family로 표기)
,전화번호, 급여수준
(단, 급여수준은 아래와 같이 분류)
3500만 1원 ~ 4500만 : '하'
4500만 1원 ~ 6천만 : '중"
6000만 1원 이상 : '상'
그 외... : '화이팅'
*/

SELECT
    EMPNO AS 사번,
    NAME AS 이름,
    BIRTHDAY AS 생년월일,
    HOBBY AS 취미,
    PAY AS 급여_pay,
    (PAY * 1.5) AS 성과급, -- 급여의 150%
    'family' AS 직원분류, -- 'family'로 고정
    TEL AS 전화번호,
    CASE
        WHEN PAY BETWEEN 35000001 AND 45000000 THEN '하'
        WHEN PAY BETWEEN 45000001 AND 60000000 THEN '중'
        WHEN PAY >= 60000001 THEN '상'
        ELSE '화이팅'
    END AS 급여수준
FROM
    emp2
WHERE
    -- 70년대생 필터링 (BIRTHDAY의 앞 두 자리가 '7'로 시작하는지 확인)
    SUBSTR(BIRTHDAY, 1, 1) = '7'
    AND (
        -- 전화번호가 '02'로 시작하는 서울 지역
        SUBSTR(TEL, 1, 2) = '02'
        -- 또는 전화번호가 '031'로 시작하는 경기도 지역
        OR SUBSTR(TEL, 1, 3) = '031'
    );
