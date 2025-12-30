select * from professor;

select deptno, name,
decode(deptno, 101, decode(name, 'Audie Murphy', 'best!')) as decode
from professor;

select deptno, name,
decode(deptno, 101, decode(name, 'Audie Murphy', 'best!','Angela Bassett',
'good!', 'Jessica Lange', 'good!'))as 비고
from professor;


select * from professor;

select deptno, name,
decode(deptno, 101, decode(name, 'Audie Murphy', 'best!','GOOD!'),'N/A')as 비고
from professor;


select * from student;

select name, jumin,
decode(substr(jumin, 7,1), '1','남자','2','여자' ) as 성별
from student
where deptno1 = 101;




select * from student;

select 
    name,
    tel,
    SUBSTR(tel, 1, 3),   --   '02)'
    SUBSTR(tel, 1, INSTR(tel, ')')-1) 지역번호,
    DECODE( 
        SUBSTR(tel, 1, INSTR(tel, ')')-1),
        '02', '서울',
        '031', '경기',
        '051', '부산',
        '052', '울산',
        '055', '경남'
    ) 지역명,
    CASE SUBSTR(tel, 1, INSTR(tel, ')')-1)
        WHEN '02' THEN '서울'
        WHEN '055' THEN '경남'
    END 지역명2,
    CASE 
        WHEN SUBSTR(tel, 1, INSTR(tel, ')')-1) = '02' THEN '서울'
        WHEN SUBSTR(tel, 1, INSTR(tel, ')')-1) = '055' THEN '경남'
    END 지역명3
from student
where deptno1 = 101;