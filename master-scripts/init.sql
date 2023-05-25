CREATE USER 'xime'@'%' IDENTIFIED BY 'cxgs7102';
GRANT REPLICATION SLAVE ON *.* TO 'xime'@'%';
FLUSH PRIVILEGES;
CREATE DATABASE CINTILLOSMASCOTAS;
USE CINTILLOSMASCOTAS;

CREATE TABLE Cintillos (
  IDCintillo INT PRIMARY KEY,
  Color VARCHAR(50),
  Material VARCHAR(50),
  Tamano VARCHAR(50),
  PrecioUnitario DECIMAL(10, 2)
);

CREATE TABLE Proveedores (
  IDProveedor INT PRIMARY KEY,
  NombreProveedor VARCHAR(50),
  Direccion VARCHAR(100),
  Telefono VARCHAR(20),
  CorreoElectronico VARCHAR(50)
);

CREATE TABLE Empleados (
  IDEmpleado INT PRIMARY KEY,
  NombreEmpleado VARCHAR(50),
  Cargo VARCHAR(50),
  Telefono VARCHAR(20),
  CorreoElectronico VARCHAR(50)
);

CREATE TABLE Compra (
  IDCompra INT PRIMARY KEY,
  IDProveedor INT,
  FechaCompra DATE,
  TotalCompra DECIMAL(10, 2),
  FOREIGN KEY (IDProveedor) REFERENCES Proveedores(IDProveedor)
);

CREATE TABLE DetallesCompra (
  IDDetalle INT PRIMARY KEY,
  IDCompra INT,
  IDCintillo INT,
  IDProveedor INT,
  Cantidad INT,
  PrecioUnitario DECIMAL(10, 2),
  FOREIGN KEY (IDCompra) REFERENCES Compra(IDCompra),
  FOREIGN KEY (IDCintillo) REFERENCES Cintillos(IDCintillo),
  FOREIGN KEY (IDProveedor) REFERENCES Proveedores(IDProveedor)
);

CREATE TABLE Solicitud (
  IDSolicitud INT PRIMARY KEY,
  IDEmpleado INT,
  FechaSolicitud DATE,
  Estado VARCHAR(50),
  FOREIGN KEY (IDEmpleado) REFERENCES Empleados(IDEmpleado)
);

CREATE TABLE DetallesSolicitud (
  IDDetalle INT PRIMARY KEY,
  IDSolicitud INT,
  IDCintillo INT,
  Cantidad INT,
  FOREIGN KEY (IDSolicitud) REFERENCES Solicitud(IDSolicitud),
  FOREIGN KEY (IDCintillo) REFERENCES Cintillos(IDCintillo)
);

CREATE TABLE Inventario (
  IDCintillo INT PRIMARY KEY,
  CantidadDisponible INT,
  FOREIGN KEY (IDCintillo) REFERENCES Cintillos(IDCintillo)
);

INSERT INTO Solicitud (IDSolicitud, FechaSolicitud, Estado) VALUES
(1, '2023-05-19', 'Pendiente'),
(2, '2023-05-20', 'En proceso'),
(3, '2023-05-21', 'Completada');

INSERT INTO DetallesSolicitud (IDDetalle, IDSolicitud, Cantidad) VALUES
(1, 1, 10),
(2, 1, 5),
(3, 2, 8);

INSERT INTO Cintillos (IDCintillo, Color, Material, Tamano, PrecioUnitario) VALUES
(1, 'Rojo', 'Nylon', 'Mediano', 10.99),
(2, 'Azul', 'Poliester', 'Grande', 12.99),
(3, 'Verde', 'Algodon', 'Pequeno', 8.99);

INSERT INTO Compra (IDCompra, FechaCompra, TotalCompra) VALUES
(1, '2023-05-22', 50.00),
(2, '2023-05-23', 35.99);

INSERT INTO DetallesCompra (IDDetalle, IDCompra, IDCintillo, Cantidad, PrecioUnitario) VALUES
(1, 1, 1, 5, 10.99),
(2, 1, 2, 3, 12.99),
(3, 2, 3, 10, 8.99);

INSERT INTO Proveedores (IDProveedor, NombreProveedor, Direccion, Telefono, CorreoElectronico) VALUES
(1, 'Proveedor A', 'Calle Principal 123', '123456789', 'proveedora@example.com'),
(2, 'Proveedor B', 'Avenida Central 456', '987654321', 'proveedorb@example.com');

INSERT INTO Empleados (IDEmpleado, NombreEmpleado, Cargo, Telefono, CorreoElectronico) VALUES
(1, 'Empleado A', 'Asistente', '111111111', 'empleadoa@example.com'),
(2, 'Empleado B', 'Analista', '222222222', 'empleadob@example.com');

INSERT INTO Inventario (IDCintillo, CantidadDisponible) VALUES
(1, 20),
(2, 15),
(3, 12);
