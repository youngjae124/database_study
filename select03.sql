/*******************************************/
단일행 함수

select * from dual;
dual : 더미 데이터 들어있는 임시 테이블

select INITCAP('abc') from dual;
select ename, INITCAP(ename) from emp;

select name, LOWER(name), UPPER(name)
from student;

select name, length(name)
from student;

select length('abcdefdo'), lengthb('abcdefdo'),
       length('한글'), lengthb('한글')  -- 한글 한글자가 3byte
from dual;

-- 이름이 알파벳 5글자 이상 조회
select * 
from emp
where length(ename) >=5;

select '아침' || '점심', concat('아침','점심')
from dual;

select '아침' || '점심' || '저녁',
        concat(concat('아침','점심'), '저녁')
from dual;

-- substr(대상값/컬럼명 , 시작지점, 자릿수)
select
    substr('abcdefg', 1, 3),
    substr('abcdefg', 3, 5),
    substr('abcdefg', -4, 2),
    substr('abcdefg', -3, 3)
from dual;    

-- instr(대상값/ 컬럼명, 찾는값)
-- instr(대상값/ 컬럼명, 찾는값, 시작위치)
-- instr(대상값/ 컬럼명, 찾는값, 시작위치, 몇번째값)

select 
    instr('2025-06-05 10:22:45', '-'),
    instr('2025-06-05 10:22:45', ':'),
    instr('2025-06-05 10:22:45', '-', 6),
    instr('2025-06-05 10:22:45', ':', 15),
    instr('2025-06-05 10:22:45', '-', 1, 2)
from dual;    

select 
    tel,
    instr(tel, ')'),
    instr(tel, '-')
from student;

select 
    lpad('문자', 10, '-'),
    rpad('13kd', 8, '*'),
    lpad(5, 2, 0),
    lpad(5, 3, 0),
    lpad(75, 2, 0)
from dual;

select
    ltrim(' abcd '),
    rtrim(' abcd '), 
    trim(' abcd '),
    ltrim('**abcd**', '*'),
    rtrim('**abcd**', '*')
from dual;    

select 
    replace('abcde', 'c', '/') 
from dual;

select 
    birthday,
    replace(birthday, '/', '$')
from student;



/*****************************************************/
-- 숫자
select 
    round(1.123), -- 반올림
    round(1.78),
    round(1.78432, 3),
    round(1.78432123, 0),
    round(12222.784324325, -1),
    trunc(1.3556), -- 버림
    trunc(1.3556, 2),
    mod(15, 4), -- 나머지
    ceil(123.123), -- 인접한 큰 정수
    floor(123.123), -- 인접한 작은 정수
    power(6, 3) -- 6의 3 제곱 6*6*6
from dual;    
        
        
select 
    rownum, --행번호
    ceil(rownum/3) 그룹번호, --1/3 = 0.33 -> 1 2/3 = 0.66 -> 1 3/3 = 1
    
    ceil(rownum/4) 팀번호,
    empno,
    ename
from emp;
--where rownum < 5;


/*******************************************************/
--날짜 

select 
     sysdate, -- 현재 날짜
     systimestamp, -- 현재 날짜 시간
     months_between('2024-01-05', '2024-03-05'),
     months_between('2024-11-05', '2024-06-20')
     -- 앞날짜 - 뒷날짜 -> 월단위 환산
from dual;

select 
    add_months(sysdate, 3),
    add_months(sysdate, 6),
    add_months(sysdate, -7),
    last_day(sysdate), -- 30 31 28 29 
    next_day(sysdate, '수'),
    next_day(sysdate, '토')
from dual;    

select
    sysdate,
    round(sysdate),
    trunc(sysdate),
    trunc(sysdate, 'yy'), -- year month day
    trunc(sysdate, 'mm'), 
    trunc(sysdate, 'dd'),
    add_months(sysdate, 1), -- 월 단위 계산
    sysdate +3, -- 일 단위 계산
    sysdate +7,
    -- 다음달 첫날
    last_day(sysdate)+1,
    trunc(add_months(sysdate, 1), 'mm'),
    -- 전월의 마지막날
    last_day(add_months(sysdate, -1)),
    trunc(sysdate, 'mm')-1
from dual;













