10) select name from Highschooler
where ID in (select ID1 from Friend 
where ID2 in (select ID from Highschooler 
where name="Gabriel"));

11) select h1.name, h1.grade, h2.name, h2.grade
from highschooler as h1
join likes as l on l.id1 = h1.id
join highschooler as h2 on h2.id = l.id2
where h2.grade <= h1.grade - 2;

12) select n2, g2, n1, g1 from
( select h1.id+h2.id as mult, h1.name as n1, h1.grade as g1, h2.name as n2, h2.grade as g2
  from likes as l
  join highschooler as h1 on h1.id = l.id1
  join highschooler as h2 on h2.id = l.id2
  where exists (select * from likes where id1=h2.id and id2=h1.id)
  order by  mult asc , h1.name < h2.name desc
) as t
group by mult;

13) select  h1.name, h1.grade
from highschooler as h1
join friend as f on f.id1=h1.id
join highschooler as h2 on h2.id = f.id2
where h1.grade=h2.grade
and not exists (select id from highschooler where id in (
  select id2 from friend where id1=h1.id) and grade <> h1.grade)
group by h1.name
order by h1.grade, h1.name;

14) select name, grade from highschooler
where id in (
select id2
from likes
group by id2
having count(id1) > 1
);