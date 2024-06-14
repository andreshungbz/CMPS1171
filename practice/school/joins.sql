-- An INNER JOIN returns a row if the row matches in all the tables
SELECT S.student_id, S.first_name, S.last_name, G.student_id, G.grade
FROM students AS S 
INNER JOIN grades AS G 
ON S.student_id = G.student_id;

-- An LEFT OUTER JOIN determines what is in the first table but 
-- not in the second table
SELECT S.student_id, S.first_name, S.last_name, G.student_id, G.grade
FROM students AS S 
LEFT OUTER JOIN grades AS G 
ON S.student_id = G.student_id
WHERE G.student_id IS NULL;

-- An RIGHT OUTER JOIN determines what is in the second table but 
-- not in the first table
SELECT S.student_id, S.first_name, S.last_name, G.student_id, G.grade
FROM students AS S 
RIGHT OUTER JOIN grades AS G 
ON S.student_id = G.student_id
WHERE S.student_id IS NULL;

-- An FULL OUTER JOIN determines what is in the second table but 
-- not in the first table and vice versa
SELECT S.student_id, S.first_name, S.last_name, G.student_id, G.grade
FROM students AS S 
FULL OUTER JOIN grades AS G 
ON S.student_id = G.student_id
WHERE S.student_id IS NULL OR G.student_id IS NULL;


