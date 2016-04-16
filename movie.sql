1) SELECT title FROM Movie
WHERE director="Steven Spielberg";


2) SELECT distinct year
from Movie join Rating using(mID)
where stars between 4 and 5
order by year asc;


3) SELECT title
from Movie
where Movie.mID not in (select mID from Rating);


4) Select distinct Reviewer.name
from Rating join Reviewer using(rID)
where Rating.ratingDate is null;

5) Select distinct name, title, stars, ratingDate
from Rating neural join Reviewer neural join Movie
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