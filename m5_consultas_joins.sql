-- Consulta 1 — Vista base del proyecto (INNER JOIN)

use Ventas_Tech_DB;

Select V.Fecha_venta,C.Id_cliente,C.Nombre AS Nombre_cliente,C.Ciudad,P.Id_producto,P.Nombre_producto,CAT.Nombre_categoria, 
V.Cantidad, V.Precio_unitario, (V.Cantidad * V.Precio_unitario) AS Total_venta
FROM Ventas V 
INNER JOIN Clientes C
ON V.Id_cliente=C.Id_cliente
INNER JOIN Productos P 
ON V.Id_producto=P.Id_producto
INNER JOIN Categorias CAT
ON P.Id_categoria=CAT.Id_categoria;

-- Consulta 2 - Clientes sin ventas (LEFT JOIN)

Select C.Nombre, C.Fecha_registro, C.Email
From Clientes C
LEFT JOIN Ventas V 
ON C.Id_cliente=V.Id_cliente
WHERE V.Id_venta IS NULL;

-- Consulta 3 — Productos sin ventas (LEFT JOIN)

Select P.Nombre_producto, P.Id_categoria, P.Precio
From Productos P
LEFT JOIN Ventas V
ON P.Id_producto= V.Id_producto
Where V.Id_venta IS NULL;

-- Consulta 4 — Consolidado por canal (UNION ALL)

SELECT canal, SUM(total) AS total_general
FROM (
       SELECT 
        Fecha_venta AS fecha,
        (Cantidad * Precio_unitario) AS total,
        'Online' AS canal
    FROM ventas
    WHERE Fecha_venta <= '2024-03-10'

 UNION ALL
 SELECT 
        Fecha_venta AS fecha,
        (Cantidad * Precio_unitario) AS total,
        'Presencial' AS canal
    FROM ventas
    WHERE Fecha_venta > '2024-03-10'
) AS subconsulta
GROUP BY canal;