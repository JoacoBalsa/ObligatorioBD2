select distinct s.name as nombre_saga, g.name as nombre_genero, g.id as id_genero 
from (movie_in_saga as mis natural join movie_genres as mg) 
join sagas as s on mis.saga_id = s.id
join genres as g on mg.genre_id = g.id;




