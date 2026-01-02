select * from student;
select * from score;
select * from hakjum;

SELECT s.studno AS 학번,
       s.name AS 이름,
       sc.total AS 점수,
       h.grade AS 학점
FROM student s
INNER JOIN score sc ON s.studno = sc.studno
INNER JOIN hakjum h ON sc.total BETWEEN h.min_point AND h.max_point 
ORDER BY sc.total DESC;



select * from student; 
select * from score ;
select * from hakjum;

SELECT s.studno AS 학번,
       s.name AS 이름,
       sc.total AS 점수,
       h.grade AS 학점
FROM student s
INNER JOIN score sc ON s.studno = sc.studno
INNER JOIN hakjum h ON sc.total BETWEEN h.min_point AND h.max_point 
where s.deptno1 in (101,102) 
ORDER BY sc.total DESC;


select * from student;
select * from department;
select * from professor;


SELECT s.name  name,
       s.grade  grade,
       p.name  name1,
       p.deptno  deptno,
       d.dname  dname
FROM student s
INNER JOIN professor p ON s.profno = p.profno       
INNER JOIN department d ON p.deptno = d.deptno     
WHERE p.deptno != 301; 


