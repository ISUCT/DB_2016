1. SELECT title FROM Movie WHERE director='Steven Spielberg';
2. SELECT year FROM Movie WHERE mID IN (SELECT mID FROM Rating WHERE stars >=4) ORDER BY year;
3. SELECT title FROM Movie WHERE mID NOT IN (SELECT mID FROM Rating);
4. SELECT name FROM Reviewer WHERE rID IN (SELECT rID FROM Rating WHERE ratingDate is null);
5. SELECT name, title, stars, ratingDate FROM Movie, Reviewer, Rating WHERE Movie.mID=Rating.mID and Reviewer.rID=Rating.rID ORDER BY name, title, stars;
6. SELECT distinct name, title from Rating R1 natural join Movie natural join Reviewer where R1.mID in( select mID as counter from Rating R2 where R2.rID = R1.rID group by R2.mID having count(*) = 2) and (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate) < (select stars from Rating R3 where R3.rID = R1.rID and R1.mID = R3.mID order by R3.ratingDate DESC);
7. SELECT title, max(stars) from Movie natural join Rating group by mID order by title;
8. SELECT title, AVG(stars) arating  from Movie,Rating  Where Movie.mID=Rating.mID  group by Movie.mID  order by arating DESC, title;
9. SELECT name  from Reviewer  where (select count(*) from Rating where Rating.rId = Reviewer.rId) >= 3;