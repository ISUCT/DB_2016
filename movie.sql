1. SELECT title FROM Movie WHERE director='Steven Spielberg';
2. SELECT year FROM Movie WHERE mID IN (SELECT mID FROM Rating WHERE stars >=4) ORDER BY year;
3. SELECT title FROM Movie WHERE mID NOT IN (SELECT mID FROM Rating);
4. select name FROM Reviewer WHERE rID IN (SELECT rID FROM Rating WHERE ratingDate is null);
5. select name, title, stars, ratingDate FROM Movie, Reviewer, Rating WHERE Movie.mID=Rating.mID and Reviewer.rID=Rating.rID ORDER BY name, title, stars;
6. select name from Reviewer 
7. select title, max(stars) from Movie natural join Rating group by mID order by title;
8. select title, AVG(stars) arating from movie,Rating where Movie.mID=Rating.mID group by movie.mID order by arating DESC,title;
9. select name from Reviewer where (select count(*) from Rating where Rating.rID = Reviewer.rID) >=3;