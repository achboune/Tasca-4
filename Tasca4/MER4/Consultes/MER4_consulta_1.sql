use MER4;
SELECT client, Nom client, as "Nom_client", client.Cognom as "Cognom_del_client"
FROM client Polissa 
WHERE client.DNI = Polissa.client_DNI and client.Nom="Leiner";