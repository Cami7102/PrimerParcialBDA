# PrimerParcialBDA
Este repositorio tiene la finalidad de almacenar descripcion e información de una base de datos, diagrama UML y requisitos tecnicos para la instalcion y ejecucion de este. 

## **CINTILLOS PARA MASCOTAS**

### **Descripcion**
Esta base de datos esta diseñada a requerimiento de una convocatorio lanzada por el Gobierno Autonomo Municipal de La Paz donde buscan la adquisición de cintillos de identificación para la campaña de vacunacion antirabica canina, a esta adquisicion se crea esta base de datos como requerimiento de la clase de Base de Datos Avanzada. 
En esta base de datos se detallara toda la informacion importante para la adquisicion de estos cintillos como: informacion de los cintillos, compra, detalle de la compra, solicitudes, detalle de esta solicitud, empleados, proveedores y el inventario. A continuacion se mostrara los atributos de cada uno de forma organizada.

### **Diagrama UML**
El diagrama propopuesto para esta base de datos es la siguiente:
![ProyectoUML drawio](https://github.com/Cami7102/PrimerParcialBDA/assets/80707476/25ee545a-331b-447f-b811-65ce545d4e86)

Explicando un poco la relacion entre las clases: 
- La relación entre "Solicitud" y "DetallesSolicitud" es de 1 a 1.
- La relación entre "DetallesSolicitud" y "Cintillos" es de 1 a muchos (1 a *), lo que significa que un detalle de solicitud está relacionado con varios cintillos.
- La relación entre "Cintillos" y "Compra" es de 1 a 1.
- La relación entre "Compra" y "DetallesCompra" es de 1 a 1.
- La relación entre "DetallesCompra" y "Proveedores" es de 1 a 1.
- La relacion entre "Empleados" e "Inventario" es de 0 a 1 (0..1)

### **Requisistos tecnicos**
PASO #1
Inicialmente necesitamos instalar linux en la pc o laptop con el siguiente comando: 

*wsl --install*

PASO #2
Seguido instalas Debian o Ubuntu con el siguiente comando:

*wsl --install -d Debian*

PASO #3
Instalamos Docker Desktop por el navegador

PASO #4
Por defecto ya viene instalado docker-compose y para verificar escribe el siguiente comando:

*docker-compose -v*

PASO #5
Creamos la carpeta .yml con el nombre de su preferencia (ej. mysql.yml). Adjunto link con tutorial mas preciso.

- https://www.arteco-consulting.com/post/instalar-mysql-con-docker

PASO #6
Levantamos docker compose que en mi caso seria con este comando:

*docker-compose -f /home/ximeguz/PrimerParcialBDA/mysql.yml up*

(revisar bien las rutas para no tener fallos en la ejecucion)

PASO #7
Debemos crear las tablas y añadir la informacion necesaria, para esto debemos crear la carpeta *master-scripts* y dentro el archivo *init.sql* donde incluiremos las tablas y el contenido de estas.

PASO #8
Para realizar la replicacion del master al slave debe seguir los siguientes pasos:

    PASO #8.1
    Crear la carpeta 
    - master.cnf
    - slave.cnf

    PASO #8.2
    En el archivo mysl.yml añadir procedimientos para master y slave.

    PASO #8.3 
    Crear otro archivo para la replicacion (ej. replication.sql) donde llenaremos con permisos para que este sea exitoso.

    PASO #8.4
    Levantamos docker compose nuevamente con este comando:

*docker-compose -f /home/ximeguz/PrimerParcialBDA/mysql.yml up*

Con estos pasos ya tendria tu base de datos lista y con replicacion.

### **Como levantar localmente?**
- Para ejecutar docker-compose:

*docker-compose -f mysql.yml up*

- Para dar de baja docker-compose:

*docker-compose -f mysql.yml down*

- Dentro de Docker Desktop ejecutar el comando siguiente:

*mysql -u root -pcxgs7102*

(Donde cxgs7102 es la contraseña para el master)

- Dentro de mysql ejecutar el siguiente comando para ver si creo la base de datos:

*show databases;*

- Para ver si se replico correctamente ejecutamos los 2 anteriores comandos en la parte de slave y revisamos si esta la base de datos.
