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
  < (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate desc);

/*Q7
select title,max(stars) from Movie, Rating 
where Movie.mID=Rating.mID 
group by Rating.mID order by title;

/*Q8 
select title, avg(stars) as average
from Movie
inner join Rating using(mId)
group by mId
order by average desc, title;

/*Q9
select name
from Reviewer
where (select count(*) from Rating where Rating.rId = Reviewer.rId) >= 3;

Challenge 

select title, max(stars)-min(stars) as spread
from Movie natural join Rating
group by mID
order by spread desc, title;

select max(a1)-min(a1) from
(select avg(av1) a1 from
(select avg(stars) av1 from rating r join movie m on r.mid=m.mid where m.year < 1980
group by r.mid)
union
select avg(av2) a1 from
(select avg(stars) av2 from rating r join movie m on r.mid=m.mid where m.year > 1980
group by r.mid));

select title, director 
from movie 
where director in (select director 
                  from (select director, count(title) as s 
                        from movie 
                        group by director) as t
                  where t.s>1)
order by 2,1; 