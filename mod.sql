/*Q1
insert into Reviewer(rID, name) values (209, 'Roger Ebert');

/*Q2
insert into Rating  ( rID, mID, stars, ratingDate )
select Reviewer.rID , Movie.mID, 5, null from Movie
left outer join Reviewer
where Reviewer.name='James Cameron';

/*Q3
update movie
set year = year + 25
where mID in (
  select mID from (
  select AVG(stars) as astar, mID from Rating
  where mID=rating.mID
  group by mID
  having astar >=4));

/*Q4
delete from rating
where mID in (select mID from movie where year <1970 or year > 2000)
and stars < 4; 
