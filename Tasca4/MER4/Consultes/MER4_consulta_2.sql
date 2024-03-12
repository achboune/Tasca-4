use MER4; 
SELECT Polissa.Num_polissa as "Numero de polissa", tipus_polissa.Nom as "Nom Polissa", 
	client.DNI, client.Nom as "Nom client", client.Cognom as "Cognom del client"
FROM client, Polissa, tipus_polissa
WHERE client. DNI = Polissa.client_DNI and 
	tipus_polissa.ID_tipus_polissa = Polissa.tipus_polissa_id and
    tipus_polissa.Nom = "Oscar";
    