IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Ventas_Tech_DB')
BEGIN
    CREATE DATABASE Ventas_Tech_DB;
END
GO

USE Ventas_Tech_DB;

DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Categorias;

CREATE TABLE Categorias (
    Id_categoria INT PRIMARY KEY,
    Nombre_categoria VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(200)
);

CREATE TABLE Clientes (
    Id_cliente INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Ciudad VARCHAR(50),
    Fecha_registro DATE NOT NULL
);

CREATE TABLE Productos (
    Id_producto INT PRIMARY KEY,
    Nombre_producto VARCHAR(100) NOT NULL,
    Id_categoria INT,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    Activo TINYINT DEFAULT 1,
      FOREIGN KEY (Id_categoria) REFERENCES Categorias(Id_categoria)
);

CREATE TABLE Ventas (
    Id_venta INT PRIMARY KEY,
    Id_cliente INT NOT NULL,
    Id_producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_unitario DECIMAL(10,2) NOT NULL,
    Fecha_venta DATE NOT NULL,
    FOREIGN KEY (Id_cliente) REFERENCES Clientes(Id_cliente),
    FOREIGN KEY (Id_producto) REFERENCES Productos(Id_producto)
);

INSERT INTO Categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO Categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO Categorias VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO Categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');


INSERT INTO Clientes VALUES (1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO Clientes VALUES (2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO Clientes VALUES (3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO Clientes VALUES (4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO Clientes VALUES (5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');


INSERT INTO Productos VALUES (1, 'Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO Productos VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO Productos VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO Productos VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO Productos VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO Productos VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);


INSERT INTO Ventas VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO Ventas VALUES (2,  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO Ventas VALUES (3,  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO Ventas VALUES (4,  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO Ventas VALUES (5,  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO Ventas VALUES (6,  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO Ventas VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO Ventas VALUES (8,  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO Ventas VALUES (9,  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO Ventas VALUES (10, 5, 3, 2,  450.00, '2024-03-15');


SELECT * FROM Categorias;
SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Ventas;