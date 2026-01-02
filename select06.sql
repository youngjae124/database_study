/*****************************************************/
복수행 함수 (집계)

Count(대상) 갯수세기

select * from emp;

select count(*)
from emp;


--갯수 대상식별자(기본키 primary key/pk)
select count(empno),
       count(mgr),
       count(comm) -- 특정 컬럼 대상으로  null이 아닌것의 갯수  단일행위결과를 나타내는건 안됨
from emp;

select count(*)
from emp 
where comm is not null;


select count(*)
from emp 
where comm is null;



select count(*) from student
where grade =4;


  sum / avg / max / min/ stddev/ variance

-- 총직원 몇명 총급여 얼마
select count(*), sum(sal) from emp;

-- 10,20 부서에 다니는 직원 몇명 총급여 얼마
select count(*), sum(sal) from emp
where deptno in (10,20);


select 
    sum(height),
    avg(height),
    max(height),
    min(height),
    stddev(height),
    variance(height)
from student;