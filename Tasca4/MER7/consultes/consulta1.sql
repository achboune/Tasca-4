use MER7;
select Producto.Nom, Producto.Descripcion, Producto.IVA, Producto.Precio_Unidad
from Producto
where Producto.IVA = "10%";