insert into movies (title, release_year, plot, budget)
values
('Star Wars', 1976, 'light sabres', 40000000),
('Whats Up Doc?', 1973, 'zanniness ensues', 6000000),
('Casablanca', 1942, 'boy meets girl', 1000000),
('Plan 9 From Outer Space', 1952, 'space zombies', 400000),
('Dr. Strangelove', 1962, 'insanity of war', 1000000),
('2001: A Space Odessey', 1972, 'Who knows', 3000000),
('The Thin Man', 1941, 'Who done it', 400000),
('The Right Stuff', 1983, 'How we got into space', 4000000),
('The Good the Bad and the Ugly', 1984, 'cowboys and guns', 7000000);

insert into actors (firstName, lastName)
values
('Clint', 'Eastwood'),
('Peter', 'Sellers'),
('Jennifer', 'Lawrence'),
('William', 'Devane'),
('William H', 'Masey'),
('Julia', 'Roberts'),
('Elsa', 'Lanchester');

insert into movies_actors (movie_id, actor_id)
values
(1,3),(1,5),(1,7),(2,1),(2,2),(2,3),(3,3),(3,4),
(3,5),(4,3),(5,7),(6,7),(7,7),(8,1);

insert into genres (name)
values             ();

select m.title, a.firstName, a.lastName
from movies as m
join movies_actors as ma ON ma.movie_id = m.movie_id
join actors as a         ON a.actor_id = ma.actor_id
order by 1;

insert into movies_genres (movie_id, genre_id)
values             ();

insert into reviews (movie_id, source, rating, review)
values             ();
