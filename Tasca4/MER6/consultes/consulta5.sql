use MER6;
select Reservas.Data, Reservas.Importe, Vuelo.Num_Vuelo, Pasajeros.Nom, Pasajeros.Cognom
from Reservas, Vuelo, Pasajeros
where Reservas.ID = Reservas.Pasajeros_ID and Vuelo.ID = Reservas.Vuelo_ID and Pasajeros.Nom = "leiner";