#Test case for dept

#Create
Use healthcare;
INSERT INTO 
	dept(dept_name)
VALUES
	('office'),
    ('community'),
	('counselor'),
    ('partial care'),
    ('peer support'),
    ('adult day care');
  
#Read
SELECT * from dept;

#Update
UPDATE dept
SET dept_name = 'targeted care'
WHERE dept_id = 6;

#Delete
DELETE from dept
WHERE dept_id = 6;