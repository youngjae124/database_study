/****************************************/
서브쿼리(sub query)

select (쿼리: 스칼라 서브쿼리)
from (쿼리: 인라인 뷰)
where (쿼리: 서브쿼리)

select * from emp;

20번 부서 사람들만 조회
select * from emp
where deptno = 20;

사번이 7844 인 사원과 같은 부서 사람들 조호 
select * from emp 
--where deptno =30;
where deptno =( select deptno 
                from emp
                where empno = 7844);


select * from emp2;
select * from dept2;

포항 사무실에서 일하는 직원 목록 조회

select * from dept2
where area = 'Pohang Main Office';


-- join 버전 
select * from emp2 e,dept2 d
where e.deptno = d.dcode
and d.area = 'Pohang Main Office';
-- 서브쿼리 버전

select *
from emp2
where deptno in(
                select dcode 
                from dept2
                where area ='Pohang Main Office');
                -- in(0001 1003 1006 1007)

select *
from emp2
where deptno in(
                select dcode 
                from dept2
                where area ='Pohang Main Office'
                        and dcode != '0001');
                        
select *
from emp2
where exists(
                select dcode 
                from dept2
                where area ='Pohang Main Office'
                        and dcode = deptno);

select dcode 
from dept2
where area ='Pohang Main Office'
    and dcode = '1002';
 
 
 -- 학생 student 학번이 9513인 학생보다 키가 작은 학생들 조회

select *
from student
where height < (select height
                from student
                where studno =9513);

 
 --2학년 학생들 중에 제일 몸무게가 많이 나가는 학생
 select *from student;
 
 select *
 from student
 where weight > (select max(weight)
                 from student
                 where grade =2);
 
select max(weight)
from student
where grade =2; 

-- 각 학년별로 가장 큰 몸무게
select *
from student
where weight >any (select max(weight)
              from student
              group by grade);
              
학년별로 몸무게가 제일 많이 나가는 학생들 정보만 조회

select *
from student 
where (grade, weight) in( --학년 +몸무게 두컬럼 모두 비교
                select grade, max(weight)
                from student
                group by grade ); 

-- emp2 기준 전체의 평균급여보다 많이 받는 직원조회

select * 
from emp2;

select *
from emp2
where pay> (select avg(pay)
                from emp2);
                
-- emp2기준 자신과 같은 직급(position)의 평균 급여보다 많이 받는 직원목록 조회
select *
from emp2;

select avg(pay)
from emp2
where position =(select position 
                 from emp2
                 where empno = '19960101');

select *
from emp2 A
where A.pay > (select avg(pay)
               from emp2 B
               where B.position = A.position);
               
select avg(pay)
from emp2
where position = 'section head';

-- emp2기준 자신과 같은 고용형태(emp_type)의 평균 급여보다 적게 받는 직원목록 조회

select *
from emp2 A
where A.pay < (select avg(pay)
               from emp2 B
               where B.emp_type= A.emp_type);


/*************************************************************/
select * from emp2;
select * from dept2;

사원이름,부서번호,부서이름

--join
select e.name, e.deptno, d.dname
from emp2 e , dept2 d
where e.deptno =d.dcode;

--subquery

select
    e.name ,
    e.deptno,
    (select dname
        from dept2
        where dcode = e.deptno) 부서명
from emp2 e;

select dname
from dept2
where dcode = '1004';


select * from panmae;
select * from product;

--join
select pm.p_date, pm.p_code, pd.p_name 
from panmae pm, product pd
where pm.p_code = pd.p_code;

--subquery
select 
    p_date,
    p_code,
    (select p_name
        from product pd
        where pd.p_code =pm.p_code) as "상품명"
from panmae pm;

/************************************************/

select job, mgr, hiredate, sal ,comn
from emp;

select empno,ename,job --sal from절에 속해있는 select 결과를 테이블로 간주 
from(select empno,ename,job
     from emp);
     
select enumber,emp_name,jj 
from
(select empno enumber, -- 컬럼 별칭이 외부에서 조회시 컬럼명으로 인식
        ename emp_name,
        job jj
        from emp);
     
select *
from (
        select e.name,e.deptno, d.dname
        from emp2 e, dept2 d
        where e.deptno = d.dcode);

--emp2 기준 자신과 같은 고용형태(emp_type)의 평균급여보다 적게 받는 직원목록 조회

select *
from 
    emp2 a, (select emp_type, avg(pay) avg_pay
            from emp2
            group by emp_type)b
where a.emp_type = b.emp_type
and a.pay < b.avg_pay;            


