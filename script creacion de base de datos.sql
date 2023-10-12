CREATE SCHEMA FUNKO;
USE FUNKO;

CREATE TABLE product(
    id INT NOT NULL AUTO_INCREMENT, 
    title VARCHAR(45) NOT NULL,
    prod_description VARCHAR(200) NOT NULL,
    price INT NOT NULL,
    thumbnail VARCHAR(150) NOT NULL, 
    category VARCHAR(45) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE cart(
    id INT NOT NULL UNIQUE, 
    user_id INT NOT NULL UNIQUE,
    product_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE ticket(
    id INT NOT NULL UNIQUE, 
    user_id INT NOT NULL UNIQUE,
    cart_id INT NOT NULL UNIQUE,
    product_id INT NOT NULL,
    budget_date DATE NOT NULL,
    shopping_date DATE, 
    address_line VARCHAR(50),
    ticket_description VARCHAR(250),
    total DECIMAL(9,2) DEFAULT 0,
    PRIMARY KEY(id)
);

CREATE TABLE rol(
    id INT NOT NULL UNIQUE, 
    rol_name VARCHAR(10),
    PRIMARY KEY(id)
);

CREATE TABLE usuario(
    id INT NOT NULL AUTO_INCREMENT, 
    user_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(50) NOT NULL,
    rol_id INT NOT NULL DEFAULT 1,
    cart_id INT NOT NULL UNIQUE,
    ticket_id INT NOT NULL UNIQUE,
    FOREIGN KEY (rol_id) REFERENCES rol (id),
    FOREIGN KEY (cart_id) REFERENCES cart (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket (id),
    PRIMARY KEY(id)
);
