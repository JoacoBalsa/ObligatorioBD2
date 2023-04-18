SELECT m.id as ID_Pelicula, m.name as Nombre_Pelicula,s.name as Nombre_Saga, m.date as Fecha
FROM (movies as m join movie_in_saga as mis on mis.movie_id = m.id)
join sagas as s on s.id = mis.saga_id
ORDER BY Nombre_Saga, Fecha;




