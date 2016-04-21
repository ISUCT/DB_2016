1) select distinct name
 from Highschooler 
where ID in (select ID1 from Friend where ID2 in (select ID from Highschooler where name="Gabriel"));
2) select distinct sName, sGrade, lName, lGrade
from (select h1.name as sName, h1.grade sGrade, h2.name as lName, h2.grade as lGrade, h1.grade-h2.grade as gradeDiff 
     from Highschooler h1, Likes, Highschooler h2
     where h1.ID=ID1 and h2.ID=ID2)
where gradeDiff>=2;
3) select h1.name, h1.grade, h2.name, h2.grade 
from Likes l1, Likes l2, Highschooler h1, Highschooler h2
where l1.ID1=l2.ID2 and l2.ID1=l1.ID2 and l1.ID1=h1.ID and l1.ID2=h2.ID and h1.name<h2.name;
4) select name, grade from Highschooler
where ID not in (
  select ID1 from Highschooler H1, Friend, Highschooler H2
  where H1.ID = Friend.ID1 and Friend.ID2 = H2.ID and H1.grade <> H2.grade)
order by grade, name;
5) select name, grade 
from (select ID2, count(ID2) as numLiked from Likes group by ID2), Highschooler
where numLiked>1 and ID2=ID;