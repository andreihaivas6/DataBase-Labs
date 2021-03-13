1. 
SELECT s1.nume, s1.prenume, s2.nume, s2.prenume, abs(s1.data_nastere - s2.data_nastere) FROM studenti s1, studenti s2 WHERE s1.nr_matricol > s2.nr_matricol ORDER by abs(s1.data_nastere - s2.data_nastere) ASC;
2. 
SELECT s.nume, s.prenume, p.nume, p.prenume FROM studenti s, profesori p WHERE LENGTH(trim(s.nume)) = LENGTH(trim(p.nume));
3. 
SELECT titlu_curs FROM cursuri c JOIN note n ON c.id_curs = n.id_curs
MINUS
SELECT titlu_curs FROM cursuri c JOIN note n ON c.id_curs = n.id_curs WHERE valoare IN (9, 10)
/
4. 
SELECT s.nume, s.nr_matricol FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol
MINUS
 SELECT s.nume, s.nr_matricol FROM studenti s JOIN note n ON s.nr_matricol = n.nr_matricol WHERE valoare < 7
/
5. 
select s.nume from studenti s join note  n on s.nr_matricol=n.nr_matricol join cursuri c on n.id_curs=c.id_curs where n.valoare=any(7,10) and c.titlu_curs='OOP' and trim(to_char(n.data_notare,'day'))='tuesday';
6. 



