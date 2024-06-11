--1.- Histogram of Tweets 
-- Link = https://datalemur.com/questions/sql-histogram-tweets
SELECT 
number_of_tweets AS tweet_bucket, 
COUNT(user_id) AS users_num 
FROM (
SELECT user_id, COUNT(user_id) as number_of_tweets
FROM tweets
WHERE EXTRACT(YEAR FROM tweet_date) = 2022
GROUP BY user_id 
) AS total_tweets 
GROUP BY number_of_tweets


-- 2.-Data Science Skills [LinkedIn SQL Interview Question]
-- Link = https://datalemur.com/questions/matching-skills
SELECT candidate_id
FROM
(SELECT
candidate_id, COUNT(candidate_id)
FROM candidates
WHERE 
skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY (candidate_id)) as count_of_skills
where count = 3
