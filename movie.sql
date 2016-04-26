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

9) select Reviewer.name
from Reviewer, Rating
where Rating.rID = Reviewer.rID
group by Rating.rID
Having COUNT(Rating.rID) >= 3;

EXTRA

Find the names of all reviewers who rated Gone with the Wind:

select distinct name
from Reviewer join Rating using (rid)
where mid in (select mid 
              from movie 
              where title = 'Gone with the Wind');


For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars:


select distinct name, title, stars
from Rating join Reviewer using(rID) join Movie using(mID)
where name = director;

Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".)

select name
from Reviewer
union
select title
from Movie
order by name, title;







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

9) select Reviewer.name
from Reviewer, Rating
where Rating.rID = Reviewer.rID
group by Rating.rID
Having COUNT(Rating.rID) >= 3;

EXTRA

Find the names of all reviewers who rated Gone with the Wind:

select distinct name
from Reviewer join Rating using (rid)
where mid in (select mid 
              from movie 
              where title = 'Gone with the Wind');


For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars:


select distinct name, title, stars
from Rating join Reviewer using(rID) join Movie using(mID)
where name = director;

Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".)

select name
from Reviewer
union
select title
from Movie
order by name, title;