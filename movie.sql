1) SELECT title FROM Movie WHERE Director = "Steven Spielberg";

2) SELECT distinct year FROM Movie join Rating using (mID) where stars between 4 and 5 order by year asc;

3) SELECT title FROM Movie WHERE mID not in (SELECT mID from Rating);

4) SELECT name FROM Reviewer WHERE rID in (SELECT rID FROM Rating WHERE ratingDate is null);

5) SELECT distinct name, title, stars, ratingDate FROM Rating natural join Reviewer natural join Movie order by name, title, stars; 

6) SELECT distinct name, title 
   FROM Rating R1 natural join Movie natural join Reviewer 
   WHERE R1.mID in( select mID as counter from Rating R2 where R2.rID = R1.rID group by R2.mID having count(*) = 2) 
   and (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate) 
   < (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate DESC);

7) SELECT title,max(stars) from Movie, Rating 
   WHERE Movie.mID=Rating.mID 
   group by Rating.mID order by title; 

8) SELECT title, avg(stars) arating from Movie,Rating
   where Movie.mID=Rating.mID
   group by Movie.mID
   order by arating DESC, title;

9) select name
   from Reviewer
   where (select count(*) from Rating where Rating.rId = Reviewer.rId) >= 3;