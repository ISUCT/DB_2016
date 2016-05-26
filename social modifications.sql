1) delete from Highschooler
where grade =12;


2) delete from likes
where id1 in (select likes.id1 
from friend join likes using (id1) 
where friend.id2 = likes.id2) 
and not id2 in (select likes.id1 
from friend join likes using (id1) 
where friend.id2 = likes.id2);

3) insert into friend
select f1.id1, f2.id2
from friend f1 join friend f2 on f1.id2 = f2.id1
where f1.id1 <> f2.id2
except
select * from friend;