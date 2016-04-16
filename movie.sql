1. SELECT title FROM Movie
WHERE director="Steven Spielberg";

2. SELECT distinct year
from Movie join Rating using(mID)
where stars between 4 and 5
order by year asc;

3. SELECT title FROM Movie 
where Movie.mID not in (select mID from Rating);

4. SELECT distinct Reviewer.name
FROM Rating join Reviewer using(rID)
WHERE Rating.ratingDate is null;

5. select name, title, stars, ratingDate
from Rating natural join Reviewer natural join Movie
order by name, title, stars;

6. SELECT distinct name, title
From Rating R1  natural join Movie natural join Reviewer
where R1.mID in( select mID as counter from Rating R2 where R2.rID = R1.rID group by R2.mID having count(*) = 2) 
 and (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate) 
  < (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate DESC);

7.select title,max(stars) from Movie, Rating 
where Movie.mID=Rating.mID 
group by Rating.mID order by title;

8.select title, AVG(stars) AS average
from Movie
inner join Rating USING(mId)
group by mId
order by average DESC, title;
9.select name
from Reviewer
where (select count(*) from Rating where Rating.rId = Reviewer.rId) >= 3;