/*Devolver todos los tipos de referencias entre películas de una saga.*/
select s.name, mr.type
from ((movie_in_saga as mis1 join movie_references as mr on mis1.movie_id = mr.reference_to)
join movie_in_saga as mis2 on mr.referenced_by = mis2.movie_id and mis1.saga_id = mis2.saga_id)
join sagas as s on s.id = mis2.saga_id
;

/*Pelicula referencia a pelicula */
select m1.name, m2.name, mr.type
from (movie_references as mr join movies as m1 on mr.reference_to = m1.id) join movies as m2 on mr.referenced_by = m2.id
where m2.id in (select movie_id
				from movie_in_saga)
and m1.id in (select movie_id
				from movie_in_saga)
;

/*Todas las referencias*/
select m1.name as referencia, m2.name as referenciado, mr.type
from (movie_references as mr join movies as m1 on mr.reference_to = m1.id) join movies as m2 on mr.referenced_by = m2.id