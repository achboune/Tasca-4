use MER5;
SELECT client.Nom, Vehicle.marla, tipus_vehicles.Nom, cita.Data, cita.Lloc, client_vehicles.data_darrera_revisio
FROM client, Vehicle, tipus_vehicles, cita, client_vehicles
WHERE client.DNI=client_vehicles.client_DNI1 and
	Vehicle_numero_bastidor=client_vehicles.Vehicle_numero_bastidor and 
	tipus_vehicles.ID=Vehicle.tipus_vehicles_ID and 
    client_vehicles.ID=cita.ID and
	cita.data>"2004-11-18";