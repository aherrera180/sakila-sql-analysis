2. Muestra los nombres de todas las películas con una clasificación por edades de ‘R’

select "title"
from "film"
where "rating"='R';

-- ----------------------------------------
3. Encuentra los nombres de los actores que tengan un “actor_id” entre 30 y 40.

select "first_name","last_name"
from "actor"
where "actor_id" between 30 and 40;

-- ----------------------------------------
4. Obtén las películas cuyo idioma coincide con el idioma original.

SELECT "title"
from "film"
where "language_id" = COALESCE("original_language_id" , "language_id");

-- ----------------------------------------
5. Ordena las películas por duración de forma ascendente.

select  "title"
from "film"
order by "length" ASC;

-- ----------------------------------------
6. Encuentra el nombre y apellido de los actores que tengan ‘Allen’ en su apellido.

select "first_name" as "Nombre","last_name" as "Apellido"
from "actor"
where "last_name"='Allen';

-- ----------------------------------------
7. Encuentra la cantidad total de películas en cada clasificación de la tabla “film” y muestra la clasificación junto con el recuento.

select "rating", COUNT(*) as "TOTAL"
from "film"
group by "rating";

-- ----------------------------------------
8. Encuentra el título de todas las películas que son ‘PG-13’ o tienen una duración mayor a 3 horas en la tabla film.

select "title" as "Titulo"
from "film"
where "rating"='PG-13' or "length">180;

-- ----------------------------------------
9. Encuentra la variabilidad de lo que costaría reemplazar las películas.

select variance("replacement_cost") as "Var_Coste_reemplazar"
from "film";

-- ----------------------------------------
10. Encuentra la mayor y menor duración de una película de nuestra BBDD.

select MAX("length") as "Duracion_Maxima", MIN("length") as "Duracion_Minima"
from "film";

-- ----------------------------------------
11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.

select "amount" as "Coste", "rental_id" as "Renta"
from "payment"
order by "payment_date" desc 
offset 2 limit 1;

-- ----------------------------------------
12. Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC17’ ni ‘G’ en cuanto a su clasificación.

select "title"
from "film"
where "rating" not in ('NC-17' , 'G');

-- ----------------------------------------
13. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.

select AVG("length") as "Promedio", "rating" as "Clasificacion"
from "film"
group by "rating";

-- ----------------------------------------
14. Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.

select "title"
from "film"
where "length">180;

-- ----------------------------------------
15. ¿Cuánto dinero ha generado en total la empresa?

select SUM("amount") as "Total_generado"
from "payment";

-- ----------------------------------------
16. Muestra los 10 clientes con mayor valor de id.

select*
from "customer"
order by "customer_id" DESC
limit 10;

-- ----------------------------------------
17. Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igby’.

select "first_name","last_name"
from "actor" a
join "film_actor" fa on a. "actor_id"=  fa. "actor_id"
join "film" f on fa. "film_id"= f. "film_id"
where f. "title" = 'Egg Igby';

-- ----------------------------------------
18. Selecciona todos los nombres de las películas únicos.

select distinct "title"
from "film" f;

-- ----------------------------------------
19. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla “film”.

SELECT "title"
FROM film f 
join "film_category" a on f. "film_id"  = a. "film_id" 
join "category" b on a. "category_id" = b. "category_id"
where b. "name" = 'Comedy'
and f. "length">180;

-- ----------------------------------------
20. Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.

select c."name" , AVG(f. "length") as "MEDIA DE ALQUILER" 
from "category" c
join "film_category" fc on c. category_id = fc. "category_id"
join "film" f on fc. "film_id" = f."film_id"
group by c. "name"
having AVG(f. "length") > 110;

-- ----------------------------------------
21. ¿Cuál es la media de duración del alquiler de las películas?

select AVG("rental_duration") as  "MEDIA de duracion del alq "
from "film";

-- ----------------------------------------
22. Crea una columna con el nombre y apellidos de todos los actores y actrices.

