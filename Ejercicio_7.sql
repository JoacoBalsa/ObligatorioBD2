/*Devolver todos los tipos de referencias entre películas de una saga.*/
select s.name as Nom_Saga, m1.name as Referencia, m2.name as Referenciado, mr.type as Tipo_Referencia
from ((movie_in_saga as mis1 join movie_references as mr on mis1.movie_id = mr.reference_to)
join movie_in_saga as mis2 on mr.referenced_by = mis2.movie_id and mis1.saga_id = mis2.saga_id)
join sagas as s on s.id = mis2.saga_id
join movies as m1 on mis1.movie_id = m1.id
join movies as m2 on mis2.movie_id = m2.id
;
