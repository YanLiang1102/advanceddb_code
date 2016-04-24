 --format will be (location,twitter count number)
twitter = LOAD '/home/course/lian9478/HW4-twitter_account.csv' USING PigStorage (',') AS (tid:int,email_address:chararray,phone_number:chararray,user_location:chararray,num_tweets:int);
follower = LOAD '/home/course/lian9478/HW4-follows_account.csv' USING PigStorage (',') AS (followerId:int,subjectId:int);
oldrank = LOAD '/home/course/lian9478/HW4-old_twitter_account_rank.csv' USING PigStorage(',') AS (tid:int,rank:float);
follower1 = GROUP follower BY followerId;
--follower2 will be for each follower what is the total number of its subject
follower2 = FOREACH follower1 GENERATE group, COUNT($1) as totalSubject;
--join the oldrank and follower together
--join1 will have all the rank with all its follower account
join1 = join oldrank by tid, follower by subjectId;
join2 = FOREACH join1 GENERATE $0 as countId,$1 as rank,$2 as followers;
--final1 will have its followers and the follower old count
final1 = join join2 by followers, oldrank by $0;
final2 = FOREACH final1 GENERATE $0,$1,$2,$4;
final3 = join final2 by $2, follower2 by $0;
final4 = order final3 by $0;
final5 = FOREACH final4 GENERATE $0,$2,$3/$5 as dataitem;
final6 = GROUP final5 BY $0;
final7 = FOREACH final6 GENERATE $0,SUM($1.dataitem)*0.85+0.15/213.0 as newrank;
ranktotal = GROUP final7 ALL;
sum = FOREACH ranktotal GENERATE SUM($1.newrank);
--DUMP sum;
--this dump sum should be close to 1 which after test is 0.976
DUMP final7;
--rm the old file
STORE final7 INTO 'HW4-old_twitter_account_rank_task.csv' using PigStorage('\t','-schema');

