1. 
SELECT an, COUNT(*) FROM studenti GROUP BY an;
2. 
SELECT an, grupa, COUNT(*) FROM studenti GROUP BY an, grupa ORDER BY an, grupa ASC;
3. 
SELECT an, grupa, COUNT(*), COUNT(bursa) FROM studenti GROUP BY an, grupa;
4. 
SELECT SUM(bursa) FROM studenti;
5. 
SELECT AVG(NVL(bursa, 0)) FROM studenti;
6. 
SELECT valoare, COUNT(valoare) FROM note GROUP BY valoare ORDER BY valoare DESC;
7. 
SELECT TO_CHAR(data_notare, 'Day'), COUNT(valoare) FROM note GROUP BY TO_CHAR(data_notare, 'Day') ORDER BY COUNT(VALOARE) DESC;
8. 
SELECT TO_CHAR(data_notare, 'Day'), COUNT(valoare) FROM note GROUP BY TO_CHAR(data_notare, 'd'), TO_CHAR(data_notare, 'Day') ORDER BY TO_CHAR(data_notare, 'd');
9. 
SELECT s.nr_matricol, nume, AVG(valoare) FROM note n JOIN studenti s ON n.nr_matricol = s.nr_matricol GROUP BY s.nr_matricol, nume ORDER BY AVG(valoare) DESC;
10.
SELECT s.nr_matricol, nume, AVG(valoare) FROM note n RIGHT JOIN studenti s ON n.nr_matricol = s.nr_matricol GROUP BY s.nr_matricol, nume ORDER BY AVG(valoare) DESC;
11.
SELECT s.nr_matricol, nume, NVL(AVG(valoare),0) FROM note n RIGHT JOIN studenti s ON n.nr_matricol = s.nr_matricol GROUP BY s.nr_matricol, nume ORDER BY AVG(valoare) DESC;
12.
SELECT s.nr_matricol, nume, NVL(AVG(valoare),0) FROM note n RIGHT JOIN studenti s ON n.nr_matricol = s.nr_matricol GROUP BY s.nr_matricol, nume HAVING AVG(valoare) > 8 ORDER BY AVG(valoare) DESC;
13.
SELECT s.nr_matricol, s.nume, MAX(n.valoare), MIN(n.valoare), AVG(n.valoare) FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol GROUP BY s.nr_matricol, s.nume HAVING MIN(n.valoare) >= 7;
14.
SELECT s.nr_matricol, s.nume, AVG(n.valoare) FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol GROUP BY s.nr_matricol, s.nume HAVING COUNT(n.valoare) >= 4;
15.
SELECT s.nr_matricol, nume, AVG(valoare) FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol WHERE an = 3 AND grupa = 'A2' GROUP BY s.nr_matricol, nume;
16.
SELECT MAX(AVG(valoare)) FROM note GROUP BY nr_matricol;
17.
SELECT c.id_curs, titlu_curs, MIN(valoare), MAX(valoare) FROM cursuri c JOIN note n ON c.id_curs = n.id_curs GROUP BY c.id_curs, titlu_curs;
