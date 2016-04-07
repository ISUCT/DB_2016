/*Q1
 select title
from Movie
where  director = 'Steven Spielberg';

/*Q2
select distinct year 
from Movie inner join Rating using(mid)
where stars between 4 and 5
order by year asc;

/*Q3
select title
from Movie
where Movie.mID not in (select mid from Rating);

/*Q4
select distinct Reviewer.name
from Rating join Reviewer using(rID)
Where Rating.ratingDate is null;

/*Q5
select name, title, stars, ratingDate
from Rating natural join Reviewer natural join Movie
order by name, title, stars;

/*Q6 
select distinct name, title
from Rating R1 natural join Movie natural join Reviewer
where R1.mID in( select mID as counter from Rating R2 where R2.rID = R1.rID group by R2.mID having count(*) = 2) 
 and (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate) 
  < (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate DESC);

/*Q7
select title,max(stars) from Movie, Rating 
where Movie.mID=Rating.mID 
group by Rating.mID order by title;