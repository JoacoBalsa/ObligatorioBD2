select m.name, (m.budget - m.revenue) as lost
from movies as m
where m.revenue < m.budget
order by lost desc;


