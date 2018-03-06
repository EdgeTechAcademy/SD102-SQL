SELECT	HeadOfState, count(name) as Total_Countries
FROM	country
GROUP BY HeadOfState
HAVING		Total_Countries > 4
ORDER BY Total_Countries DESC;

select c.name as city, n.name as country, n.LifeExpectancy
from city as c
join country as n on n.Code = c.CountryCode 
order by n.LifeExpectancy desc 
limit 10;

Select city.name as city, country.name as country, language, city.population 
from city
join countrylanguage on countrylanguage.CountryCode = city.CountryCode 
join country on country.Code = city.CountryCode 
where language = 'Spanish' and isofficial = true 
order by population desc;

select film.title, film.film_id, actor.first_name, actor.last_name
from film
join film_actor on film_actor.film_id  = film.film_id
join actor      on film_actor.actor_id = actor.actor_id
where actor.actor_id = 25;

select film.title, film.description, category.name as category 
from film 
join film_category on film_category.film_id = film.film_id 
join category on category.category_id = film_category.category_id 
where category.name = 'Documentary' 
and description not like '%documentary%';

SELECT name, code, Population , HeadOfState 
FROM country
where Population < 1000000;

SELECT name, code, Population , HeadOfState 
FROM world.country
where CONTINENT = 'nORTH aMERICA' 
AND Population < 1000000;

select * from city
where CountryCode IN ('NLD', 'BEL', 'LUX');

select distinct CountryCode from city;

select  CountryCode, name, Population
from city
where Population between 1000000 and 2000000;

select  CountryCode, name, Population
from city
where Population between 1000000 and 2000000
and name like 'S%' 
and CountryCode like '%N';

select rental_id, rental_date from sakila.rental where rental_date > '2005-05-26';
select rental_id, rental_date from sakila.rental where rental_date > '05-26-2005';


SELECT Region, name from country order by 1 asc, 2 desc;

SELECT 
    100 - SUM(Percentage) as 'languages unaccounted for'
FROM
    world.countrylanguage
WHERE
    CountryCode = 'MOZ';
    
    
SELECT 
    FORMAT(AVG(population), 0) AS 'average pop'
FROM
    world.country;


SELECT
    customer_id, COUNT(*) AS 'Big Renters'
FROM
    rental
GROUP BY customer_id
ORDER BY COUNT(*) DESC;

SELECT 
    YEAR(payment_date), MONTH(payment_date), SUM(amount)
FROM
    payment
GROUP BY YEAR(payment_date), MONTH(payment_date);

SELECT 
    quarter(payment_date), SUM(amount)
FROM
    payment
GROUP BY quarter(payment_date)
order by sum(amount);
SELECT title, length, description
FROM sakila.film
where description like '%database Administrator%'
order by length asc
limit 10;

SELECT title, rating, rental_rate, description 
FROM sakila.film
where rating in ('PG', 'G', 'PG-13')
and description not like '%documentaries%'
and length < 120
order by rental_rate asc
limit 5;

select City from city
where city_id in (select city_id from address where district in ('California', 'Texas', 'Missouri'));

select rating, avg(length), sum(rental_rate), avg(rental_rate)
from film
group by rating;

SELECT 
    name, Population
FROM
    world.city
WHERE
    CountryCode = 'TWN'
ORDER BY Population DESC
LIMIT 1;

select 100-sum(Percentage) as 'Percentage Other'  from world.countrylanguage where CountryCode = 'MOZ';

select CountryCode as Country, sum(Percentage) as 'Percentage Known Languages' from world.countrylanguage group by CountryCode;

select round(sum(length)/60, 0) as 'Hours to watch', format(sum(rental_rate),2)  from film;

select inventory_id, count(*) as 'Rental Count' from rental
group by inventory_id
order by count(*) desc;


select year(payment_date), month(payment_date), sum(amount)
from payment
group by year(payment_date), month(payment_date);


select city.name, city.District, country.name
from city
join country on country.Code = city.CountryCode;


