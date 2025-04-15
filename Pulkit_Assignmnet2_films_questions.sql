## ASSIGNMENT 2: Movies Database
use films;
show tables;
select * from film_category;
desc film_category;
select * from category;
select * from film;
select * from actor;
select * from address;
select * from city;
select * from country;
select * from film_actor;
select * from language;

# Q1) Which categories of movies released in 2018? Fetch with the number of movies. 


select c.name as category, count(f.film_id) as movie_count
from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where f.release_year between '2018-01-01' and '2018-12-31'
group by c.name;



# Q2) Update the address of actor id 36 to “677 Jazz Street”.


update address
set address = '677 jazz street'
where address_id = 36; 

# Q3) Add the new actors (id : 105 , 95) in film  ARSENIC INDEPENDENCE (id:41).

select*
from film_actor;

select*
from film;

insert into film_actor (actor_id, film_id)
values
(105, 41),
(95, 41);

# Q4) Get the name of films of the actors who belong to India.

select f.title,country
from film f
join film_actor fa on f.film_id=fa.film_id
join actor a on fa.actor_id=a.actor_id
join address ad on a.address_id = ad.address_id
join city c on ad.city_id = c.city_id
join country co on c.country_id=co.country_id
where co.country="india";

# Q5) How many actors are from the United States?

select count(a.actor_id), co.country
from actor a
join address ad on a.address_id = ad.address_id
join city c on ad.city_id = c.city_id
join country co on c.country_id = co.country_id
where co.country = 'United States'
group by co.country;

# Q6) Get all languages in which films are released in the year between 2001 and 2010.
select l.name,f.release_year
from film f
join language l on f.language_id=l.language_id
where release_year between 2001 and 2009;


# Q7) The film ALONE TRIP (id:17) was actually released in Mandarin, update the info.

select language_id
from language
where name = 'Mandarin';

update film 
set language_id=4
where film_id=17;

# Q8) Fetch cast details of films released during 2005 and 2015 with PG rating.
select f.title, f.release_year, a.first_name, a.last_name, f.rating
from film f
join film_actor fa on f.film_id = fa.film_id
join actor a on fa.actor_id = a.actor_id
where f.release_year between 2005 and 2015
  and f.rating = 'PG';


# Q9) In which year most films were released?
select release_year,count(release_year)
from film 
group by  release_year
order by count(release_year) desc limit 1;

# Q10) In which year least number of films were released?
select release_year,count(release_year)
from film 
group by  release_year
order by count(release_year) limit 1;


# Q11) Get the details of the film with maximum length released in 2014 

select *
from film
where release_year = 2014
order by length desc
limit 1;

# Q12) Get all Sci- Fi movies with NC-17 ratings and language they are screened in.

select c.name,f.rating,l.name
from film f
join language l on f.language_id = l.language_id
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where c.name='sci-fi'and f.rating='nc-17';

# Q13) The actor FRED COSTNER (id:16) shifted to a new address:

# 055,  Piazzale Michelangelo, Postal Code - 50125 , District - Rifredi at Florence, Italy. 
# Insert the new city and update the address of the actor.

/*
# Q14) A new film “No Time to Die” is releasing in 2020 whose details are : 
# Title :- No Time to Die
# Description: Recruited to rescue a kidnapped scientist, globe-trotting spy James Bond finds himself hot on the trail of a mysterious villain, who's armed with a dangerous new technology.
# Language: English
Org. Language : English
Length : 100
Rental duration : 6
Rental rate : 3.99
Rating : PG-13
Replacement cost : 20.99
Special Features = Trailers,Deleted Scenes

Insert the above data.
*/

# Q15) Assign the category Action, Classics, Drama  to the movie “No Time to Die” .

# Q16) Assign the cast: PENELOPE GUINESS, NICK WAHLBERG, JOE SWANK to the movie “No Time to Die” .

# Q17) Assign a new category Thriller  to the movie ANGELS LIFE.

# Q18) Which actor acted in most movies?
select a.actor_id, a.first_name, a.last_name, count(fa.film_id) as movie_count
from actor a
join film_actor fa on a.actor_id = fa.actor_id
group by a.actor_id, a.first_name, a.last_name
order by movie_count desc
limit 1;

# Q19) The actor JOHNNY LOLLOBRIGIDA was removed from the movie GRAIL FRANKENSTEIN. How would you update that record?
select actor_id from actor
where first_name = 'JOHNNY' and last_name = 'LOLLOBRIGIDA';

select film_id from film
where title = 'GRAIL FRANKENSTEIN';

delete from film_actor
where actor_id = 5 and film_id = 375;


# Q20) The HARPER DYING movie is an animated movie with Drama and Comedy. Assign these categories to the movie.

# Q21) The entire cast of the movie WEST LION has changed. The new actors are DAN TORN, MAE HOFFMAN, SCARLETT DAMON. How would you update the record in the safest way?

# Q22) The entire category of the movie WEST LION was wrongly inserted. The correct categories are Classics, Family, Children. How would you update the record ensuring no wrong data is left?

# Q23) How many actors acted in films released in 2017?
select release_year,count(fa.actor_id)
from film f
join film_actor fa on f.film_id=fa.film_id
group by release_year
order by release_year desc
limit 1 offset 3;




# Q24) How many Sci-Fi films released between the year 2007 to 2017?
select count(c.name)
from film f
join film_category fc on f.film_id=fc.film_id
join category c on fc.category_id=c.category_id
where c.name='sci-fi' and  release_year between 2007 and 2017;


# Q25) Fetch the actors of the movie WESTWARD SEABISCUIT with the city they live in.
 select a.first_name,f.title,c.city
from film f
join film_actor fa on f.film_id=fa.film_id
join actor a on fa.actor_id=a.actor_id
join address ad on a.address_id = ad.address_id
join city c on ad.city_id = c.city_id
where f.title = 'WESTWARD SEABISCUIT';

 
# Q26) What is the total length of all movies played in 2008?
select sum(f.length)
from film f
where release_year=2008;


# Q27) Which film has the shortest length? In which language and year was it released?
select f.length,l.name,f.release_year
from film f
join language l on f.language_id = l.language_id
group by f.release_year,l.name
order by f.length;

# Q28) How many movies were released each year?
select release_year,count(release_year)
from film
group by release_year
order by release_year;

# Q29)  How many languages of movies were released each year?.
select release_year,l.name,count(l.name)
from film f
join language l on f.language_id = l.language_id
group by l.name,release_year
order by release_year;


# Q30) Which actor did least movies?
select a.actor_id,a.first_name,a.last_name,count(f.film_id) as movie_no
from film f
join film_actor fa on f.film_id = fa.film_id
join actor a on fa.actor_id = a.actor_id
group by a.actor_id,a.first_name,a.last_name
order by movie_no limit 1;