/**********************************************/
타입변환

select 2+2 from dual;
select 2 + '2' from dual; --자동형변환(묵시적변환)
select 2 || '2' from dual;
select 2 + to_number('2') from dual; -- 명시적 형변환

to_char 문자로
to_date 날짜로
to_number 숫자로

select
    to_char(1231),
    to_char(123.592),
    sysdate,
    to_char(sysdate),
    to_char(sysdate, 'yyyy'),
    to_char(sysdate, 'mm'),
    to_char(sysdate, 'dd')
    to_char(sysdate, 'yyyymmdd'),
    to_char(sysdate, 'yyyy/mm/dd'),
    to_char(sysdate, 'yyyy-mm-dd'),
from dual;


--jumin 문자타임 substr
-- birthday 날짜타입 75/10/23 1975-10-23 to_chaㄱ
select 
    jumin,
    birthday,
    to_char(birthday, 'yy') 년,
    to_char(birthday, 'mm') 월,
    to_char(birthday, 'dd') 일,
    to_char(birthday, 'yyyy-mm-dd')
from student;

select 
    sysdate,
    to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
    systimestamp,
    to_char(systimestamp, 'yyyy-mm-dd hh24:mi:ss')
from dual;    

select
    to_number('123'),
    to_number('1394.1939')
--    to_number('13asdf.19') error
from dual;    

select 
    to_char(1234, '999999'),
    to_char(1234, '0999999'),
    to_char(1234, '$999999'),
    '$' || 1234,
    to_char(1234, '9999.99'),
    to_char(1234567, '9,999,999')
from dual;    



select
    '2025-12-05' || 3,
    to_date('2025-12-05') + 3,
    to_date('2025/12/05') + 5,
    to_date('25/12/05') + 7,
    to_date('20251205') + 3,
    last_day('2025-12-01'),
    last_day( to_date('2025-12-01') ),
    to_date('2025-12-05', 'yyyy-mm-dd'),
    to_date('25/12/05', 'yy/mm/dd'),
    to_date('2025,12,05', 'yyyy,mm,dd')
from dual;

select
    substr('2025-12-05', 6,2),
    to_char( to_date('2025-12-05'), 'mm')
from dual;    

