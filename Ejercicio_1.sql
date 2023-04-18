select m.name, m.runtime, m.vote_average, YEAR(m.date) as year
from movies as m
where m.date >= '2011-01-01' and m.date < now()
order by YEAR(m.date) asc;


