use MER4;
SELECT client.Nom, client.Cognom, Vendedor.Nom, Polissa.Num_polissa, tipus_polissa.nom
FROM client, Vendedor, Polissa, tipus_polissa
WHERE client.DNI = Polissa.client_DNI and Vendedor.DNI = Polissa.venedor_DNI and 
	tipus_polissa.ID_tipus_polissa = Polissa.tipus_polissa_id;