-- How many distinct (different) actors' last names are there?

use sakila;
select count(distinct last_name) from sakila.actor;
-- 121 distinct names 

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) as different_languages from sakila.film;
-- just 1

-- how many movies were released with "PG-13" rating?
select count(rating) as PG_13_rating from film
where rating = "PG-13";

-- Get 10 the longest movies from 2006.
select * from film
where release_year = 2006
order by length asc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?


-- Show rental info with additional columns month and weekday. Get 20.
select *, date_format(convert(left(rental_date,position(' ' in rental_date)-1),date), '%M %w %D') as month_and_weekday from rental
order by rental_date asc
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select rental_id, date_format(left(rental_date, position(' ' in rental_date)-1), '%W') as datename, 
case 
when (lower(date_format(left(rental_date, position(' ' in rental_date)-1), '%W')) = 'saturday' or 'sunday') then 'Weekdend'
else 'Workday'
end as day_type 
from rental;

-- How many rentals were in the last month of activity?
-- all data shows same month so I'd rather calculate return date in this case.

select count(substr(return_date,6,2) = 09) from rental;
select count(return_date) from rental;
