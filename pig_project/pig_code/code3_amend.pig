--the result will be (num_tweets, reputation)
--and you can change the num_tweets as whatever you want
twitter = LOAD '/home/course/lian9478/HW4-twitter_account.csv' USING PigStorage (',') AS (tid:int,email_address:chararray,phone_number:chararray,user_location:chararray,num_tweets:int);
stack = LOAD '/home/course/lian9478/HW4-stack_overflow_account.csv' USING PigStorage(',') AS (email_address:chararray, reputation:int, num_questions:int);
twitter1 = FILTER twitter BY (num_tweets>=950);
join1 = join twitter1 by email_address, stack by email_address;
final1 = FOREACH join1 GENERATE num_tweets,reputation;
final2 = group final1 by $0;
final = FOREACH final2 {
         sum = SUM(final1.reputation);
         count = COUNT(final1);
         generate group as num_tweets, sum/count as avg_reputation;
          };
DUMP final;
STORE final INTO 'result33-amend';

