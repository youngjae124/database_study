select * from professor;

select profno,name ,pay, bonus,
to_char (pay *12 + nvl(bonus,0),'999,999') as total
from professor
where deptno = 201;


select * from emp;

select empno, ename , comm , nvl2(comm, 'exist', 'null') as nvl2
from emp
where deptno = 30;
 

