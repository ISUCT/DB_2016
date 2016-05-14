1) insert into Reviewer
   values (209, 'Roger Ebert');
2) insert into Rating  
  select Rating.rID , Movie.mID, 5 as stars, null as ratingDate
  from Rating,Movie, Reviewer
   where Rating.rID = Reviewer.rID
   and Reviewer.name = 'James Cameron' ;
 

3)update Movie set year=year+25 where
  mID in (select mID from (select Rating.mID,avg(stars) as average  
  from Movie, Rating where Movie.mID=Rating.mID 
  group by Rating.mID, year) where average>=4);

4) delete from rating
where mID in (select mID from movie where year <1970 or year > 2000)
and stars < 4;
