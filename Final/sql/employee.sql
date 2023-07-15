#Test case for employee

#Create
Use healthcare;
INSERT INTO 
	employee(first_name, last_name, initial, dept_dept_id)
VALUES
	('David','Roberts', 'DR', 3),
    ('Nancy','Wheel', 'NW', 3),
	('Victoria','Booker', 'VB', 3),
    ('Maria','Galleger', 'MG', 2),
    ('Amy','Coulson', 'AC', 2 ),
    ('Kim','Halson', 'KH', 5),
    ('Dan','Herald', 'DH', 4),
    ('Sunny','Smith', 'SS', 4);
 
#Read
SELECT * from employee;

#Update
UPDATE employee
SET last_name = 'Colter'
WHERE first_name LIKE 'Amy';

#Delete
DELETE from employee
WHERE employee_id = 7;

