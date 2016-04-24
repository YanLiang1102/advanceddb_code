--the result will be the record that right at that percentile
--format:[{twitter_accountid1,email_address,account_rank1)}]
-- I am using the 20th pagerank result from task 3 as my input
oldrank = LOAD 'out/pagerank_data_20' USING PigStorage(',') AS (tid:int,rank:float);
twitter = LOAD '/home/course/lian9478/HW4-twitter_account.csv' USING PigStorage (',') AS (tid:int,email_address:chararray,phone_number:chararray,user_location:chararray,num_tweets:int);
--order by rank
ordered = order oldrank by rank;
--you can change 0.3 to the other percentite you want
top = limit ordered (int)(213*0.999);
--intermediate = group top by $1;
--intermediate1 = order intermediate by group;
--intermediate2 = foreach intermediate1 generate group,$1 as values;
final = join top by tid, twitter by tid;
--projection, has accountid, email and rank 
final1 = foreach final generate $0, $3, $1;
final2 = group final1 by $2;
orderedfinal2 = order final2 by group desc;
final3 = limit orderedfinal2 1;
final = foreach final3 generate $1;
DUMP final;
