# Write your MySQL query statement below
select distinct a.actor_id, a.director_id
from ActorDirector  as a
join (select distinct actor_id, director_id from ActorDirector group by actor_id, director_id having count(*)>=3) as pair on a.actor_id=pair.actor_id and a.director_id=pair.director_id;