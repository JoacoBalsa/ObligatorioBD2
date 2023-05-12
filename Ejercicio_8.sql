-- Devolver para cada saga, los actores que participaron de todas sus películas. 
select distinct s.name as nombre_saga, p.name as nombre_actor
from sagas as s
join movie_in_saga as mis on s.id = mis.saga_id
join casts as c on mis.movie_id = c.movie_id
join people as p on c.person_id = p.id
join jobs as j on c.job_id = j.id
where j.name = 'Actor' and not exists (select *
									  from movie_in_saga as mis2
									  join casts as c2 on mis2.movie_id = c2.movie_id
									  where mis2.saga_id = mis.saga_id
									  and not exists (select *
														from casts as c3
														where c3.person_id = p.id
														and c3.movie_id = mis2.movie_id));                                                           
                                                            