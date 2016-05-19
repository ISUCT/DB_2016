1) insert into Reviewer(rID, name) 
   values (209, 'Roger Ebert');

2) insert into Rating
   select R.rID,M.mID,5,NULL 
   from (Select rID from Reviewer where name = 'James Cameron') R,
   (select mID from Movie) M;

3) update Movie
   set year = year + 25
   where mID in (
   select Movie.mId
   from Movie, Rating
   where Movie.mID = Rating.mID
   group by Movie.mID
   having avg(stars) >= 4);

4) delete from Rating
   where mID in (
   select distinct Rating.mID
   from Movie, Rating
   where Movie.mID = Rating.mID
   and (Movie.year > 2000 or Movie.year < 1970)
   and stars < 4;
