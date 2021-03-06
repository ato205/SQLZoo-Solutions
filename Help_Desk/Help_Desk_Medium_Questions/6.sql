SELECT 
  Company_name,
  count(*) as cc
FROM Customer cust
JOIN Caller c
ON cust.Company_ref = c.Company_ref
JOIN Issue i
ON i.Caller_id = c.Caller_id
GROUP BY Company_name
HAVING count(*) > 18