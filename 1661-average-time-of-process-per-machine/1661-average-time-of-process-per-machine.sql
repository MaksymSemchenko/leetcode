/* Write your T-SQL query statement below */
with pivot_col as (
    SELECT 
        machine_id
        ,process_id
        ,[start]
        ,[end]
    FROM (
            SELECT
            machine_id 
            ,process_id 
            ,activity_type
            ,[timestamp]
            FROM Activity
        ) as a
    PIVOT (max([timestamp]) FOR activity_type IN ([start] ,[end])) as p
)

SELECT DISTINCT
    machine_id 
    ,round(avg([end] - [start]) over(partition by machine_id), 3) as 'processing_time'
FROM pivot_col
ORDER BY machine_id