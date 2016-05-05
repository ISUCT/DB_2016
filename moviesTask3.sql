1) Insert Into Reviewer 
   values (209, 'Roger Ebert'); 

2) insert into Rating 
   select rID, mID, 5, Movie, NULL 
   (select rID 
   from Reviewer 
   where name='James Cameron');

3) select title, aStars 
   from Movie,(Select mID, avg(stars) as aStars from Rating group by mID) as R 
   where Movie.mID = R.mID 
   order by aStars desc, title; 