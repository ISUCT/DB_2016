1) Select title from Movie
WHERE director="Steven Spielberg";


2) Select distinct year
from Movie join Rating using(mID)
where stars between 4 and 5
order by year asc;


3) Select title
from Movie
where Movie.mID not in (select mID from Rating);


4) Select distinct Reviewer.name
from Rating join Reviewer using(rID)
where Rating.ratingDate is null;

5) Select distinct name, title, stars, ratingDate
from Rating netural join Reviewer netural join Movie
order by name, title, stars;

6) Select distinct name, title
from Rating R1 natural join Movie natural join Reviewer
where R1.mID in( select mID as counter from Rating R2 where R2.rID = R1.rID group by R2.mID having count(*) = 2) 
 and (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate) 
  < (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate DESC);

7) Select title,max(stars) from Movie, Rating 
where Movie.mID=Rating.mID 
group by Rating.mID order by title; 

8) Select title, avg(stars) arating from Movie,Rating
where Movie.mID=Rating.mID
group by Movie.mID
order by arating DESC, title;

9) Select name
from Reviewer, ( select rID, count(stars) as count
from Rating
group by rID ) RateCount
where Reviewer.rID = RateCount.rID
and RateCount.count >= 3;



EXTRA


1) select distinct name
from Reviewer join Rating using(rID)
where rID in (
select rID
from Rating join Movie using(mID)
where title = "Gone with the Wind");

2) select distinct name, title, stars
from Reviewer join Rating  using(rID) 
join Movie using(mID)
where name ="director";

3) select name
from Reviewer
union
select title
from Movie
order by name, title;

4) select title
from Movie
where mID not in (select mID
from Rating
where rID in (select rID
from Reviewer
where name = "Chris Jackson") );















