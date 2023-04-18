select g.name as Nombre_Genero, count(mg.movie_id) as Cant_Peliculas
from genres as g join movie_genres as mg on g.id = mg.genre_id
group by g.name
having count(mg.movie_id) >= all (select count(mg.movie_id)
                                  from genres as g join movie_genres as mg on g.id = mg.genre_id
                                  group by g.name
                                  having count(mg.movie_id));