USE MER7;
Select count(Linea_ticket.ID)
from Linea_ticket, Ticket, Empleado
where Ticket.Num = Linea_ticket.Ticket_Num and Empleado.ID = Ticket.Empleado_ID and Empleado.Nom like "21";