1) delete from Highschooler
where grade =12;


2) delete from likes
where id1 in (select likes.id1 
from friend join likes using (id1) 
where friend.id2 = likes.id2) 
and not id2 in (select likes.id1 
from friend join likes using (id1) 
where friend.id2 = likes.id2);