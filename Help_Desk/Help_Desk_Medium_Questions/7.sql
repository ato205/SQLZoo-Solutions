SELECT First_name, Last_name
FROM 
  (
    SELECT c.First_name, c.Last_name, i.Call_ref
    FROM Caller c
    LEFT JOIN Issue i
    ON c.Caller_id = i.Caller_id
  ) AS a
WHERE a.Call_ref IS NULL
