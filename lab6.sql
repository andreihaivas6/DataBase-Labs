1.select a.nume||'-'||b.nume as "studenti",floor(months_between(a.data_nastere,b.data_nastere)/12) as "diferenta ani" from studenti a join studenti b on a.data_nastere>b.data_nastere order by floor(months_between(a.data_nastere,b.data_nastere)) asc;



2.select a.nume||'-'||b.nume as "prietenii"
from studenti a join profesori b on length(trim(a.nume))=length(trim(b.nume)) order by a.nume;



3.select distinct c.titlu_curs as "interesant"
from note n join cursuri c on n.id_curs=c.id_curs
minus
select distinct c.titlu_curs as "interesant"
from note n join cursuri c on n.id_curs=c.id_curs
where n.valoare=some(9,10);



4.(select  a.nr_matricol,a.nume,a.prenume
from studenti a join note n on a.nr_matricol=n.nr_matricol
minus
select  a.nr_matricol,a.nume,a.prenume 
from studenti a join note n on a.nr_matricol=n.nr_matricol
where n.valoare<=7)
union
(select  a.nr_matricol,a.nume,a.prenume
from studenti a join note n on a.nr_matricol=n.nr_matricol
minus
select  a.nr_matricol,a.nume,a.prenume 
from studenti a join note n on a.nr_matricol=n.nr_matricol
where n.valoare=some(1,2,3,4,5,6,8,9,10));



5.select s.nume from studenti s join note  n on s.nr_matricol=n.nr_matricol join cursuri c on n.id_curs=c.id_curs where n.valoare=any(7,10) and c.titlu_curs='OOP' and trim(to_char(n.data_notare,'day'))='tuesday';



6.select s.nume,c.titlu_curs as "materia" ,n.valoare as "nota",
trim(to_char(n.data_notare,'month'))||','||to_char(n.data_notare,'yyyy') as "sesiune",
decode(trim(to_char(n.data_notare,'month')),'february','+')as"!"
from studenti s join
note  n on s.nr_matricol=n.nr_matricol
join cursuri c on n.id_curs=c.id_curs where n.valoare>=5;