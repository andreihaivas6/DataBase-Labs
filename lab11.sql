1.

1.
UPDATE studenti s1 SET bursa = 500 WHERE (SELECT MAX(valoare) FROM note n1 WHERE s1.nr_matricol = n1.nr_matricol) = 10;
UPDATE studenti s1 SET bursa = 500 WHERE nr_matricol IN (SELECT nr_matricol FROM note WHERE valoare = 10);

2.
UPDATE studenti s1 SET bursa = 100 * NVL((SELECT AVG(valoare) FROM note n1 GROUP BY n1.nr_matricol HAVING s1.nr_matricol = n1.nr_matricol), 0);


1.
DELETE FROM studenti s1 WHERE NOT EXISTS (SELECT * FROM note n2 WHERE s1.nr_matricol = n2.nr_matricol);
DELETE FROM studenti s1 WHERE (SELECT COUNT(valoare) FROM note n2 WHERE s1.nr_matricol = n2.nr_matricol) = 0;

1.
CREATE TABLE ceva AS (SELECT nume, prenume, bursa, AVG(valoare) medie FROM studenti s1 JOIN note n1 ON s1.nr_matricol = n1.nr_matricol GROUP BY s1.nr_matricol, nume, prenume, bursa);


1.
ALTER TABLE studenti ADD CONSTRAINT pk_s PRIMARY KEY (nr_matricol);
2.
ALTER TABLE didactic ADD CONSTRAINT c1 FOREIGN KEY (id_prof) REFERENCES profesori(id_prof) ON DELETE SET NULL;
ALTER TABLE didactic ADD CONSTRAINT c2 FOREIGN KEY (id_curs) REFERENCES cursuri(id_curs) ON DELETE CASCADE;
3.
ALTER TABLE note ADD constraint c1 UNIQUE(nr_matricol, id_curs);
4.
ALTER TABLE note ADD constraint c1 CHECK(valoare >= 1 AND valoare <= 10);

1-8.
// SAVEPOINT s;
DELETE FROM profesori;
INSERT INTO profesori VALUES(1, 'Ion', 'Ionel', 'Decan');
SAVEPOINT s1;
UPDATE profesori SET nume = 'Ionescu';
SELECT * FROM profesori;
ROLLBACK TO SAVEPOINT s1;
SELECT * FROM profesori;
ROLLBACK; // ROLLBACK TO SAVEPOINT s;





