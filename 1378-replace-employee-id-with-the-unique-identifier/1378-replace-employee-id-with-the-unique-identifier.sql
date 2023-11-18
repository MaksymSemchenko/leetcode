/* Write your T-SQL query statement below */
SELECT
    eu.unique_id
    ,e.name
FROM Employees as e
    left join EmployeeUNI as eu on eu.id=e.id