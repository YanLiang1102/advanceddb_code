--change 807 to whatever areacode you want
--the format should look like:(k,{(email1),(email2)})
twitter = LOAD '/home/course/lian9478/HW4-twitter_account.csv' USING PigStorage (',') AS (tid:int,email_address:chararray,phone_number:chararray,user_location:chararray,num_tweets:int);
twitter1 = FOREACH twitter GENERATE SUBSTRING(phone_number,0,3) AS areacode ,email_address;
twitter2 = GROUP twitter1 by areacode;
twitter3 = FOREACH twitter2 GENERATE group as areacode,$1.email_address;
twitter4 = FILTER twitter3 BY (areacode  == '405');
DUMP twitter4;
STORE  twitter4 INTO 'result13';

