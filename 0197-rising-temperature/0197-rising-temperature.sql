/* Write your T-SQL query statement below */
SELECT
   w1.id
FROM Weather as w1
    inner join Weather as w2 on w1.recordDate=DATEADD(DAY, 1, w2.recordDate)
WHERE
    w1.temperature > w2.temperature