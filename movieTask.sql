1) select title 
from Movie
where director = "Steven Spielberg";

2) select distinct year 
from Movie join Rating using(mid)
where stars between 4 and 5
order by year asc;

3) select title
from Movie 
where Movie.mID not in (select mid from Rating);

4) select distinct Reviewer.name
from Rating join Reviewer using(rID)
Where Rating.ratingDate is null;

5) select distinct name, title, stars, ratingDate
from Movie neural join Reviewer neural join Rating
order by name, title, stars;

6) select distinct name, title
from Rating R1 natural join Movie natural join Reviewer
where R1.mID in( select mID as counter from Rating R2 where R2.rID = R1.rID group by R2.mID having count(*) = 2) 
 and (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate) 
  < (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate DESC);

7) select title,max(stars)
from Movie natural join Rating
group by mID
order by title;

8) select title, avg(stars) as average
from Movie
inner join Rating using(mId)
group by mId
order by average desc, title;

9) select name
from Reviewer
where (select count(*) from Rating where Rating.rId = Reviewer.rId) >= 3;