
select distinct(p.name) as nombre_persona, (year(current_date()) - year(p.birthdate)) as edad, m.name
from (casts as c join people as p on c.person_id = p.id) join movies as m on c.movie_id = m.id
where c.movie_id in (select c.movie_id
					from casts as c join jobs as j on c.job_id = j.id
					where j.name = "Actor"
					group by c.movie_id 
					having count(person_id) > 8)
and p.birthdate is not NULL
and p.deathdate is NULL
order by (year(current_date()) - year(p.birthdate)) asc;













