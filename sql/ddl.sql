CREATE TABLE actor (
	"name" varchar(255) NOT NULL,
	birth_year int4 NULL,
	death_year int4 NULL,
	actor_id varchar(12) NOT NULL,
	CONSTRAINT actor_pkey PRIMARY KEY (actor_id)
);

CREATE TABLE director (
	director_id varchar(12) NOT NULL,
	"name" varchar(255) NOT NULL,
	birth_year int4 NULL,
	death_year int4 NULL,
	CONSTRAINT director_pkey PRIMARY KEY (director_id)
);

CREATE TABLE genre (
	"name" varchar(255) NOT NULL,
	CONSTRAINT genre_pkey PRIMARY KEY (name)
);

CREATE TABLE movie (
	movie_id varchar(12) NOT NULL,
	original_title varchar(255) NOT NULL,
	title varchar(255) NOT NULL,
	"type" varchar(255) NULL,
	description varchar(2048) NULL,
	runtime int4 NULL,
	startyear int4 NULL,
	endyear int4 NULL,
	CONSTRAINT movie_pkey PRIMARY KEY (movie_id)
);

CREATE TABLE criticreview (
	critic_id bigserial NOT NULL,
	publisher varchar(255) NOT NULL,
	review_date date NOT NULL,
	movie_id varchar(12) NOT NULL,
	score varchar(255) NULL,
	"content" varchar(1024) NULL,
	critic_name varchar(255) NULL,
	CONSTRAINT criticreview_pkey PRIMARY KEY (critic_id),
	CONSTRAINT criticreview_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE hasactedin (
	actor_id varchar(12) NOT NULL,
	movie_id varchar(12) NOT NULL,
	CONSTRAINT hasactedin_pkey PRIMARY KEY (actor_id, movie_id),
	CONSTRAINT hasactedin_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
	CONSTRAINT hasactedin_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE hasdirected (
	director_id varchar(12) NOT NULL,
	movie_id varchar(12) NOT NULL,
	CONSTRAINT hasdirected_pkey PRIMARY KEY (director_id, movie_id),
	CONSTRAINT hasdirected_director_id_fkey FOREIGN KEY (director_id) REFERENCES director(director_id),
	CONSTRAINT hasdirected_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE isofgenre (
	movie_id varchar(12) NOT NULL,
	genre_name varchar(255) NOT NULL,
	CONSTRAINT isofgenre_pkey PRIMARY KEY (movie_id, genre_name),
	CONSTRAINT isofgenre_genre_name_fkey FOREIGN KEY (genre_name) REFERENCES genre("name"),
	CONSTRAINT isofgenre_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE oscaraward (
	year_ceremony int4 NOT NULL,
	category varchar(255) NOT NULL,
	award_name varchar(255) NOT NULL,
	movie_id varchar(12) NULL,
	CONSTRAINT oscaraward_pkey PRIMARY KEY (year_ceremony, category),
	CONSTRAINT oscaraward_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE studiohasproduced (
	studio_name varchar(255) NOT NULL,
	movie_id varchar(12) NOT NULL,
	CONSTRAINT studiohasproduced_pkey PRIMARY KEY (studio_name, movie_id),
	CONSTRAINT studiohasproduced_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE userrating (
	rating float8 NOT NULL,
	movie_id varchar(12) NULL,
	rating_id bigserial NOT NULL,
	CONSTRAINT userrating_pkey PRIMARY KEY (rating_id),
	CONSTRAINT userrating_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);