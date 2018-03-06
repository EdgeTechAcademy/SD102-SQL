select 	
case 
	when 	dayofweek(rental_date) =	1	then 	' Sunday ' 
	when 	dayofweek(rental_date) =	2	then 	' Monday ' 
	when 	dayofweek(rental_date) =	3	then 	' Tuesday ' 
	when 	dayofweek(rental_date) =	4	then 	' Wednesday ' 
	when 	dayofweek(rental_date) =	5	then 	' Thursday' 
	when 	dayofweek(rental_date) =	6	then 	' Friday' 
	when 	dayofweek(rental_date) =	7	then 	' Saturday ' 
end as Day 
from 	rental;

select 	dayofweek(rental_date),  count(*) as days
from 	rental
group by dayofweek(rental_date);

select 	
case 
	when 	dayofweek(rental_date) =	1	then 	' Sunday ' 
	when 	dayofweek(rental_date) =	2	then 	' Monday ' 
	when 	dayofweek(rental_date) =	3	then 	' Tuesday ' 
	when 	dayofweek(rental_date) =	4	then 	' Wednesday ' 
	when 	dayofweek(rental_date) =	5	then 	' Thursday' 
	when 	dayofweek(rental_date) =	6	then 	' Friday' 
	when 	dayofweek(rental_date) =	7	then 	' Saturday ' 
end as Day,
 count(*) as days
from 	rental
group by dayofweek(rental_date);

select 	
dayofweek(rental_date) =	1	as 	' Sunday ' ,
dayofweek(rental_date) =	2	as 	' Monday ' ,
dayofweek(rental_date) =	3	as 	' Tuesday ' ,
dayofweek(rental_date) =	4	as 	' Wednesday ', 
dayofweek(rental_date) =	5	as 	' Thursday' ,
dayofweek(rental_date) =	6	as 	' Friday' ,
dayofweek(rental_date) =	7	as 	' Saturday ' 
from 	rental;


select 	
sum(dayofweek(rental_date) =	1)	as 	' Sunday ' ,
sum(dayofweek(rental_date) =	2)	as 	' Monday ' ,
sum(dayofweek(rental_date) =	3)	as 	' Tuesday ' ,
sum(dayofweek(rental_date) =	4)	as 	' Wednesday ', 
sum(dayofweek(rental_date) =	5)	as 	' Thursday' ,
sum(dayofweek(rental_date) =	6)	as 	' Friday' ,
sum(dayofweek(rental_date) =	7)	as 	' Saturday ' 
from 	rental;