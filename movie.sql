1. SELECT title FROM Movie WHERE director='Steven Spielberg';
2. SELECT year FROM Movie WHERE mID IN (SELECT mID FROM Rating WHERE stars >=4) ORDER BY year;
3. SELECT title FROM Movie WHERE mID NOT IN (SELECT mID FROM Rating);
4. SELECT name FROM Reviewer WHERE rID IN (SELECT rID FROM Rating WHERE ratingDate is null);
5. SELECT name, title, stars, ratingDate FROM Movie, Reviewer, Rating WHERE Movie.mID=Rating.mID and Reviewer.rID=Rating.rID ORDER BY name, title, stars;
6. 