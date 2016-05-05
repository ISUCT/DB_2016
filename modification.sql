1) insert into Reviewer
   Values (209, "Roger Ebert");

2) insert into Rating
   select rID, mID, 5, NULL from (select rID from Reviewer where name="James Cameron"), Movie;

3) update movie
   set year = year + 25
   where mID in (
  select mID from (
  select AVG(stars) as astar, mID from Rating
  where mID=rating.mID
  group by mID
  having astar >=4));
 

4) delete from rating
   where mID in (select mID from movie where year <1970 or year > 2000)
   and stars < 4;