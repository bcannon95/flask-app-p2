DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS users;


CREATE TABLE ingredients (
    ingredients_id serial PRIMARY KEY,
    name text
);

INSERT INTO ingredients(name) VALUES('Chicken');
INSERT INTO ingredients(name) VALUES('Lettuce');

CREATE TABLE recipes (
    recipes_id serial PRIMARY KEY,
    name text,
    primary_ingredient_id INTEGER REFERENCES ingredients(ingredients_id),
    secondary_ingredient_id INTEGER REFERENCES ingredients(ingredients_id),
    all_ingredients text,
    image_url text,
    recipe_link text
);

INSERT INTO recipes(name, primary_ingredient_id, secondary_ingredient_id, all_ingredients, image_url, recipe_link ) VALUES('Chicken Salad', 1, 2, 'chicken, lettuce, cucumber, tomatoes, onion, avocado, olives, lemon', 'https://cdn.pixabay.com/photo/2015/05/31/13/02/salad-791643_1280.jpg','https://cafedelites.com/grilled-lemon-herb-mediterranean-chicken-salad-recipe/');


CREATE TABLE users (
    users_id serial PRIMARY KEY,
    name varchar(50) NOT NULL,
    email text,
    password text
);

INSERT INTO users(name, email, password) VALUES('Brock', 'brock@brock.com', 'Test123');




-- CREATE TABLE ingredients_in_recipes (
--     iir_id serial PRIMARY KEY,
--     customer_id INTEGER REFERENCES customers(customer_id)

-- );

-- INSERT INTO ingredients_in_recipes(name, image_url, price) VALUES('Burrito','https://cdn.pixabay.com/photo/2017/06/29/20/09/mexican-2456038__480.jpg', 1200);
-- INSERT INTO ingredients_in_recipes(name, image_url, price) VALUES('Tacos','https://cdn.pixabay.com/photo/2015/11/02/20/27/taco-1018962_1280.jpg', 800);
-- INSERT INTO ingredients_in_recipes(name, image_url, price) VALUES('Chips','https://cdn.pixabay.com/photo/2016/11/20/09/06/bowl-1842294_1280.jpg', 500);