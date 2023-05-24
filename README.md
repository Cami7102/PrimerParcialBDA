# PrimerParcialBDA
Este repositorio tiene la finalidad de almacenar descripcion e información de una base de datos, diagrama UML y requisitos tecnicos para la instalcion y ejecucion de este. 

## CINTILLOS PARA MASCOTAS

### Descripcion
Esta base de datos esta diseñada a requerimiento de una convocatorio lanzada por el Gobierno Autonomo Municipal de La Paz donde buscan la adquisición de cintillos de identificación para la campaña de vacunacion antirabica canina, a esta adquisicion se crea esta base de datos como requerimiento de la clase de Base de Datos Avanzada. 
En esta base de datos se detallara toda la informacion importante para la adquisicion de estos cintillos como: informacion de los cintillos, compra, detalle de la compra, solicitudes, detalle de esta solicitud, empleados, proveedores y el inventario. A continuacion se mostrara los atributos de cada uno de forma organizada.

### Diagrama UML
El diagrama propopuesto para esta base de datos es la siguiente:
![ProyectoUML drawio](https://github.com/Cami7102/PrimerParcialBDA/assets/80707476/25ee545a-331b-447f-b811-65ce545d4e86)

Explicando un poco la relacion entre las clases: 
- La relación entre "Solicitud" y "DetallesSolicitud" es de 1 a 1.
- La relación entre "DetallesSolicitud" y "Cintillos" es de 1 a muchos (1 a *), lo que significa que un detalle de solicitud está relacionado con varios cintillos.
- La relación entre "Cintillos" y "Compra" es de 1 a 1.
- La relación entre "Compra" y "DetallesCompra" es de 1 a 1.
- La relación entre "DetallesCompra" y "Proveedores" es de 1 a 1.
- La relacion entre "Empleados" e "Inventario" es de 0 a 1 (0..1)

### Requisistos tecnicos

### Como levantar localmente?
