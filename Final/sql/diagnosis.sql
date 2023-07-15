#Test case for diagnosis

#Create
Use healthcare;
INSERT INTO 
	diagnosis(dx_code,dx_name)
VALUES
	('F33.0','Recurrent depressive disorder'),
    ('F41.1','Generalized anxiety disorder'),
	('F25.0','Schizoaffective disorder, bipolar type'),
    ('F31.81','Bipolar II disorder'),
    ('F43.20','Adjustment disorder, unspecified'),
    ('40.10', 'Social phobia, unspecified'),
    ('300.2', 'Generalized anxiety disorder'),
    ('F90.2', 'Attention-deficit hyperactivity disorder');

#Read
SELECT * from diagnosis;

#Update
UPDATE diagnosis
SET dx_code = 'F40'
WHERE dx_name = 'Social phobia, unspecified';

#Delete
DELETE from diagnosis
WHERE dx_code NOT RLIKE '^[[:alpha:]]';
