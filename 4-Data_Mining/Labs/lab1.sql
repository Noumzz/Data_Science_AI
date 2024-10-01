-- 1. Write a query to select column "actor_id" from the table "actor" which already exist in the Sakila database where the actor_id=58
USE Sakila;
select actor_id
from actor
where actor_id=58;
-- 2.Write a query to retrive the names of movies that were realeased in the year2006
Select title as Movies
from film
where title like "P%";
-- 3.Write a query to retrive movies that were realeaased in the year 2006
select title as "Movies in 2006"
from film
where release_year=2006;
-- 4.what password did the DBA assign to the user "Mike"
select password 
from staff
where first_name="MIKE";
-- 5.Write a query to retrieve data of all actors whose first name are not ending with T
select *
from actor
where first_name not like "%T";

-- 6.select the names of actors whose IDs are between 50 and 150,or those whose last name starts with A
Select first_name,last_name,actor_id
from actor
where (actor_id between 50 and 150) or (last_name like "A%");

-- 7.Write a query to display the names of customers in the following format.
select concat(first_name,", ",left(last_name,1))
from customer;

-- 8.Retrieve the information showing the details of each of the films released intil now in the format:
-- Film Academy Dinousaur was released in 2006.
Select concat("Film ",title," was release in the year ",release_year) as "Details of film"
from film;

-- 9.Display the usernames and address_ids of customers in the Sakila database.
select concat(first_name," ",last_name) as UserName,address_id
from customer;

-- 10.Write two queries using the substring functions on Sakila Database
select substr(first_name,1,3) as F_name,substr(last_name,1,3)L_name
from actor;
select substr(name,1,3) as Languages
from language;














