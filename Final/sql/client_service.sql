#Test case for client_service

#Create
Use healthcare;
INSERT INTO 
	client_service(client_id_client,service_service_id)
VALUES
	(6,1),
    (6,5),
    (7,5),
    (8,3),
	(10,1),
    (10,2),
    (10,4),
    (10,5);
    
  
#Read
SELECT * from client_service;

#Update
UPDATE client_service
SET service_service_id = 2
WHERE client_id_client = 8;

#Delete
DELETE from client_service
WHERE client_id_client = 6 AND service_service_id = 5 ;
