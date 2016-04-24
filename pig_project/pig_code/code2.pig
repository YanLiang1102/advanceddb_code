--format will be (location,twitter count number)
twitter = LOAD '/home/course/lian9478/HW4-twitter_account.csv' USING PigStorage (',') AS (tid:int,email_address:chararray,phone_number:chararray,user_location:chararray,num_tweets:int);
twitter1 = GROUP twitter by user_location;
twitter2 = FOREACH twitter1 GENERATE group ,COUNT($1);
DUMP twitter2;
STORE twitter2 INTO 'result2';
