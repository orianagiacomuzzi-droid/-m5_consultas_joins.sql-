# RetailPro — Data Analytics & Business Intelligence Project

## Descripción del Proyecto
RetailPro es una solución integral de análisis de datos comerciales y transaccionales diseñada para monitorear el desempeño de ventas, categorización de productos y comportamiento de compra de clientes. El proyecto abarca desde el modelado relacional y consultas analíticas en SQL hasta la construcción de un modelo semántico en estrella/copo de nieve optimizado para inteligencia de negocios.

---

## Estructura del Repositorio y Ejecución SQL
Para reproducir la base de datos y ejecutar el entorno de análisis de forma consistente, ejecute los scripts en el siguiente orden secuencial:

1. **`01_ddl_tablas.sql`**: Creación de tablas de hechos (`Fact_Ventas`) y dimensiones (`Dim_Clientes`, `Dim_Productos`, `Dim_Categorias`).
2. **`02_insercion_datos.sql`**: Carga de datos históricos y transaccionales.
3. **`03_consultas_analytics.sql`**: Vistas de negocio, resúmenes ejecutivos mensuales, cálculos de ticket promedio y ranking TOP 5 de productos.

---

## Modelo de Datos
El diseño de datos sigue una arquitectura analítica:
* **Tabla de hechos**: `Fact_Ventas` (registra transacciones, cantidades, descuentos y fechas de venta).
* **Dimensiones directas**: `Dim_Clientes`, `Dim_Productos` y `Dim_Fechas` (calendario continuo para inteligencia de tiempo).
* **Dimensión normalizada**: `Dim_Categorias` vinculada a `Dim_Productos` estructurando un esquema en copo de nieve (*Snowflake*).

---

## Tecnologías Utilizadas
* **Motor SQL**: Consultas relacionales, agrupaciones periódicas (`GROUP BY MONTH`), rankings y vistas con agregaciones avanzadas.
* **Power BI & DAX**: Modelado dimensional, gestión de cardinalidad (1 a muchos con filtro único) y medidas de Time Intelligence (`SAMEPERIODLASTYEAR`, `DATEADD`, acumulados YTD).
* **GitHub**: Control de versiones y documentación técnica.

---
*Documentación desarrollada para el proyecto integrador de análisis de datos.*
