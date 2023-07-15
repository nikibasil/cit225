#Test case for billing

#Create
Use healthcare;
INSERT INTO 
	billing(billing_date, trans_id, amount, diagnosis_dx_id)
VALUES
	('2023-06-20','46795', 90, 8),
    ('2023-06-25','35698', 62.42, 1),
	('2023-04-10','12846', 352.76, 3),
    ('2023-05-15','52174', 425.42, 2),
    ('2023-06-14','32564', 15.25, 4 ),
    ('2023-03-01','95123', 689.36, 2),
    ('2023-06-12','98996', 78.98, 6),
    ('2023-05-16','41203', 987.56, 2);
  
#Read
SELECT * from billing;

#Update
UPDATE billing
SET amount = 90.52
WHERE amount = 90;

#Delete
DELETE from billing
WHERE billing_id = 8;

