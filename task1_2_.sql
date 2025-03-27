CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;

SELECT DISTINCT id_region FROM Task;


WITH user_spend AS(
SELECT id_user, id_region, SUM(amount) AS tc
FROM Task
GROUP BY id_user, id_region  
),
 avrg_spend_region AS(
	SELECT id_region, AVG(tc) AS ars
	FROM user_spend
	GROUP BY id_region
	
)
SELECT us.id_user, us.id_region, us.tc
FROM user_spend us
JOIN avrg_spend_region asr ON us.id_region = asr.id_region
WHERE us.tc > asr.ars
ORDER BY id_user;


