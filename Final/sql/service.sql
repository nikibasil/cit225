#Test case for service

#Create
Use healthcare;
INSERT INTO 
	service(name, service_dept, service_code)
VALUES
	('Psychotherapy, 45 minutes','IPT', '90834'),
    ('Group psychotherapy','DBT', '90834'),
	('Psychosocial rehabilitation services','CBRS', 'H2017'),
    ('Self-help/peer services','PS', 'H0038'),
    ('Targeted case management','CM', 'T1017'),
    ('Neuropsychological or psychological test ','IPT', '96136'),
    ('Health behavior intervention','IPT', '96158');
  
#Read
SELECT * from service;

#Update
UPDATE service
SET service_dept = 'TEST'
WHERE name LIKE 'Health%';

#Delete
DELETE from service
WHERE substring(service_code,2,1) = '6';

