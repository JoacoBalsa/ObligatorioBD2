select s.id as id_saga, s.name as nombre_saga, sum(m.runtime) as duracion
from (sagas as s join movie_in_saga as mis on s.id = mis.saga_id) join movies as m on mis.movie_id = m.id
group by s.id
order by duracion desc
;