/*Para cada película (devolver su nombre), devolver la edad de la persona más joven
que participó en la misma y el nombre del trabajo que realizó.*/
select m.name as Nom_Pelicula, (year(m.date) - year(p.birthdate)) as Edad_Persona, j.name as Nom_Trabajo
from (movies as m join casts as c on m.id = c.movie_id) 
join people as p on c.person_id = p.id
join jobs as j on c.job_id = j.id
where (year(m.date) - year(p.birthdate)) <= all (select (year(m.date) - year(p.birthdate))
													from (movies as m1 join casts as c on m1.id = c.movie_id) 
                                                    join people as p on c.person_id = p.id
                                                    where m1.id = m.id)
order by (year(m.date) - year(p.birthdate)) asc;
