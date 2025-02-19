
/*  Name of actors born in 1962 or 1963 participating in a "Best Picture" Oscar-winning movie,
 * criticized by the Independent (UK) publisher */
select distinct a."name"
from actor a, hasactedin h, movie m, oscaraward o, criticreview c
where a.actor_id = h.actor_id
	 and h.movie_id = m.movie_id 
	 and m.movie_id = o.movie_id 
	 and m.movie_id = c.movie_id 
	 and (birth_year = 1962 or birth_year = 1963)
	 and o.category = 'BEST PICTURE' 
	 and c.publisher = 'Independent (UK)'

/*  Name of movies of genre Drama produced by "Paramount Pictures" where Cillian Murphy acted  */
select m.title
from genre g, isofgenre i, movie m, hasactedin h, studiohasproduced s, actor a
where g."name" = i.genre_name 
	 and i.movie_id = m.movie_id 
	 and m.movie_id = s.movie_id 
	 and i.movie_id = h.movie_id 
	 and h.actor_id = a.actor_id 
	 and s.studio_name = 'Paramount'
	 and a."name" = 'Cillian Murphy'
	 and g."name" = 'Drama'

/* Name of critics that have criticized a movie directed by Cristopher Nolan where Al Pacino acted */
select c.critic_name 
from actor a, hasactedin h, movie m, hasdirected h2, criticreview c, director d
where a.actor_id = h.actor_id 
	 and h.movie_id = m.movie_id 
	 and m.movie_id = h2.movie_id
	 and h2.director_id = d.director_id 
	 and m.movie_id = c.movie_id
	 and d.name = 'Christopher Nolan' 
	 and a."name" = 'Al Pacino'

/* Name of directors and movie titles of oscar-winning movies in the DIRECTING category, produced by Warner Bros,
 *  with at least one user rating of 0.5*/
select distinct d."name", m.title
from movie m, oscaraward o, studiohasproduced s, userrating u, hasdirected h, director d
where m.movie_id = o.movie_id 
	 and m.movie_id = u.movie_id 
	 and s.movie_id = m.movie_id 
	 and h.movie_id = m.movie_id 
	 and h.director_id = d.director_id 
	 and u.rating = 0.5 
	 and s.studio_name = 'Warner Bros. Pictures' 
	 and o.category = 'DIRECTING'

/* Title of horror movies and name of actors participating, born in the year 2000,
 * with a critic review on rotten tomato and a tension score of 0 */
select distinct m.original_title, a."name"
from movie m, genre g, isofgenre i, criticreview c, hasactedin h, actor a, energyscore e 
where m.movie_id = i.movie_id
	 and g."name" = i.genre_name 
	 and h.movie_id = m.movie_id 
	 and h.actor_id = a.actor_id 
	 and c.movie_id = m.movie_id
	 and e.movie_id = m.movie_id 
	 and a.birth_year = 2000 
	 and g."name" = 'Horror'
	 and e.tension = 0