select year(payment_date), month(payment_date), sum(amount), 
case 
when month(payment_date) = 2  then 'February'
when month(payment_date) = 5  then 'May'
when month(payment_date) = 6  then 'June'
when month(payment_date) = 7  then 'July'
when month(payment_date) = 8  then 'August'
when month(payment_date) = 9  then 'September'
when month(payment_date) = 10  then 'October'
else 'Unknown'
end as Month
from payment
group by year(payment_date), month(payment_date);

select curdate();



SELECT 	i.inventory_id, f.film_id, f.title, SUM(p.amount)
FROM 	    film f
left JOIN	inventory	AS i 	ON f.film_id = i.film_id
left JOIN	rental		AS r	ON i.inventory_id = r.inventory_id
left JOIN	payment		AS p 	ON p.rental_id = r.rental_id 
GROUP BY f.film_id
order by sum(amount) desc;

SELECT 	f.title, SUM(p.amount) -SUM(f.rental_rate)
FROM 	   film f
 JOIN	inventory	AS i 	ON f.film_id = i.film_id
 JOIN	rental		AS r	ON i.inventory_id = r.inventory_id
 JOIN	payment		AS p 	ON p.rental_id = r.rental_id 
GROUP BY f.film_id
order by 2 desc;

select * from film where film_id not in (select distinct film_id from inventory);
select * from inventory where inventory_id not in (select distinct inventory_id from film);

select * from inventory where inventory_id not in (select distinct inventory_id from rental);
select * from rental where inventory_id not in (select distinct inventory_id from inventory);
select * from payment where rental_id not in (select distinct rental_id from rental);

select * from rental where rental_id not in
 (select distinct inventory_id from inventory);

select title, sum(amount) as 'Revenue'
from film
left join inventory on inventory.film_id = film.film_id
left join rental on inventory.inventory_id = rental.inventory_id
left join payment on rental.rental_id = payment.rental_id
group by film.film_id
order by sum(amount) desc;


select a.first_name, a.last_name,  count(*)
from actor a
join film_actor fa ON fa.actor_id = a.actor_id
join inventory i on fa.film_id = i.film_id
join rental r on r.inventory_id = i.inventory_id
group by a.actor_id
order by 3 desc;


#4
select first_name, last_name, count(*) as 'Total Views'
from rental
join inventory on inventory.inventory_id = rental.inventory_id
join film_actor on film_actor.film_id = inventory.film_id
join actor on film_actor.actor_id = actor.actor_id
group by actor.actor_id
order by count(*) desc;

#5
select title, count(rental.rental_id) as 'Total Views'
from rental
right join inventory on inventory.inventory_id = rental.inventory_id
right join film on film.film_id = inventory.film_id
-- where inventory.inventory_id is not null
group by film.film_id
order by count(rental.rental_id) desc;

#films not in inventory
select inventory.inventory_id, film.film_id
from film 
left join inventory on film.film_id = inventory.film_id
where inventory.film_id is null
order by inventory.film_id;

#Complex queries example using is not null 
select film.film_id, film.title, max(rental_date) as 'Last rental'
from film
left join inventory on film.film_id = inventory.film_id
left join rental on inventory.inventory_id = rental.inventory_id
group by film.film_id
having max(rental_date) is null

select rating, count(*) from sakila.film group by rating;

select continent, round(avg(lifeexpectancy),0) as 'avg life span' 
from country 
group by continent;

select title, replacement_cost as 'cost' 
from sakila.film 
where replacement_cost in (select max(replacement_cost) from sakila.film);

select continent, format(avg(GNP),2) as 'Avg GNP' 
from country group by continent;

select region, format(sum(surfaceArea),2) as 'Totle Surface Area' 
from country group by region having sum(SurfaceArea)> 4000000 
order by sum(SurfaceArea) desc;

select rating, count(*) 
from sakila.film 
group by rating;

select Continent, round(avg(lifeexpectancy),0) 
from country 
group by continent;

select title, replacement_cost as 'cost' 
from sakila.film 
where replacement_cost in (select max(replacement_cost) from sakila.film);