10) SELECT name FROM Highschooler WHERE id IN (SELECT ID1 FROM friend WHERE id1 = id and id2 IN (SELECT id FROM Highschooler WHERE name="Gabriel"));

11) SELECT h1.name, h1.grade, h2.name, h2.grade FROM Highschooler as h1 join likes as l on l.id1 = h1.id join highschooler as h2 on h2.id = l.id2 WHERE h2.grade <= h1.grade - 2;

12) SELECT n2, g2, n1, g1 FROM
   (SELECT h1.id+h2.id AS mult, h1.name AS n1, h1.grade AS g1, h2.name AS n2, h2.grade AS g2
   FROM likes AS l
   JOIN highschooler AS h1 on h1.id = l.id1
   JOIN highschooler as h2 on h2.id = l.id2
   WHERE exists (SELECT * FROM likes WHERE id1=h2.id AND id2=h1.id)
   ORDER BY  mult asc , h1.name < h2.name desc
   ) as t
   GROUP BY mult;

13) SELECT  h1.name, h1.grade
   FROM highschooler as h1
   JOIN friend as f on f.id1=h1.id
   JOIN highschooler as h2 on h2.id = f.id2
   WHERE h1.grade=h2.grade
   and not exists (SELECT id FROM highschooler WHERE id IN (
   SELECT id2 FROM friend WHERE id1=h1.id) AND grade <> h1.grade)
   GROUP BY h1.name
   ORDER BY h1.grade, h1.name;

14) SELECT name, grade FROM Highschooler WHERE id in (SELECT id2 FROM likes group by id2 having count(id1) > 1);