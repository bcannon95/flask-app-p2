DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS saves;


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

CREATE TABLE saves (
    saves_id serial PRIMARY KEY,
    users_id INTEGER REFERENCES users(users_id),
    name text,
    url text,
    image text
);

INSERT INTO saves(users_id, name, url, image) VALUES(1, 'Baked Chicken', 'http://www.marthastewart.com/318981/baked-chicken', 'https://edamam-product-images.s3.amazonaws.com/web-img/01c/01cacb70890274fb7b7cebb975a93231.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEML%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIB9NiDXmF16aK%2F%2Big7Z5ojhtaSrxe%2FG2CE1m72UxbCNxAiEAig5hAGNzCkxlISnGxv0NyF0Yj%2BTgJu1nUrtU4ng9KJUq2wQIi%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDHCJsvTBNmi4NisWKyqvBOTfYqdQPHGojljSwsAkGFX94tUzVOmrtEL%2FSoflkVyowvhI%2BbgqJECIZOb96fVbVoIZxNgO%2FyvxBatbfJiUQ5KdeyL4vCvULEvhJThSNkKkfKS4Xuy9o%2FEjlpzh7BHR2sKsdoDRnlUwA2Bd9WO0VZsdUWcy3j3buHyR5IM9PnhADh5CuR1plLz7SqE45C2VcLB38U8zt33bo3E%2Fm6YEQE8Hy1fm2NlkEeyz6%2BruvryIHDsFQnf3WIroZ%2BhasxxBBO9WiYNpw1WlN%2FJvi1sw71fy9y9KC46OvQ3W4kqeWRL4oDCKFqUYAsRrDpjHOlXiUzNQ6QM7gzsvLu%2FdiQMPg1UcmjILf7pANSmeI1Pjcao3KX91L7ni5RdWnabEc04Z82ij12fTJ%2FYaPEJXgyRmSATpkXh3%2Bn%2BzqTpj6c8VQI8EQoi3mLxg7Ccq%2FCtQl4V7spV6yNXU5PgvECaor9fetFBizZXKw95it1fS2bgt%2BvsefiVH8CaPNOQW9VCJoi5Eyt08crU%2FK02QbN0x9cHGK8KrC4KZPUGflZp%2FsiE%2FnhWfr%2BdjnCDdXwFT7EFje%2FxPuVZ3cKhu4Xk6yDeZrtOFj%2BcWkJ%2BEdF5qirSyDeFYnGNkoh%2F6ce%2FYArGZ29qfGWsOaLnc05mEQk71ZBq7Rapbi2nfPilTRsk8Lg8yeiDjvde4v64yC032AfM0kwFZdynRVYFT82u4Fa8a2wrYCytTGoFUO4LrLcCMLRZTFWMbgMMw6bPOkwY6qQH53ZynT7%2BGt%2FcCsOoELUHeDK6VVZ2Z5u321JNsBf1nDP2pkL6ElGyUtGYfZyyv729sn5niP09R8A7vHe1g2yl2NNophoivelhW59BinpaBi03RL4X92e%2FqWdHBRZyLDcft2DLuR3vqrxa4gjSoxGkvKuIOb1ZtPSul7wTRGJNfwJ3KIDOMPOMMb2eoTXGNUbKAAoaJK%2Far6wxSg%2F9Oftq9sWNosgoCPG9U&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220505T102500Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFC75QLFO7%2F20220505%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d8d6404e37b3667f47d265bb1d325db4608f3ee839a2f725e4bd23a695d6498d');