select CONCAT("first_name", ' ', "last_name") as  "FULL_NAME"
from "actor";

-- ----------------------------------------
23. Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.

select DATE("rental_date"), count(*) as "Cantidad de alq"
from "rental"
group by DATE("rental_date")
Order by "Cantidad de alq" DESC;

-- ----------------------------------------
24. Encuentra las películas con una duración superior al promedio.

select "title"
from "film"
where "length" > (select  AVG("length") from "film");

-- ----------------------------------------
25. Averigua el número de alquileres registrados por mes.

SELECT DATE_TRUNC('month', "rental_date") AS "month",
       COUNT(*)
FROM "rental"
GROUP BY "month";

-- ----------------------------------------
26. Encuentra el promedio, la desviación estándar y varianza del total pagado.

select AVG("amount"), stddev("amount"), variance("amount")
from "payment";

-- ----------------------------------------
27. ¿Qué películas se alquilan por encima del precio medio?

select "title"
from "film"
where "rental_rate" > (select AVG("rental_rate") from "film");

-- ----------------------------------------
28. Muestra el id de los actores que hayan participado en más de 40 películas.

select "actor_id"
from "film_actor" 
group by "actor_id"
having COUNT(*) > 40;

-- ----------------------------------------
29. Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.

select f. "title", count(i. "inventory_id") as "stock"
from "film" f
left join "inventory" i on f. "film_id" = i. "film_id"
group by f. "title";

-- ----------------------------------------
30. Obtener los actores y el número de películas en las que ha actuado.

select "first_name", "last_name", count("film_id")
from "actor" a
left join "film_actor" fa on a. "actor_id" = fa. "actor_id"
group by a. "actor_id";

-- ----------------------------------------
31. Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.

select f. "title", a."first_name", a. "last_name"
from "film" f
left join "film_actor" fa on f. "film_id" = fa. "film_id" 
left join "actor" a on fa. "actor_id" = a. "actor_id";

-- ----------------------------------------
32. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.

select f. "title", a. "first_name", a. "last_name"
from "actor" a
left join "film_actor" fa on a. "actor_id" = fa. "actor_id"
left join "film" f on fa. "film_id" = f. "film_id";


-- ----------------------------------------
33. Obtener todas las películas que tenemos y todos los registros de alquiler

select "title", "rental_id"
from "film"  f
left join "inventory" i on f. "film_id" = i. "film_id"
left join "rental" r on i. "inventory_id" = r. "inventory_id";

-- ----------------------------------------
34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.

select c. "first_name", c. "last_name", SUM(p. "amount") as "Total"
from "customer" c
join "payment" p on c. "customer_id" = p. "customer_id"
group by c. "customer_id"
order by "Total" DESC
limit 5;

-- ----------------------------------------
35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.

select "first_name"
from actor
where "first_name" = 'Johnny';

-- ----------------------------------------
36. Renombra la columna “first_name” como Nombre y “last_name” como Apellido.

select "first_name" as "Nombre", "last_name" as "Apellido"
from  "actor";

-- ----------------------------------------
37. Encuentra el ID del actor más bajo y más alto en la tabla actor.

select MIN("actor_id") as "Id_actor_mas_bajo", MAX("actor_id") as "Id_actor_mas_alto"
from "actor";

-- ----------------------------------------
38. Cuenta cuántos actores hay en la tabla “actor”.

select count(*) as "Nº_Total_actores"
from "actor";

-- ---------------------------------------- 
39. Selecciona todos los actores y ordénalos por apellido en orden ascendente. 

select *
from "actor"
order by "last_name" asc;

-- ---------------------------------------- 
40. Selecciona las primeras 5 películas de la tabla “film”.

select *
from "film"
limit 5;

-- ---------------------------------------- 
41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?

select "first_name", count(*) as "Total"
from "actor" 
group by "first_name"
order  by "Total" desc;

-- ---------------------------------------- 
42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron.

