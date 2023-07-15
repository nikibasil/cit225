#Test case for insurance

#Create
Use healthcare;
INSERT INTO 
	insurance(ins_name, ins_code)
VALUES
	('Blue Cross','BC'),
    ('Molina','MOL'),
	('Noridian','Nor'),
    ('Optum','OPT'),
    ('Health & Welfare','HW'),
    ('Pacifica','PF'),
    ('Regence','RG');
   
#Read
SELECT * from insurance;

#Update
UPDATE insurance
SET ins_code = 'NOR'
WHERE ins_name LIKE 'N%';

#Delete
DELETE from insurance
WHERE ins_code = 'PF';