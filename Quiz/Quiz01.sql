select * from student;
select name , id ,weight from student;

select (name || q'['s ID : ]' || id || q'[, WEIGHT is ]' || weight || 'kg') AS "ID AND WEIGHT" from student;

select q'[이 안에다가 문자 " 문자 ' 이런식으로]' from dual;


/**************************************************************/
select * from emp;
select (ename || '('|| job ||') , '||  ename||q'[']'||job||'''') AS "NAME AND JOB" from emp;

/******************************************************************/

select * from emp;
select ename || '''s sal is $' || sal "Name and Sal" from emp;


