# 🎬 Sakila SQL Analysis

## 📊 Descripción del Proyecto

Exploración y análisis de datos con SQL utilizando la base de datos Sakila, con enfoque en joins, agregaciones y lógica de consultas.

Este proyecto consiste en la resolución de 64 consultas SQL diseñadas para trabajar diferentes aspectos del análisis de datos sobre una base de datos relacional, simulando escenarios reales de negocio en el ámbito de alquiler de películas.

---

## 🎯 Objetivos

- Consolidar conocimientos fundamentales de SQL  
- Trabajar con estructuras de datos relacionales  
- Aplicar lógica analítica a problemas de negocio  
- Mejorar la claridad, organización y documentación de queries  
- Construir un proyecto presentable en GitHub  

---

## 🛠️ Herramientas Utilizadas

- SQL (PostgreSQL)  
- DBeaver  
- Base de datos Sakila  

---

## 🧠 Proceso de Desarrollo

El desarrollo del proyecto se realizó siguiendo un enfoque práctico de aprendizaje:

- Cada una de las 64 consultas fue creada y ejecutada en **pestañas independientes dentro de DBeaver**, basándose en la metodología mostrada en los vídeos de referencia.  
- Este enfoque permitió centrarse en la resolución individual de cada problema y reforzar la comprensión de los conceptos clave.

Una vez completadas todas las consultas, se llevó a cabo un proceso de consolidación:

- Reunificación manual de las 64 queries en un único archivo SQL  
- Revisión de errores y ajustes de sintaxis  
- Estandarización del formato  
- Organización y numeración de las consultas  
- Mejora de la legibilidad mediante comentarios  

Este proceso refleja un flujo de trabajo real, donde el desarrollo iterativo se transforma en un entregable estructurado y profesional.

---

## 📁 Estructura del Repositorio

```text
sakila-sql-analysis/
│
├── sakila_64_queries_corregido_271026.sql   # Versión final revisada de las 64 consultas
├── README.md                                 # Documentación del proyecto
```

---

## 📌 Conceptos Clave Trabajados

- SELECT, WHERE, ORDER BY  
- Funciones de agregación (COUNT, SUM, AVG, VARIANCE, STDDEV)  
- GROUP BY y HAVING  
- INNER JOIN, LEFT JOIN, CROSS JOIN  
- Subconsultas  
- Funciones de fecha  
- Creación de vistas y tablas temporales  
- Filtrado y transformación de datos  

---

## 🔍 Ejemplos de Análisis

A lo largo del proyecto se han abordado diferentes tipos de análisis, como:

- Identificación de clientes con mayor gasto  
- Análisis de patrones de alquiler  
- Evaluación de duración y clasificación de películas  
- Participación de actores en distintas categorías  
- Disponibilidad de inventario por película  

---

## 🔧 Queries Revisadas

Tras la evaluación inicial se revisaron las siguientes consultas:

- **4:** gestión de valores `NULL` con `COALESCE`
- **8:** conversión correcta de 3 horas a 180 minutos
- **10:** uso de `length` en lugar de `replacement_cost`
- **23:** agrupación por `rental_date`
- **32:** añadido el `;` final
- **44:** añadida la explicación del `CROSS JOIN`
- **50:** filtrado correcto de la categoría `Action`
- **51:** corrección del nombre de la tabla temporal
- **56:** corrección de `actor_id` y del valor `Music`
- **63:** uso correcto de `store_id` desde la tabla `store`
- **64:** ampliación del `GROUP BY`

---

## ⚠️ Notas

- Las consultas fueron inicialmente desarrolladas de forma independiente y posteriormente consolidadas en un único archivo para su evaluación.  
- La versión actual incorpora una revisión posterior del proyecto y las correcciones realizadas tras la evaluación inicial.  
- El objetivo principal del proyecto es demostrar dominio de SQL y lógica de consultas, más que optimización avanzada.  

---

## 🚀 Resultado

Este proyecto demuestra la capacidad de:

- Traducir problemas de negocio a consultas SQL  
- Trabajar con bases de datos relacionales  
- Estructurar y documentar análisis de datos  
- Transformar trabajo iterativo en un entregable claro y profesional  

---

## ✒️ Autor

Proyecto desarrollado por [Angelo Herrera - aherrera180](https://github.com/aherrera180)

---
