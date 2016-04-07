1) Select title from Movie
   where director = "Steven Spielberg";

2) Select distinct year
  from Movie join Rating using(mid)
Where stars between 4 and 5
order by year asc;
  
3) Select title
from Movie
Where Movie.mID not in (select mid from Rating);

 4) Select distinct Reviewer.name
from Rating join Reviewer using(rID)
Where Rating.ratingDate is null;


5) Select distinct name, title, stars, ratingDate
from Rating neural join Reviewer neural join Movie
order by name, title, stars;



6)select DISTINCT name, title
from Rating R1 natural join Movie natural join Reviewer
where R1.mID in( select mID as counter from Rating R2 where R2.rID = R1.rID group by R2.mID having count(*) = 2) 
  and (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate) 
  < (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate DESC);
 


7)select title,max(stars)
from Movie natural join Rating
group by mID
order by title;


8)select title, AVG(stars) arating  from Movie,Rating 
Where Movie.mID=Rating.mID
group by Movie.mID
order by arating DESC, title;