select r. "rental_id", a. "first_name", a. "last_name"
from "rental" r
join "customer" a on r. "customer_id" = a. "customer_id"; 

-- ---------------------------------------- 
43. Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres.

select r. "rental_id", a. "first_name", a. "last_name"
from "customer" a
left join "rental" r on a. "customer_id" = r. "customer_id"; 

-- ---------------------------------------- 
44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor  esta consulta? ¿Por qué? Deja después de la consulta la contestación. 

select *
from "film" f
cross join "category" c;

-- La consulta genera todas las combinaciones entre peliculas-film y categorías-catergory. Sola no aporta mucho valor pues no usa una relación entre ambas tablas
--
-- ---------------------------------------- 
45. Encuentra los actores que han participado en películas de la categoría 'Action'.

select a. "first_name", a. "last_name"
from "actor" a
join "film_actor" fa on a. "actor_id" = fa. "actor_id"
join "film_category" fc on fa."film_id" = fc. "film_id"
join "category" c on fc. "category_id" = c. "category_id"
where c. "name" = 'Action';

-- ---------------------------------------- 
46. Encuentra todos los actores que no han participado en películas.

select "first_name", "last_name"
from "actor" a
left join "film_actor"  fa on a. "actor_id" = fa. "actor_id"
where fa. "actor_id" is null; 

-- ---------------------------------------- 
47. Selecciona el nombre de los actores y la cantidad de películas en las que han participado.

select a. "first_name", a. "last_name", count(fa. "film_id") as "Total_films"
from "actor" a
join "film_actor" fa on a."actor_id" = fa. "actor_id"
group by a. "actor_id";

-- ---------------------------------------- 
48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres de los actores y el número de películas en las que han participado.

create view "actor_num_peliculas" as
select a. "first_name", a. "last_name", count(fa. "film_id") as "Total_films"
from "actor" a
join "film_actor" fa on a."actor_id" = fa. "actor_id"
group by a. "actor_id"; 

-- ---------------------------------------- 
49. Calcula el número total de alquileres realizados por cada cliente.

select "customer_id", count(*) 
from "rental"
group by "customer_id";

-- ---------------------------------------- 
50. Calcula la duración total de las películas en la categoría 'Action'.

select SUM(f. "length") as "Duracion_total"
from "film" f
join "film_category" fc on f. "film_id" = fc. "film_id"
join "category" c on fc. "category_id" = c. "category_id"
where c. "name" = 'Action';

-- ---------------------------------------- 
51. Crea una tabla temporal llamada “cliente_rentas_temporal” para almacenar el total de alquileres por cliente.

create temp table "cliente_rentas_temporal" as
select "customer_id" as "cliente", count(*) as "Total"
from "rental" 
group by "customer_id";

-- ---------------------------------------- 
52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las películas que han sido alquiladas al menos 10 veces.

create temp table "peliculas_alquiladas" as
select f. "title", count(*) as "Total"
from "film" f 
join "inventory" i on f. "film_id" = i. "film_id"
join "rental" r on i. "inventory_id" = r. "inventory_id"
group by f. "title"
having count (*) >= 10;

-- ---------------------------------------- 
53. Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sanders’ y que aún no se han devuelto. Ordena los resultados alfabéticamente por título de película.

select f. "title"
from "film" f
join "inventory" i on f. "film_id" = i. "film_id"
join "rental" r on i. "inventory_id" = r. "inventory_id"
join "customer" c on r. "customer_id" = c. "customer_id"
where c."first_name" = 'Tammy'
     AND c. "last_name" = 'Sanders' 
     and  r. "return_date" is null
order by f. "title" asc;

-- ---------------------------------------- 
54. Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría ‘Sci-Fi’. Ordena los resultados alfabéticamente por apellido.

