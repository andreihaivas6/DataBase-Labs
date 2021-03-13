1.
SELECT nume, prenume FROM studenti WHERE bursa = (SELECT MAX(bursa) FROM studenti);
2.
SELECT s1.nume, s1.prenume FROM studenti s1, (SELECT * FROM studenti WHERE lower(nume) = 'arhire') s2 WHERE s1.an = s2.an AND s1.grupa = s2.grupa AND s1.nr_matricol = s2.nr_matricol;
3.
SELECT an, grupa, nume FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol 
WHERE (valoare, grupa, an) IN (SELECT MIN(valoare), grupa, an FROM note n JOIN studenti s ON n.nr_matricol = s.nr_matricol GROUP BY grupa, an);
4.
SELECT s.nr_matricol, nume, AVG(valoare) FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol GROUP BY s.nr_matricol, nume HAVING AVG(valoare) > (SELECT AVG(valoare) FROM note);
5.
SELECT * FROM (SELECT s.nr_matricol, nume, AVG(valoare) FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol GROUP BY s.nr_matricol, nume ORDER BY AVG(valoare) DESC) WHERE ROWNUM <= 3;
6.
SELECT nume, AVG(valoare) FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol GROUP BY s.nr_matricol, nume HAVING AVG(valoare) = (SELECT MAX(val) FROM  (SELECT AVG(valoare) val FROM note GROUP BY nr_matricol)); 
7.
SELECT DISTINCT nume, prenume FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol JOIN cursuri c ON n.id_curs = c.id_curs WHERE valoare = (SELECT valoare FROM note n JOIN studenti s ON s.nr_matricol = n.nr_matricol JOIN cursuri c ON n.id_curs = c.id_curs WHERE lower(prenume) = 'ciprian' AND lower(nume) = 'ciobotariu' AND titlu_curs = 'Logica') AND lower(prenume) != 'ciprian' AND lower(nume) != 'ciobotariu' AND titlu_curs = 'Logica';
8.

9.
SELECT * FROM (SELECT * FROM (SELECT nr_matricol, nume, prenume, an, grupa, bursa, data_nastere, SUM(valoare * credite) punctaj FROM (SELECT s.nr_matricol, nume, prenume, s.an, grupa, bursa, data_nastere, valoare, credite FROM studenti s JOIN note n ON n.nr_matricol = s.nr_matricol JOIN cursuri c ON c.id_curs = n.id_curs) GROUP BY nr_matricol, nume, prenume, an, grupa, bursa, data_nastere ORDER BY punctaj DESC) WHERE ROWNUM <= 3 ORDER BY punctaj ASC) WHERE ROWNUM = 1;
10.
SELECT nume, prenume, valoare, titlu_curs FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol JOIN cursuri c ON n.id_curs = c.id_curs WHERE (valoare, titlu_curs) IN (SELECT MAX(valoare), titlu_curs FROM note n JOIN cursuri c ON n.id_curs = c.id_curs GROUP BY titlu_curs);
