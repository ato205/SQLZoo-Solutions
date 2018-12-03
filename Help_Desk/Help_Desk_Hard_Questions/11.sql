SELECT 
  Manager,
  a.date_hour AS Hr,
  count(*) AS cc
FROM
  (SELECT 
    DATE_FORMAT(Call_date, '%Y-%m-%d %H') AS date_hour, 
    DATE_FORMAT(Call_date, '%Y-%m-%d') AS date,
    DATE_FORMAT(Call_date, '%H') AS hour
  FROM Issue
  WHERE Call_date LIKE '2017-08-12%') AS a
JOIN Shift s
ON s.Shift_date = a.date
WHERE 
  s.Shift_type ='Early' AND a.hour <= 13
  OR s.Shift_type = 'Late' AND a.hour > 13
GROUP BY Manager, a.date_hour
ORDER BY a.date_hour