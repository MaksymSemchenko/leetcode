/* Write your T-SQL query statement below */
SELECT
    s.user_id
    ,round(
            avg(case 
            when c.action = 'confirmed' then 1.0
            else 0
            end
                )
        , 2) as 'confirmation_rate'
FROM Signups as s
    left join Confirmations as c on c.user_id=s.user_id
GROUP BY
    s.user_id