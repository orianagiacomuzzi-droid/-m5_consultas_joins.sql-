USE Ventas_Tech_DB;

-- Consulta 1 — Resumen ejecutivo mensual
SELECT 
    MONTH(Fecha_venta) AS mes,
    SUM(Cantidad * Precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(Cantidad * Precio_unitario) AS ticket_promedio
FROM Ventas
GROUP BY MONTH(Fecha_venta)
ORDER BY mes;

-- Consulta 2 — Ranking de productos
SELECT TOP 5
    Id_producto,
    SUM(Cantidad) AS unidades_vendidas,
    SUM(Cantidad * Precio_unitario) AS total_facturado
FROM Ventas
GROUP BY Id_producto
ORDER BY total_facturado DESC;

-- Consulta 3 — Clientes activos
SELECT 
    Id_cliente,
    COUNT(*) AS total_pedidos,
    SUM(Cantidad * Precio_unitario) AS total_gastado
FROM Ventas
GROUP BY Id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;

-- Consulta 4 — Meses por encima/por debajo del promedio
SELECT 
    MONTH(Fecha_venta) AS mes,
    SUM(Cantidad * Precio_unitario) AS total_facturado,
    CASE 
        WHEN SUM(Cantidad * Precio_unitario) >= (
            SELECT AVG(total_mes)
            FROM (
                SELECT SUM(Cantidad * Precio_unitario) AS total_mes
                FROM Ventas
                GROUP BY MONTH(Fecha_venta)
            ) AS SubconsultaTotales
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS estado_vs_promedio
FROM Ventas
GROUP BY MONTH(Fecha_venta)
ORDER BY mes;

-- Hallazgos documentados 
-- 1. El Id_producto 1 lidera las ventas con $3.600,00 facturados en 3 unidades, representando el 55,87% del total de ingresos 
--    del período ($6.444,00). 
-- 2. El 100% de los clientes analizados (Ids 1 al 5) son recurrentes con 2 pedidos cada uno. Sin embargo, los clientes 1 y 5 
--    acumulan $4.740,00, concentrando el 73,55% de toda la facturación. 
-- 3. Todas las ventas registradas corresponden al mes de marzo (mes 3), registrando un promedio de $644,40 por transacción. 