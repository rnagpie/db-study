--테이블 생성시, product_quiz 테이블명으로 생성

CREATE TABLE product_quiz
(
product_id INTEGER NOT NULL,
product_code VARCHAR(8) NOT NULL,
price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);

select * from product_quiz;

10000 -> 1  10000
9000  -> 0  0
22000 -> 2  20000
15000 -> 1  10000
30000 -> 3  30000
17000 -> 1  10000


select price, COUNT(*)
from product_quiz
GROUP BY price;


--1) 가격대 별로 나눠서 각자 갯수 계산 -> 합치면~
select 0 PRICE_GROUP, COUNT(*) PRODUCTS
--select *
from product_quiz
where price BETWEEN 0 AND 9999
UNION ALL
select 10000, COUNT(*)
from product_quiz
where price BETWEEN 10000 AND 19999
UNION ALL
select 20000, COUNT(*)
from product_quiz
where price BETWEEN 20000 AND 29999
UNION ALL
select 30000, COUNT(*)
from product_quiz
where price BETWEEN 30000 AND 39999;


--2) 가격단위로 그룹으로 묶어서 잘 처리를~
select
    CASE
        WHEN price BETWEEN 0 AND 9999 THEN 0
        WHEN price BETWEEN 10000 AND 19999 THEN 10000
        WHEN price BETWEEN 20000 AND 29999 THEN 20000
        WHEN price BETWEEN 30000 AND 39999 THEN 30000
    END PRICE_GROUP,
    count(*) PRODUCTS
from product_quiz
group by 
    CASE
        WHEN price BETWEEN 0 AND 9999 THEN 0
        WHEN price BETWEEN 10000 AND 19999 THEN 10000
        WHEN price BETWEEN 20000 AND 29999 THEN 20000
        WHEN price BETWEEN 30000 AND 39999 THEN 30000
    END
order by PRICE_GROUP;

select
    TRUNC(price/10000)*10000 PRICE_GROUP,
    count(*) PRODUCTS
from product_quiz
group by TRUNC(price/10000)
order by PRICE_GROUP;

select TRUNC(1.1), FLOOR(1.1),
       TRUNC(-1.5), FLOOR(-1.5)
from dual;

select price PRICE_GROUP, COUNT(*) PRODUCTS
FROM (
    select
        CASE
            WHEN price BETWEEN 0 AND 9999 THEN 0
            WHEN price BETWEEN 10000 AND 19999 THEN 10000
            WHEN price BETWEEN 20000 AND 29999 THEN 20000
            WHEN price BETWEEN 30000 AND 39999 THEN 30000
        END PRICE
    from product_quiz
)
group by price
order by PRICE_GROUP;


select price, price/10000, TRUNC(price/10000), TRUNC(price/10000)*10000
from product_quiz;

-- +서브쿼리 

select price_group, COUNT(*) PRODUCTS
from (
    select 
        product_id,
        product_code,
        price,
        TRUNC(price/10000) price_code,
        TRUNC(price/10000)*10000 price_group
    from product_quiz
    )
GROUP BY price_group
order by price_group;


select price_code*10000 PRICE_GROUP, COUNT(*) PRODUCTS
from (
    select 
        product_id,
        product_code,
        price,
        TRUNC(price/10000) price_code,
        TRUNC(price/10000)*10000 price_group
    from product_quiz
    )
GROUP BY price_code
order by price_code;





















SELECT
    TRUNC(PRICE / 10000) * 10000 AS PRICE_GROUP,
    COUNT(PRODUCT_ID) AS PRODUCTS
FROM
    product_quiz
GROUP BY
    TRUNC(PRICE / 10000) * 10000
ORDER BY
    PRICE_GROUP ASC;




