USE smallMovies;
DROP DATABASE smallMovies;
CREATE DATABASE smallMovies;
USE smallMovies;

CREATE TABLE movies (
  movie_id 		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title 		char(40) NOT NULL,
  release_year 	year NULL,
  plot 			varchar(2000) NULL,
  budget 		DECIMAL(13,4) NULL
);

CREATE TABLE actors (
  actor_id 		INT NOT NULL AUTO_INCREMENT,
  firstName 	VARCHAR(50) not NULL,
  lastName 		VARCHAR(50) not NULL,
  bio 			VARCHAR(1000) NULL,
  dob 			date NULL,
  PRIMARY KEY (actor_id)
);

CREATE TABLE movies_actors (
  movie_id 		INT NOT NULL,
  actor_id 		INT NOT NULL,
  PRIMARY KEY (movie_id, actor_id),
  foreign key (movie_id) references movies(movie_id),
  foreign key (actor_id) references actors(actor_id)
);

CREATE TABLE genres (
  genre_id 		INT NOT NULL AUTO_INCREMENT,
  genre 		CHAR(20) NULL,
  PRIMARY KEY (genre_id)
);

CREATE TABLE movies_genres (
  movie_id 		INT NOT NULL,
  genre_id 		INT NOT NULL,
  PRIMARY KEY (movie_id, genre_id),
  foreign key (movie_id) references movies(movie_id),
  foreign key (genre_id) references genres(genre_id)
);

CREATE TABLE reviews (
  review_id 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  movie_id 		INT NOT NULL,
  source		varchar(40) NOT NULL,
  rating 		bool not null,
  review 		varchar(2000) not null,
  foreign key (movie_id) references movies(movie_id)
);
