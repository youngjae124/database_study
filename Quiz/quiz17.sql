select * from student;
select * from department;

select 
    name stu_name,
    deptno1, 
    dname dept_name  
from student s
inner join department d on s.deptno1 = d.deptno 
order by deptno1 ;


select * from emp2;
select * from p_grade;

--SELECT e.name AS "NAME",
--       e.position AS "POSITION",
--       e.pay AS "PAY",
--       p.s_pay AS "LOW PAY",
--       p.e_pay AS "HIGH PAY"        
--FROM emp2 e
--LEFT OUTER JOIN p_grade p ON e.position = p.position
--WHERE e.position IS NOT NULL;

select 
e.name,
e.position,
to_char(e.pay, '999,999,999')pay,
to_char(p.s_pay, '999,999,999') "low pay",
to_char(p.e_pay, '999,999,999') "high pay"
from emp2 e, p_grade p
where e.position is not null
and e.position = p.position(+); -- outer join

--from emp2 e left outer join p_grade p
--on e.position = p.position


select * from emp2;
select * from p_grade;

--select e.name  name,
--       trunc(to_char(to_date('2010-05-30', 'yyyy-mm-dd'), 'yyyy')) -
--       trunc(to_char(e.birthday, 'yyyy')) + 1 한국나이,
--       e.position  지금포지션,
--       p.position  그나이에맞는포지션
--from emp2 e
--left outer join p_grade p on (trunc(to_char(to_date('2010-05-30', 'yyyy-mm-dd'), 'yyyy'))-
--trunc(to_char(e.birthday, 'yyyy')) + 1) between p.s_age and p.e_age
--order by 2;


/*********선생님 풀이***********/
select 
    e.name,
--    birthday,
    2010 -to_char(e.birthday, 'yyyy')+1 한국나이,
   e.position 지금포지션,
   p.position 그나이에맞는포지션
--    to_date('2010-05-30')- birthday 일단위,
--    trunc((to_date('2010-05-30')- birthday)/365)일단위나이,
--    months_between(to_date('2010-05-30'),birthday)월단위,
--    trunc((months_between(to_date('2010-05-30'),birthday))/12)월단위,
    from emp2 e , p_grade p
    where (2010 -to_char(e.birthday, 'yyyy')+1) between p.s_age and p.e_age;


select * from customer;
select * from gift;

--select 
--    c.gname,
--    c.point, 
--    g.gname gname_1
--from customer c
--inner join gift g on c.point >= g.g_start
--where g.gname = 'Notebook';


/****************선생님 풀이**********************/
select * from customer;
select * from gift;

select *
from customer c, gift g
where c.point between g.g_start and g_end
and g.gname = 'Notebook';  -- 점수범위대로 노트북받는 사람들

select c.gname, c.point, 'Notebook' gname_1 -- g.gname
from customer c, gift g
where c.point between g.g_start and g_end
and g.gno >= 7;



select * from professor;

select 
    p1.profno,
    p1.name,
    p1.hiredate,
    (SELECT COUNT(*)
    FROM professor p2
    WHERE p1.hiredate >  p2.hiredate) count
from professor p1
order by p1.hiredate, p1.profno;


/*********** 풀이********************/
select * from professor;

select count(*)
from professor
where hiredate < '85/09/18'; --meg ryan 입사일자

select p1.profno, p1.name, p1.hiredate, count(p2.profno) count
from professor p1, professor p2
--where p1.hiredate > p2.hiredate; -- inner join 은 오디머피가 사라짐
where p1.hiredate > p2.hiredate(+)
group by p1.profno, p1.name, p1.hiredate
order by p1.hiredate;

select profno, name , hiredate,
rank() over (order by hiredate)-1 count
from professor;



select * from emp;

select 
    e.empno,
    e.ename,
    e.hiredate,
    (SELECT COUNT(*)
    FROM emp e2
    WHERE e.hiredate >  e2.hiredate) count
from emp e
order by  e.hiredate, e.empno;

/********************풀이****************************/

select * from emp;

select e1.empno, e1.ename, e1.hiredate, COUNT(e2.empno) COUNT
from emp e1, emp e2
where e1.hiredate > e2.hiredate(+)
group by e1.empno, e1.ename, e1.hiredate
order by e1.hiredate;


SELECT empno, ename, hiredate
, RANK() OVER (order by hiredate) -1 COUNT
from emp;