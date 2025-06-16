--select  name || '''s ID : ' || id || ',weight is'
--                || weight ||   
--                'kg' AS "ID and we"from student;
                
select name  || (job) || name || 'job' AS "name and job" from emp;

select 
name || '''s ID: ' || id || ',weight is ' || weight || 'kg' AS "ID AND WEIGHT" 
       from student;
       
--2      
select ename, ename, ename, ename from emp;
select ename, job from emp;
select ename || '(' || job || ') , ' || ename || '''' || job || '''' "NAME AND JOB"
from emp;

--3

select * from emp;
select ename, sal from emp;

select ename || '''s sal is $' || sal AS "NAME and Sal" from emp;
