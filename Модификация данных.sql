1) Insert Into Reviewer 
   values (209, 'Roger Ebert'); 

2) insert into Rating
   select R.rID,M.mID,5,NULL from (Select rID from Reviewer where name = 'James Cameron') R,
   (select mID from Movie) M;

3) Update Movie set year=year+25 where mID IN (SELECT mID FROM Rating WHERE stars >=4);

4) Delete from Rating where mID in
   (select Movie.mID from Rating, Movie where Rating.mID=Movie.mID and stars <4 and (year <1970 or year >2000));
