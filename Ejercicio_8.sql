-- Devolver para cada saga, los actores que participaron de todas sus películas. 
select distinct s.name, p.name 
from sagas as s join movie_in_saga as mis on s.id = mis.saga_id
natural join casts as c
join people as p on p.id = c.person_id
join jobs as j on j.id = c.job_id
where j.name = "Actor" and not exists (select p.id
                                            from sagas as s join movie_in_saga as mis on s.id = mis.saga_id
                                            natural join casts as c
                                            join people as p on p.id = c.person_id
                                            join jobs as j on j.id = c.job_id
                                            where j.name = "Actor" and mis.movie_id not in (select mis.movie_id
                                                                                            from movie_in_saga as mis join sagas as s on s.id = mis.saga_id, casts as c
                                                                                            where c.movie_id <> mis.movie_id));

-- Opcion incompleta
select p.name, s.name
from ((((casts as c join jobs as j on c.job_id = j.id) join movie_in_saga as mis on c.movie_id = mis.movie_id)
join people as p on c.person_id = p.id) join sagas as s on mis.saga_id = s.id)
where j.name = "Actor" and c.person_id not in (select c1.person_id
													from (casts as c1 join jobs as j on c1.job_id = j.id) 
                                                    join movie_in_saga as mis on c1.movie_id = mis.movie_id
                                                    where j.name = "Actor" and c1.movie_id not in (select c2.movie_id 
																									from casts as c2 natural join movie_in_saga));
 -- Ejemplo saga James Bond
select distinct s.name, p.name
from sagas as s join movie_in_saga as mis on s.id = mis.saga_id
natural join casts as c
join people as p on p.id = c.person_id
join jobs as j on j.id = c.job_id
where j.name = "Actor" and s.name = "James Bond - 007";

-- Peliculas saga Star Wars
select m.name
from (movie_in_saga as mis join movies as m on mis.movie_id = m.id) join sagas as s on s.id = mis.saga_id
where s.name = "Star Wars";

-- Peliculas saga Star Wars donde aparece Mark Hamill
select m.name
from ((movie_in_saga as mis join movies as m on mis.movie_id = m.id) join sagas as s on s.id = mis.saga_id)
join casts as c on c.movie_id = m.id
join people as p on p.id = c.person_id
where s.name = "Star Wars" and p.name = "Mark Hamill";