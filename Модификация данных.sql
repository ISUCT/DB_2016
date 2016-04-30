1) Insert Into Reviewer 
   values (209, 'Roger Ebert'); 

2) Select rID 
   from Rating join Reviewer using(rID)
   where (name = 'James Cameron' join Rating mID not in (select mID from Rating ));
   