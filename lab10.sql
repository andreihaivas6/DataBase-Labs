1.
SELECT * FROM studenti s1 WHERE EXISTS (SELECT * FROM studenti s2 WHERE s1.an = s2.an AND s1.data_nastere > s2.data_nastere);
2.
SELECT an, nume, prenume, AVG(valoare) FROM studenti s1 JOIN note n1 ON s1.nr_matricol = n1.nr_matricol GROUP BY s1.nr_matricol, nume, prenume, an HAVING AVG(valoare) >= (SELECT AVG(valoare) FROM studenti s2 JOIN note n2 ON s2.nr_matricol = n2.nr_matricol WHERE s1.an = s2.an);
SELECT nume, prenume, AVG(valoare) FROM studenti s1 JOIN note n1 ON s1.nr_matricol = n1.nr_matricol GROUP BY s1.nr_matricol, nume, prenume, an HAVING AVG(valoare) > (SELECT AVG(valoare) FROM studenti s2 JOIN note n2 ON s2.nr_matricol = n2.nr_matricol GROUP BY an HAVING s1.an = s2.an);
3.
SELECT nume, prenume, an, grupa FROM studenti s1 JOIN note n1 ON s1.nr_matricol = n1.nr_matricol GROUP BY s1.nr_matricol, nume, prenume, an, grupa HAVING AVG(valoare) >= ALL(SELECT AVG(valoare) FROM studenti s2 JOIN note n2 ON s2.nr_matricol = n2.nr_matricol GROUP BY s2.nr_matricol, an, grupa HAVING s1.an = s2.an AND s1.grupa = s2.grupa);
4.
SELECT DISTINCT s1.nr_matricol, nume, prenume, s1.an FROM studenti s1 JOIN note n1 ON s1.nr_matricol = n1.nr_matricol JOIN cursuri c1 ON n1.id_curs = c1.id_curs WHERE EXISTS (SELECT * FROM studenti s2 JOIN note n2 ON s2.nr_matricol = n2.nr_matricol JOIN cursuri c2 ON n2.id_curs = c2.id_curs WHERE s1.nr_matricol != s2.nr_matricol AND s1.an = s2.an AND n1.valoare = n2.valoare AND c1.titlu_curs = c2.titlu_curs);
5.
SELECT nume, prenume, grupa, an FROM studenti s1 WHERE NOT EXISTS (SELECT * FROM studenti s2 WHERE s1.an = s2.an AND s1.grupa = s2.grupa AND s1.nr_matricol != s2.nr_matricol);
6.
SELECT nume, prenume, AVG(valoare) FROM profesori p1 JOIN didactic d1 ON p1.id_prof = d1.id_prof JOIN note n1 ON n1.id_curs = d1.id_curs GROUP BY p1.id_prof, nume, prenume HAVING AVG(valoare) IN (SELECT AVG(valoare) val FROM profesori p2 JOIN didactic d2 ON p2.id_prof = d2.id_prof JOIN note n2 ON n2.id_curs = d2.id_curs WHERE p1.id_prof != p2.id_prof GROUP BY p2.id_prof);
7.
SELECT nume, prenume, NVL((SELECT AVG(valoare) FROM note n1 WHERE s1.nr_matricol = n1.nr_matricol), 0) Medie FROM studenti s1;
8.
-> corelat:
SELECT titlu_curs, an, credite FROM cursuri c1 WHERE NOT EXISTs (SELECT * FROM cursuri c2 WHERE c1.an = c2.an AND c1.id_curs != c2.id_curs AND c1.credite < c2.credite);
-> necorelat:
SELECT titlu_curs, an, credite FROM cursuri WHERE (an, credite) IN (SELECT an, MAX(credite) FROM cursuri GROUP BY an);