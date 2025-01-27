
/*  Birth year of actors still alive participating in a "Best Picture" Oscar-winning movie */
select name , birth_year
from actor a join hasactedin h on a.actor_id = h.actor_id
	 join movie m on m.movie_id = h.movie_id
	 join oscaraward o on o.movie_id = m.movie_id 
where death_year is null and o.category = 'BEST PICTURE'

/*  Name of genres associated with movies produced by "Paramount Pictures" */
select distinct g."name" 
from genre g join isofgenre i on g."name" = i.genre_name 
	 join movie m on m.movie_id = i.movie_id 
	 join studiohasproduced s on s.movie_id = m.movie_id
where s.studio_name = 'Paramount'

/* Name of actors and critics in movies directed by Christopher Nolan that have been criticized by such critic */
select a.name
from actor a join hasactedin h on a.actor_id = h.actor_id 
	 join movie m on m.movie_id = h.movie_id 
	 join hasdirected h2 on m.movie_id = h2.movie_id 
	 join director d on h2.director_id = d.director_id
where d.name = 'Christopher Nolan'

/* Description of oscar-winning movies with at least one user rating less than 0.5 */
select distinct m.description 
from movie m join oscaraward o on m.movie_id = o.movie_id
	 join userrating u on u.movie_id = m.movie_id
where u.rating <= 0.5

/* Title of horror movies with actors born after the year 1990 with a critic review on rotten tomato */
select distinct m.title
from movie m join isofgenre i on m.movie_id = i.movie_id 
	 join genre g on g."name" = i.genre_name
	 join hasactedin h on h.movie_id = m.movie_id 
	 join actor a on h.actor_id = a.actor_id
	 join criticreview c on c.movie_id = m.movie_id 
where a.birth_year >= 1990 and g."name" = 'Horror'

create table CriticReview (
	critic_id bigserial not null primary key,
	critic_name varchar(255) not null,
	publisher varchar(255) not null,
	content varchar(1024) not null,
	review_date date not null,
	score varchar(255) not null,
	movie_id varchar(12) not null references movie (movie_id)
)

alter table CriticReview drop column critic_name

alter table CriticReview add column critic_name varchar(255)


drop table CriticReview

select * from CriticReview
