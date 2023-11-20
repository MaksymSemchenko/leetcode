/* Write your T-SQL query statement below */
SELECT DISTINCT
    s.student_id
    ,s.student_name
    ,sub.subject_name
    ,count(e.student_id) over (partition by s.student_id, e.subject_name) as 'attended_exams'
FROM Students as s
    cross join Subjects as sub
    left join Examinations as e on e.student_id=s.student_id and e.subject_name=sub.subject_name