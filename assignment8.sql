--q1
Alter table rental
add status varchar(50);
Update rental 
set status = CASE WHEN CAST(return_date as date) - Cast(rental_date AS date) < 7 then 'early' 
when CAST(return_date as date) - Cast(rental_date AS date) > 7 then 'Late'
else 'on time'
end;
--q2
select first_name, last_name , city, sum(amount)
from city
left join Address 
on city.city_id = address.city_id
left join customer 
on address.address_id = customer.address_id
left join payment 
on customer.customer_id = payment.customer_id
where city in ('Kansas City', 'Saint Louis')
group by first_name, last_name , city
order by sum;
--q3
select name, sum(f.film_id) total_films
from film f 
left join film_category fc on f.film_id = fc.film_id
left join category c on fc.category_id = c.category_id
group by name
order by total_films desc;


--q4
select distinct film.film_id, title, length
from film
left join inventory i
on film.film_id = film.film_id
left join rental 
on i.inventory_id= rental.inventory_id
where CAST(return_date as date) between '2005-05-15'
and '2005-05-31'
order by title;
--q5
select title, (select avg(amount)
			  from payment) as average_amount, 
			  (select amount
			   from payment) as amount
from film, payment
where  amount < average_amount 

--q6
select title, amount
from film
left join inventory i
on film.film_id = i.film_id
left join rental r
on i.inventory_id = r.inventory_id
left join payment p
on r.rental_id = p.rental_id
where amount < 4.2
--q7

--q8
select film_id, title, length, 
       percent_rank() over (order by length) as perecentile
from film






