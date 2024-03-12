USE MER6;
SELECT Pasajeros.DNI, Pasajeros.Nom, Pasajeros.Cognom, Vuelo.Num_Vuelo, Vuelo.Origen, Vuelo.Destino, Reservas.Importe
FROM Pasajeros, Vuelo, Reservas
WHERE Pasajeros.ID = Reservas.Pasajeros_ID AND Vuelo.ID = Reservas.Vuelo_ID;