use MER6;
select Reservas.Data, Reservas.Importe, Vuelo.Num_Vuelo, Pasajeros.Nom, Pasajeros.Cognom
from Reservas, Vuelo, Pasajeros
where Reservas.Pasajeros_ID = Pasajeros_ID and Reservas.Vuelo_ID = Vuelo_ID and Vuelo.Data_Salida = "2006-11-22";