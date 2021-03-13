1. select nume, prenume, an, data_nastere from studenti;
SAVE p1.sql;
2. select distinct bursa from studenti where bursa is not null;
3. @p1.sql;
select nume as n, prenume as p_, an as a_, data_nastere as d_ from studenti;
4. select nume || ' ' || prenume ||',' || an as "Studenti pe ani de studiu" 
from studenti order by an ASC;
5. select nume, prenume, data_nastere from studenti where data_nastere  between 
to_date('1/1/1995', 'dd/mm/yyyy') and to_date('10/6/1997', 'dd/mm/yyyy') order by an DESC;
6. SELECT nume, prenume, an FROM studenti WHERE data_nastere LIKE '%95';
7. SELECT * FROM studenti WHERE bursa IS NULL;
8. SELECT nume, prenume FROM studenti WHERE bursa IS NOT NULL AND an IN (2, 3) 
ORDER BY nume ASC, prenume DESC;
9. SELECT nume, prenume, bursa * 1.15 FROM studenti WHERE bursa IS NOT NULL;
10.SELECT nume, prenume FROM studenti WHERE nume LIKE 'P%' AND an = 1;
11.SELECT * FROM studenti WHERE REGEXP_COUNT(lower(prenume), 'a') = 2;
// SELECT * FROM studenti WHERE prenume LIKE '%a%a%' OR prenume LIKE 'A%a%'; 
12.SELECT * FROM studenti WHERE prenume IN ('Alexandru', 'Ioana', 'Marius');
13.SELECT * FROM studenti WHERE bursa IS NOT NULL AND grupa LIKE 'A%';
14.SELECT nume, prenume FROM profesori WHERE trim(lower(prenume)) LIKE '%n';