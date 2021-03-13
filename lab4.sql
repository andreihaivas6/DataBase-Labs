		!!! Pb. Beanca !!!

1. SELECT s.nume, s.prenume, valoare, p.nume, p.prenume FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol JOIN didactic d ON n.id_curs = d.id_curs JOIN profesori p ON d.id_prof = p.id_prof
2. SELECT s.nume, s.prenume, n.valoare, c.titlu_curs FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol JOIN cursuri c ON n.id_curs = c.id_curs WHERE n.valoare = 10 AND c.titlu_curs = 'BD';
3. SELECT p.nume, p.prenume, titlu_curs FROM profesori p JOIN didactic d ON p.id_prof = d.id_prof JOIN cursuri c ON d.id_curs = c.id_curs;
4. SELECT p.nume, p.prenume, titlu_curs FROM profesori p LEFT JOIN didactic d ON p.id_prof = d.id_prof LEFT JOIN cursuri c ON d.id_curs = c.id_curs;
5. SELECT p.nume, p.prenume, titlu_curs FROM profesori p JOIN didactic d ON p.id_prof = d.id_prof RIGHT OUTER JOIN cursuri c ON d.id_curs = c.id_curs;
6. SELECT p.nume, p.prenume, titlu_curs FROM profesori p FULL JOIN didactic d ON p.id_prof = d.id_prof FULL JOIN cursuri c ON d.id_curs = c.id_curs;
7. SELECT s1.nume || ' - ' || s2.nume, to_char(s1.data_nastere, 'Day') FROM studenti s1 JOIN studenti s2 ON to_char(s1.data_nastere, 'Day') = to_char(s2.data_nastere, 'Day') WHERE s1.nr_matricol <> s2.nr_matricol AND s1.nr_matricol < s2.nr_matricol;
8. SELECT s1.nume || ' ' || s1.prenume || ' a luat nota mai mare decat ' || s2. nume || ' ' || s2.prenume || ' la materia ' || titlu_curs  AS "Informatii" FROM studenti s1 CROSS JOIN studenti s2 JOIN note n1 ON s1.nr_matricol = n1.nr_matricol JOIN note n2 ON s2.nr_matricol = n2.nr_matricol JOIN cursuri c ON n1.id_curs = c.id_curs AND n2.id_curs = c.id_curs WHERE n1.valoare > n2.valoare;
