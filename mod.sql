1) delete from Highschooler
where grade =12;


2) delete from Likes where id1 in (select Likes.id1  from Friend join likes using (id1)  where friend.id2 = likes.id2)  and not id2 in (select likes.id1  from Friend join likes using (id1)  where Friend.id2 = Likes.id2);

3) insert into Friend
select f1.id1, f2.id2
from Friend f1 join Friend f2 on f1.id2 = f2.id1
where f1.id1 <> f2.id2
except
select * from Friend;