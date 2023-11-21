/* Write your T-SQL query statement below */
with specialist as (
SELECT
    managerId
    ,count(id) as 'employees'
FROM Employee
WHERE
    managerId is not null
GROUP BY
    managerId
)

SELECT
    e.[name]
FROM Employee as e
    left join specialist as s on s.managerId=e.id
WHERE
    s.employees >= 5