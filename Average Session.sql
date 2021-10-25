SELECT t1.user_id,
        AVG(t2.exit-t1.load)
FROM (SELECT user_id, timestamp :: date as date, MAX(timestamp) as load
        FROM facebook_web_log WHERE action = 'page_load' GROUP BY 1,2) t1
JOIN (SELECT user_id, timestamp :: date as date, MIN(timestamp) as exit
        FROM facebook_web_log WHERE action = 'page_exit' GROUP BY 1,2) t2
ON t1.user_id = t2.user_id AND t1.date = t2.date AND t1.load < t2.exit
GROUP BY 1
