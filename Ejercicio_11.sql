/*Devolver el nombre de todas las mujeres que participaron en una única película en el
año 2015. Se debe retornar además el nombre de la película en la que participaron y el
trabajo que hicieron en la misma.*/
select p.name as Nom_Persona, m.name as Nom_Pelicula, j.name as Nom_Trabajo
from (movies as m join casts as c on m.id = c.movie_id) 
join people as p on c.person_id = p.id
join jobs as j on c.job_id = j.id
where year(m.date) = 2015 and p.gender = 1
group by m.name, p.name, j.name
having count(c.person_id) = 1;