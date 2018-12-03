SELECT s.First_name, s.Last_name, i.Call_date
FROM Caller c
JOIN Issue i
ON c.Caller_id = i.Caller_id
JOIN Staff s
ON s.Staff_code = i.Taken_by
WHERE c.First_name = 'Harry'
ORDER BY i.Call_date DESC
LIMIT 1