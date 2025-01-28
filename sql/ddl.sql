CREATE TABLE actor (
	"name" varchar(255) NOT NULL,
	birth_year int4 NULL,
	death_year int4 NULL,
	actor_id varchar(12) NOT NULL
);

CREATE TABLE criticreview (
	critic_id bigserial NOT NULL,
	publisher varchar(255) NOT NULL,
	review_date date NOT NULL,
	movie_id varchar(12) NOT NULL,
	score varchar(255) NULL,
	"content" varchar(1024) NULL,
	critic_name varchar(255) NULL
);

CREATE TABLE director (
	director_id varchar(12) NOT NULL,
	"name" varchar(255) NOT NULL,
	birth_year int4 NULL,
	death_year int4 NULL
);

CREATE TABLE genre (
	"name" varchar(255) NOT NULL
);

CREATE TABLE hasactedin (
	actor_id varchar(12) NOT NULL,
	movie_id varchar(12) NOT NULL
);

CREATE TABLE hasdirected (
	director_id varchar(12) NOT NULL,
	movie_id varchar(12) NOT NULL
);

CREATE TABLE isofgenre (
	movie_id varchar(12) NOT NULL,
	genre_name varchar(255) NOT NULL
);

CREATE TABLE movie (
	movie_id varchar(12) NOT NULL,
	original_title varchar(255) NOT NULL,
	title varchar(255) NOT NULL,
	"type" varchar(255) NULL,
	description varchar(2048) NULL,
	runtime int4 NULL,
	startyear int4 NULL,
	endyear int4 NULL
);


CREATE TABLE oscaraward (
	year_ceremony int4 NOT NULL,
	category varchar(255) NOT NULL,
	award_name varchar(255) NOT NULL,
	movie_id varchar(12) NULL
);


CREATE TABLE studiohasproduced (
	studio_name varchar(255) NOT NULL,
	movie_id varchar(12) NOT NULL
);

CREATE TABLE userrating (
	rating float8 NOT NULL,
	movie_id varchar(12) NULL,
	rating_id bigserial NOT NULL
);