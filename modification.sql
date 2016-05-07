1) insert into Reviewer(rID, name) values (209, 'Roger Ebert');

2) insert into Rating
   select R.rID,M.mID,5,NULL from (Select rID from Reviewer where name = 'James Cameron') R,
   (select mID from Movie) M;

3) 

4)
