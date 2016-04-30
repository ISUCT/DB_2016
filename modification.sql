1. INSERT into Reviewer VALUES(209, 'Roger Ebert');
2. INSERT into Rating (mID) SELECT mID From Movie;
UPDATE Rating SET rID=207, stars=5, ratingDate=null WHERE rID is null;
3. UPDATE Movie SET year=year+25 WHERE mID IN (SELECT mID FROM Rating WHERE stars >=4);
4. DELETE FROM Rating WHERE stars <4 and mID IN (SELECT mID FROM Movie WHERE year BETWEEN 1970 and 2000);