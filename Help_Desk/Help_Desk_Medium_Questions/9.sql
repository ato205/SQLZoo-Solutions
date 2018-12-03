SELECT a.Shift_date, a.Shift_type, count(DISTINCT Staff) AS cw
FROM 
  (
    SELECT Shift_date, Shift_type, Manager AS Staff FROM Shift
    UNION ALL
    SELECT Shift_date, Shift_type, Operator AS Staff FROM Shift
    UNION ALL
    SELECT Shift_date, Shift_type, Engineer1 AS Staff FROM Shift
    UNION ALL
    SELECT Shift_date, Shift_type, Engineer2 AS Staff FROM Shift
  ) AS a
GROUP BY Shift_date, Shift_type