select * from panmae;
select * from product;
select * from gift;

SELECT 
    p.p_name AS 상품명,          
    p.p_price AS 상품가,         
    pm.p_qty AS 구매수량,        
    pm.p_total AS 총금액,      
    pm.p_total * 100 AS 적립포인트,     
    CASE 
        WHEN TO_CHAR(TO_date(pm.p_date, 'YYYY-MM-DD'), 'MM-DD') = '01-01' 
        THEN pm.p_total * 200
        ELSE pm.p_total * 100
        END AS 새해2배적립포인트,   
    g.gname AS 사은품명,         
    g.g_start || ' ~ ' || g.g_end AS 포인트범위

FROM panmae pm 
INNER JOIN product p ON pm.p_code = p.p_code
INNER JOIN gift g ON CASE WHEN TO_CHAR(TO_DATE(pm.p_date, 'YYYY-MM-DD'), 'MM-DD') = '01-01' 
        THEN pm.p_total * 200
        ELSE pm.p_total * 100
    END BETWEEN g.g_start AND g.g_end 
ORDER BY pm.p_date ASC; 