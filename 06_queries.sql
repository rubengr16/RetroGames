USE PracABD1;

-- a. Obtener el correo de un cliente a partir de su nombre y apellidos. Realiza las pruebas
-- concretamente Ángeles del Nido, que es la clienta que están buscando en este
-- momento.
SELECT DISTINCT(Email)
FROM Clientes
WHERE Nombre = 'Ángeles' AND Apellidos = 'del Nido';

-- b. Obtener el número de clientes de una determinada provincia. Realiza las pruebas
-- con Lugo, que es la provincia en la que están valorando abrir mercado.
SELECT COUNT(*)
FROM Clientes
WHERE Provincia = 'Lugo';

-- c. Obtener un listado que contenga el nombre completo y el correo electrónico de los
-- clientes que hayan contactado mediante un determinado canal en cierto periodo de
-- tiempo. Realiza las pruebas concretamente con el canal web y el periodo 2019, que
-- se corresponde con los clientes a los que se les pretende ofrecer un descuento
-- especial.
SELECT Nombre, Apellidos, Email
FROM Clientes
WHERE Canal = '4' AND
	FechaContacto BETWEEN '2019/01/01' AND '2019/12/31';

-- d. Obtener un listado de clientes que contenga su nombre completo y el título del
-- videojuego o videojuegos que han alquilado durante los años 2019 y 2020, así como
-- la fecha concreta en la que han alquilado cada juego. El listado debe estar ordenado
-- por apellidos y contener solo clientes que sean de una determinada provincia.
-- Realiza las pruebas con los clientes de Madrid, que es el mercado que se está
-- analizando.
-- e. Realiza dos consultas que pienses que puedan ser de interés para la empresa y con
-- las que puedas extraer alguna conclusión de interés relativa al uso de los índices.