select a."first_name", a. "last_name"
from "actor" a
join "film_actor" fa on a. "actor_id" = fa. "actor_id"
join  "film" f on fa. "film_id" = f. "film_id"
join "film_category" fc on f. "film_id"= fc. "film_id"
join "category" c on fc. "category_id" = c. "category_id"
where c. "name"  = 'Sci-Fi'
order by a. "last_name" asc;

-- ---------------------------------------- 
55. Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaper’ se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.

select a. "first_name", a. "last_name"
from "actor" a
join "film_actor" fa on a. "actor_id" = fa. "actor_id"
join "inventory" i on fa. "film_id" = i. "film_id"
join "rental" r on i. "inventory_id" = r. "inventory_id"
where r. "rental_date" >
(
    select MIN(r2.rental_date)
    FROM "rental" r2
    JOIN "inventory" i2 ON r2."inventory_id" = i2."inventory_id"
    JOIN "film" f2 ON i2."film_id" = f2."film_id"
    WHERE f2."title" = 'Spartacus Cheaper'
)
ORDER BY a."last_name" ASC;

-- ---------------------------------------- 
56. Encuentra el nombre y apellido de los actores que NO han actuado en ninguna película de la categoría ‘Music’.

select a. "first_name", a. "last_name"
from "actor" a
where a. "actor_id" not in 
(
select fa."actor_id"
from "film_actor" fa
join "film_category" fc on fa. "film_id" = fc. "film_id"
join "category" c on fc. "category_id" = c. "category_id" 
where c. "name" = 'Music'
);

-- ---------------------------------------- 
57. Encuentra el título de todas las películas que fueron alquiladas por más de 8 días.

select distinct f. "title"
from "film" f
join "inventory" i on f. "film_id" =  i. "film_id"
join "rental" r on i. "inventory_id" = r. "inventory_id" 
where (r."return_date" - r. "rental_date") > interval '8 days';

-- ---------------------------------------- 
58. Encuentra el título de todas las películas que son de la misma categoría que ‘Animation’.

select f. "title"
from "film" f
join "film_category" fc on f. "film_id" = fc. "film_id"
join "category" c on  fc. "category_id" = c. "category_id"
where c. "name" = 'Animation';

-- ---------------------------------------- 
59. Encuentra los nombres de las películas que tienen la misma duración que la película con el título ‘Dancing Fever’. Ordena los resultados alfabéticamente por título de película.

select "title"
from "film" 
where "length" = 
( 
select "length"
from "film"
where "title" = 'Dancing Fever'
) 
order by "title" ASC;

-- ---------------------------------------- 
60. Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas. Ordena los resultados alfabéticamente por apellido.

select c. "first_name", c. "last_name"
from "customer" c
join "rental" r on c. "customer_id" = r. "customer_id"
join "inventory" i on r. "inventory_id" = i. "inventory_id"
group by c."customer_id"
having count(distinct i. "film_id") >= 7
order by c. "last_name" asc;

-- ---------------------------------------- 
61. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

select c. "name", count(*) as "Total_alq"
from "category" c
join film_category fc on c. "category_id" = fc. "category_id"
join "inventory" i on fc."film_id" = i. "film_id"
join "rental" r on i. "inventory_id" = r. "inventory_id"
group by c. "name";

-- ---------------------------------------- 
62. Encuentra el número de películas por categoría estrenadas en 2006.

select c. "name", count(*) as "Total"
from "category" c
join "film_category" fc on c. "category_id" = fc. "category_id"
join "film" f on fc. "film_id" = f. "film_id"
where f. "release_year" = 2006
group by c. "name"; 

-- ---------------------------------------- 
63. Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.

select s. "staff_id" as "Employee", st. "store_id" as "Store"
from "staff" s
cross join "store" st;

-- ----------------------------------------
64. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

select c. "first_name", c. "last_name", c. "customer_id", count(r. rental_id) as "Total_alq"
from "customer" c
join "rental" r on c. "customer_id" = r. "customer_id"
group by c. "customer_id" , c."first_name" , c. "last_name";

-- ----------------------------------------
