USE MER7;
select Ticket.Num_Factura, Ticket.Data, Empleado.Nom, Empleado.Cognom
from Ticket, Empleado, Linea_ticket, Producto
where Producto.ID = Linea_ticket.Producto_ID and Ticket.Num = Linea_ticket.Ticket_Num and Empleado.ID = Ticket.Empleado_ID and Producto.Nom = "manzana";