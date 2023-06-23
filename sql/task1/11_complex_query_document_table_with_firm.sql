SELECT EXTRACT(YEAR FROM doc_date) AS Year, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 1 THEN sum ELSE 0 END) AS January, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 2 THEN sum ELSE 0 END) AS February, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 3 THEN sum ELSE 0 END) AS March, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 4 THEN sum ELSE 0 END) AS April, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 5 THEN sum ELSE 0 END) AS May, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 6 THEN sum ELSE 0 END) AS June, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 7 THEN sum ELSE 0 END) AS July, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 8 THEN sum ELSE 0 END) AS August,
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 9 THEN sum ELSE 0 END) AS September, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 10 THEN sum ELSE 0 END) AS October, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 11 THEN sum ELSE 0 END) AS November, 
    SUM(CASE WHEN EXTRACT(MONTH FROM doc_date) = 12 THEN sum ELSE 0 END) AS December 
    FROM Document 
    inner join firm on firm.firm_id = document.firm_id
    where firm.firm_id = 1
    GROUP BY EXTRACT(YEAR FROM doc_date);