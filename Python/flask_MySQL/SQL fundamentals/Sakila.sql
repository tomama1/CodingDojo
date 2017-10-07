SELECT first_name, last_name, email, address from customer
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON city.city_id = address.city_id
LEFT JOIN country
ON country.country_id = city.city_id
WHERE city.city_id = 312;

SELECT title, description, release_year, rating, special_features, category.name FROM film
LEFT JOIN film_category
ON film_category.film_id = film.film_id
LEFT JOIN category
ON category.category_id = film_category.category_id

SELECT actor.actor_id, first_name, last_name,title, description, release_year FROM film
LEFT JOIN film_actor
ON film_actor.film_id = film.film_id
LEFT JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id = 5

SELECT first_name, last_name, email, address FROM customer
JOIN store
ON store.store_id = customer.store_id
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON city.city_id = address.city_id
WHERE city.city_id IN (1,42,312,459) AND customer.store_id = 1

SELECT title, description, release_year,rating, special_features FROM film
LEFT JOIN film_actor
ON film_actor.film_id = film.film_id
LEFT JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE rating = "G" and special_features LIKE "%Behind the Scenes%" AND actor.actor_id = 15

SELECT film.film_id, title, actor.actor_id, actor.first_name, actor.last_name FROM film
JOIN film_actor
ON film_actor.film_id = film.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id

SELECT title, description, release_year, rating, special_features, category.name FROM film
JOIN film_category
ON film_category.film_id = film.film_id
JOIN category
ON category.category_id = film_category.category_id
JOIN inventory
ON inventory.film_id = film_category.film_id
JOIN rental
ON rental.inventory_id = inventory.inventory_id
WHERE rental_rate = 2.99

SELECT actor.first_name, actor.last_name, title, description, release_year, rating, special_features, category.name FROM film
JOIN film_category
ON film_category.film_id = film.film_id
JOIN category
ON category.category_id = film_category.category_id
JOIN film_actor
ON film_actor.film_id = film.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name= "SANDRA" AND actor.last_name= "KILMER"





