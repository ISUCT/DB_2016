1) Insert Into Reviewer 
   values (209, 'Roger Ebert'); 

2) insert into Rating
   select R.rID, M.mID, 5, null from (select rID from Reviewer where name = 'James Cameron') R, (select mID from Movie) M;

3) update Movie
   set year = year + 25
   select * from 
   (select mID, avg(stars) as ST from Rating group by mID) 
   where ST>=4 ;
   
4) delete from rating
   where mID in (select mID from movie where year <1970 or year > 2000) and stars < 4; 