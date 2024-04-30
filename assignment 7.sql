--q1
select *
from customer
where last_name like 'T%'
order by first_name;
--q2
select *
from rental
where return_date >='2005-05-28%' 
AND return_date <= '2005-06-01%';
--q3
select count(distinct rental_id), title 
from film
left join inventory
on film.film_id = inventory.film_id
left join rental
on inventory.inventory_id = rental.inventory_id
group by title
order by count desc;
--q4
Explain select first_name, last_name, sum(amount)
from customer
left join payment 
on customer.customer_id = payment.customer_id
group by first_name, last_name
order by sum desc;
--q5
select count(film_actor.actor_id) no_of_films, actor.actor_id, first_name, last_name 
from film_actor  
left join film
on film_actor.film_id = film.film_id
left join actor
on film_actor.actor_id = actor.actor_id
where film.release_year =2006
group by first_name, actor.actor_id, last_name
order by no_of_films desc;
--q6
Explain select first_name, last_name, sum(amount)
from customer
left join payment 
on customer.customer_id = payment.customer_id
group by first_name, last_name
order by sum desc;

Explain select count(film_actor.actor_id) no_of_films, actor.actor_id, first_name, last_name 
from film_actor  
left join film
on film_actor.film_id = film.film_id
left join actor
on film_actor.actor_id = actor.actor_id
where film.release_year =2006
group by first_name, actor.actor_id, last_name
order by no_of_films desc;
--q7
select name, Avg(rental_rate)
from film f
left join film_category fc
on f.film_id = fc.film_id
left join category c
on fc.category_id = c.category_id
group by name
order by Avg desc;
--q8

select rental_date, return_date,
CASE WHEN CAST(return_date as date) - Cast(rental_date AS date) < 7 then 'early' 
when CAST(return_date as date) - Cast(rental_date AS date) > 7 then 'Late'
else 'on time'
end as return_time
from rental;

--q9
select c.name category, count(r.rental_id) rental_amount, 
        sum (p.amount) total_sales
from payment p
left join rental r ON p.rental_id=r.rental_id
left join inventory i on r.inventory_id = r.inventory_id
left join film f on i.film_id = f.film_id
left join film_category fc on f.film_id = fc.film_id
left join category c on fc.category_id = c.category_id
group by category
order by rental_amount desc;








