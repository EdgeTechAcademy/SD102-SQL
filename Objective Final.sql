-- #1
SELECT 
    film_id, rental.inventory_id
FROM
    rental
        JOIN
    inventory ON inventory.inventory_id = rental.inventory_id
WHERE
    return_date IS NULL;


-- #2
SELECT * from film where special_features like '%trailers%' and special_features like '%deleted%';

-- #3
select max(length)-min(length)
from film;

-- #4
SELECT a.first_name, a.last_name, count(a.actor_id) as Count
FROM actor 			as a
JOIN film_actor 	as fa	on fa.actor_id	 = a.actor_id
GROUP BY a.actor_id
ORDER BY Count desc
LIMIT 1;

-- #5
select a.first_name, a.last_name, count(a.actor_id) as Count
from actor as a
join film_actor as fa on fa.actor_id = a.actor_id
join film as f on f.film_id = fa.film_id
join film_category as fc on fc.film_id = f.film_id
join category as c on c.category_id = fc.category_id
where c.name = 'Action'
group by a.actor_id
order by Count desc
LIMIT 1;

-- #6
#Kenneth Paltrow and Meryl Gibson
select title, film.film_id 
from film
join film_actor on film_actor.film_id = film.film_id
where film_actor.actor_id = 154
  and film.film_id in
			(select film.film_id 
			from film
			join film_actor on film_actor.film_id = film.film_id
			where film_actor.actor_id = 69) 
order by film.film_id;

-- #7
select c.name, c.population * cl.percentage as Speakers
from world.countrylanguage as cl
join world.country as c on c.code = cl.countryCode
where cl.language = 'French'
order by Speakers desc;


-----------------------------------------
------	hands on final			---------
-----------------------------------------
-- #1 Write a query that will display each customer 
#		and how much they have spent from the Sakila database.
select c.first_name, c.last_name, sum(p.amount) as 'Total Spent'
from payment p
join rental as r on r.rental_id = p.rental_id
join customer as c on r.customer_id = c.customer_id
group by c.customer_id;


#2 Write a query that finds all countries that have a particular language 
#	that accounts for over 50% of the population 
#	but that language is not the official language.  
#	Show the country name from the country table and every column form the countrylanguage table.
select name, cl.*
  from world.countrylanguage as cl
  join world.country as c on cl.countrycode = c.code
 where percentage > 50
   and IsOfficial = 'F';


#3 Write a query that finds the 10 largest districts in terms of total Population.
select District, sum(Population) as pop
from world.city
group by district 
order by pop desc
limit 10;

#4 Write a query that lists all rentals that were kept past the rental duration.  
#	Include the customer name, the movie title, the rental date, the return date, 
#	a calculated field showing the number of days that the customer kept the movie 
#	and then the rental duration from the film table.
select c.first_name, c.last_name, f.title, r.rental_date, r.return_date, f.rental_duration, 
		datediff(r.return_date, r.rental_date) as 'How Long', 
        date_add(r.rental_date, interval f.rental_duration day) as 'Should have been'
from rental as r
JOIN inventory as i ON i.inventory_id = r.inventory_id
JOIN film as f ON f.film_id = i.film_id
JOIN customer as c on c.customer_id = r.customer_id
where datediff(r.return_date, r.rental_date) > f.rental_duration
OR r.return_date is null;
