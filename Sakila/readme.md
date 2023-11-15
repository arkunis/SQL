# Sakila DB

Nombre film par catégorie. : 

    SELECT NAME,(select count(film_id) FROM film_category WHERE film_category.category_id = category.category_id) from category

Film par catégorie dans l'inventaire : 

    SELECT inventory.store_id, category.name, count(inventory.film_id) FROM film_category INNER JOIN category ON category.category_id=film_category.category_id INNER JOIN film ON film.film_id=film_category.film_id INNER JOIN inventory ON inventory.film_id= film.film_id GROUP BY inventory .store_id, category.name ORDER BY store_id

Acteur par film : 

    Select title, count(actor_id) from film_actor inner join film on film_actor.film_id = film.film_id group by title;

Top location : 

    SELECT film.title, COUNT(film.title) as rentals from film JOIN (SELECT rental.rental_id, inventory.film_id FROM rental JOIN inventory ON inventory.inventory_id = rental.inventory_id) AS total ON total.film_id = film.film_id GROUP BY film.title ORDER BY rentals DESC limit 10

Nombre clients par magasin : 

    SELECT store.store_id, city.city, COUNT(customer.store_id) FROM store 
    INNER JOIN address ON address.address_id = store.address_id 
    INNER JOIN customer ON customer.store_id = store.store_id
    INNER JOIN city ON city.city_id = address.city_id
    GROUP BY store.store_id

Total revenu magasin :

    SELECT store.store_id, sum(payment.amount) FROM rental
    INNER JOIN payment ON payment.rental_id = rental.rental_id
    INNER JOIN staff ON staff.staff_id = rental.staff_id
    INNER JOIN store ON store.store_id = staff.store_id
    group BY store.store_id

Client du Canada : 

    SELECT first_name, last_name, email FROM customer
    INNER JOIN address ON address.address_id = customer.address_id
    INNER JOIN city ON city.city_id = address.city_id
    INNER JOIN country ON country.country_id = city.country_id
    WHERE country LIKE "%Canada%"

