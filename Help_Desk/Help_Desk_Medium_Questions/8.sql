SELECT
  a.Company_name,
  Caller.First_name,
  Caller.Last_name,
  a.nc
FROM
  (
    SELECT Company_name, Contact_id, count(*) AS nc
    FROM Customer cust
    JOIN Caller c
    ON cust.Company_ref = c.Company_ref
    JOIN Issue i
    ON i.Caller_id = c.Caller_id
    GROUP BY Company_name, Contact_id
    Having count(*) < 5
  ) AS a
JOIN Caller
ON Caller.Caller_id = a.Contact_id

