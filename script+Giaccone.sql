CREATE SCHEMA FUNKO;
USE FUNKO;

CREATE TABLE categories(
    id INT NOT NULL UNIQUE, 
    category_name VARCHAR(15),
    PRIMARY KEY(id)
    );
    
CREATE TABLE new_product(
    id_product INT NOT NULL UNIQUE, 
    product_name VARCHAR(30),
    product_description VARCHAR(300),
    PRIMARY KEY(id_product)
    );
    
CREATE TABLE product(
    id INT NOT NULL AUTO_INCREMENT, 
    title VARCHAR(45) NOT NULL,
    prod_description VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    thumbnail VARCHAR(150) NOT NULL, 
    category_id INT NOT NULL,  
    stock INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    PRIMARY KEY(id)
);

CREATE TABLE cart(
    id INT NOT NULL AUTO_INCREMENT, 
    product_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES product (id),
    PRIMARY KEY(id)
);

CREATE TABLE ticket(
    id INT NOT NULL AUTO_INCREMENT, 
    user_id INT NOT NULL UNIQUE,
    cart_id INT NOT NULL UNIQUE,   
    budget_date DATE NOT NULL,
    shopping_date DATE, 
    address_line VARCHAR(50),
    ticket_description VARCHAR(250),
    total DECIMAL(9,2) DEFAULT 0,    
    FOREIGN KEY (cart_id) REFERENCES cart (id),   
    PRIMARY KEY(id)
);

CREATE TABLE countries (
    id INT NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE provinces (
    id INT NOT NULL AUTO_INCREMENT,
    province_name VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries (id),
    PRIMARY KEY (id)
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
    country_id INT NOT NULL,
    province_id INT NOT NULL,
    rol_id INT NOT NULL DEFAULT 1,
    cart_id INT NOT NULL UNIQUE,
    ticket_id INT NOT NULL UNIQUE,
    FOREIGN KEY (country_id) REFERENCES countries (id),
    FOREIGN KEY (province_id) REFERENCES provinces (id),
    FOREIGN KEY (rol_id) REFERENCES rol (id),
    FOREIGN KEY (cart_id) REFERENCES cart (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket (id),
    PRIMARY KEY(id)
);

-- Inserción de datos en la tabla "categories"
INSERT INTO categories (id, category_name)
VALUES
    (1, 'Marvel'),
    (2, 'DC Comics'),
    (3, 'Peliculas'),
    (4, 'Musica'),
	(5, 'Anime');

-- insercion de datos en la tabla "product"
INSERT INTO product (title, prod_description, price, thumbnail, category_id, stock)
VALUES
    ('Batman', 'Completa tu colección con un Clásico de los 60 interpretado por ADAM WEST', 4500, 'https://i.postimg.cc/8CqxQbsP/imagen15.png', 2, 50),
    ('Slash', 'Saul Hudson, más conocido por su nombre artístico Slash, es un músico y compositor británico-estadounidense', 3000, 'https://i.postimg.cc/2SCzgrMX/imagen12.png', 4, 50),
    ('Ligth Yagami', 'Tambien conocido como KIRA es el protagonista de la serie Death Note, añade a tu colleccion a EL rey del Nuevo Mundo', 4000, 'https://i.postimg.cc/V601X605/imagen13.png', 5, 50),
    ('Flash', 'Una increible figura de acción de DC Comics, el velocista mas rapido de starling city Barry Allen no te puede faltar, Corre barry corre!', 4300, 'https://i.postimg.cc/5yMcvmMk/imagen14.png', 2, 50),
    ('Cyclops', 'Un Mutante lider de los X-mens siempre es bueno para completar el equipo, no te pierdas a Scott Sommer con su traje de la pelicula del año 2000', 3200, 'https://i.postimg.cc/ZRSjxsC3/imagen18.png', 1, 50),
    ('Goku', 'El protagonista del Anime mas visto por la generacion de los 90 KAKAROTO el Sayajin criado en la tierra en sus inicios con su nube voladora', 4000, 'https://i.postimg.cc/MKd4KwXL/imagen16.png', 5, 50),
    ('Naruto', 'Naruto Uzumaki en su fase mas poderosa, el modo Kyuby combinada con el modo sanin lo convierte en un funko ideal para tener en tu colección', 4000, 'https://i.postimg.cc/LX9LscJy/imagen7.png', 5, 50),
    ('Joker', 'El joker interpretado por Jack Nicolson es un clasico del año 1989...y como olvidar su gran frase:  ¿Alguna vez has bailado con el diablo por las noches?', 4200, 'https://i.postimg.cc/s295sjgQ/imagen6.png', 2, 50),
    ('Kurt Cobain', 'Kurt Donald Cobain fue un cantante, músico y compositor estadounidense, conocido por ser el lider de la banda grunge Nirvana', 5000, 'https://i.postimg.cc/Rh07gk93/imagen3.png', 4, 50),
    ('Thor', 'El poderoso Thor Principe de Asgard en su increible atuendo de la pelicula Avengers End Game con una apariencia de vikingo', 3800, 'https://i.postimg.cc/VsHnYHmR/imagen9.png', 1, 50),
    ('Spider Man', 'El amigable hombre araña en uno de sus mejores trajes fabricado con nanotecnologia por las industrias STARK', 3750, 'https://i.postimg.cc/FHSjCgtx/imagen5.png', 1, 50),
    ('Beetlejuice', 'El Super Fantasma Beetlehuice interpretado por Michael Keaton es sin lugar a dudas otro clasico de los años 80', 3250, 'https://i.postimg.cc/90c8Cg2V/imagen17.png', 3, 50),
    ('Freddy Mercury', 'cantante y compositor británico que alcanzó fama mundial por ser el vocalista y pianista de la banda de rock Queen', 4000, 'https://i.postimg.cc/kMVDyMPQ/imagen10.png', 4, 50),
    ('Venom', 'Eddie Brock y el simbiote unidos, ellos se hacen llamar asi mismos VENOM el archienemigo de Spider-Man', 3000, 'https://i.postimg.cc/X7j48TWM/imagen8.png', 1, 50),
    ('Iron Man', 'El Genio, millonario, playboy y filántropo en su increíble Mark 42, no puede faltar en tu coleccón', 4500, 'https://i.postimg.cc/fRQsmDMR/imagen1.png', 1, 50),
    ('Screem', 'Otro clasico de las peliculas de terror y comedia de los años 90 ese es Screem Hola Jhonny.... whast up', 3800, 'https://i.postimg.cc/VNLk0mFb/imagen11.png', 3, 50);

-- Inserción de datos en la tabla "cart"
INSERT INTO cart (product_id)
VALUES
    (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
    

-- Inserción de datos en la tabla "ticket"
INSERT INTO ticket (user_id, cart_id, budget_date, shopping_date, address_line, ticket_description, total)
VALUES
    (1, 1, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00),
    (2, 2, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00),
	(3, 3, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00),
    (4, 4, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00),
	(5, 5, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00),
    (6, 6, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00),
    (7, 7, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00),
	(8, 8, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00),
    (9, 9, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00),
	(10, 10, '2023-10-23', '2023-10-23', 'Dirección 1', 'Descripción del ticket 1', 20.00);



-- Inserción de datos en la tabla "rol"
INSERT INTO rol (id, rol_name)
VALUES
    (1, 'Cliente'),
    (2, 'Moderador'),
    (3, 'Admin');   
    
-- Inserción de datos en la tabla "countries"
INSERT INTO countries (country_name)
VALUES
    ('Argentina'),
    ('Brazil'),
    ('Chile'),
    ('Mexico'),
    ('Estados Unidos');

-- Inserción de datos en la tabla "provinces"
INSERT INTO provinces (province_name, country_id)
VALUES
    ('Buenos Aires', 1), -- Buenos Aires, Argentina
    ('Sao Paulo', 2), -- Sao Paulo, Brazil
    ('Santiago', 3), -- Santiago, Chile
    ('Jalisco', 4), -- Jalisco, Mexico
    ('California', 5); -- California, Estados Unidos

-- Inserción de datos en la tabla "usuario"
INSERT INTO usuario (user_name, last_name, email, country_id, province_id, rol_id, cart_id, ticket_id)
VALUES
    ('Diego', 'Giaccone', 'diego_fg91@hotmail.com', 1, 1, 3, 1, 1);
    
CREATE VIEW ProductInfo AS
SELECT id, title, prod_description, price, stock
FROM product;

CREATE VIEW UserPurchases AS
SELECT u.user_name, u.email, t.budget_date, p.title, p.price, t.total
FROM usuario AS u
JOIN ticket AS t ON u.ticket_id = t.id
JOIN cart AS c ON t.cart_id = c.id
JOIN product AS p ON c.product_id = p.id;

CREATE VIEW ProductsPerCategory AS
SELECT c.category_name, COUNT(p.id) AS product_count
FROM categories AS c
LEFT JOIN product AS p ON c.id = p.category_id
GROUP BY c.category_name;

CREATE VIEW ProvincesPerCountry AS
SELECT co.country_name, p.province_name
FROM countries AS co
LEFT JOIN provinces AS p ON co.id = p.country_id;

CREATE VIEW TotalSpentByUser AS
SELECT u.user_name, u.email, SUM(t.total) AS total_spent
FROM usuario AS u
JOIN ticket AS t ON u.ticket_id = t.id
GROUP BY u.user_name, u.email;

CREATE VIEW ProductsWithTaxes AS
SELECT p.id AS product_id, p.title, p.price,
    c.category_name,
    CASE
        WHEN c.category_name = 'Peliculas' THEN p.price * 0.21
        WHEN c.category_name = 'Musica' THEN p.price * 0.16
        ELSE p.price * 0.10
    END AS tax_cost
FROM product AS p
JOIN categories AS c ON p.category_id = c.id;


-- FUNCIONES
-- Esta función toma el ID del carrito de compras como entrada y devuelve el precio total de todos los productos en ese carrito.
DELIMITER //
CREATE FUNCTION CalculateTotalPrice(cartID INT)
RETURNS DECIMAL(9,2)
DETERMINISTIC
BEGIN
    DECLARE totalPrice DECIMAL(9,2);
    SELECT SUM(p.price) INTO totalPrice
    FROM cart AS c
    JOIN product AS p ON c.product_id = p.id
    WHERE c.id = cartID;
    RETURN totalPrice;
END;
//
-- Esta función toma el ID del producto como entrada y devuelve la cantidad en stock de ese producto.
DELIMITER //
CREATE FUNCTION GetStockQuantity(productID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stockQuantity INT;
    SELECT stock INTO stockQuantity
    FROM product
    WHERE id = productID;
    RETURN stockQuantity;
END;
//

-- test de las funciones
SELECT CalculateTotalPrice(2) AS TotalPrice;
SELECT GetStockQuantity(7) AS TotalStock;

-- Stored Procedure para ordenar los productos por precio, ya sea de forma ascendente o descendente
DELIMITER //
CREATE PROCEDURE OrderProductsByPrice(IN sortOrder VARCHAR(10))
BEGIN
    -- Creamos una consulta SQL dinámica para ordenar la tabla de productos por precio
    SET @sql = CONCAT('SELECT * FROM product ORDER BY price ', sortOrder);
    
    -- Ejecutamos la consulta dinámica
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//

CALL OrderProductsByPrice('ASC'); -- Ordenar los productos de forma ascendente por precio
CALL OrderProductsByPrice('DESC'); -- Ordenar los productos de forma descendente por precio


-- Stored Procedure para insertar nuevos registros en la tabla de usuarios o eliminar un usuario especifico

DELIMITER //
CREATE PROCEDURE InsertOrDeleteUser(IN p_user_name VARCHAR(45), IN p_last_name VARCHAR(45), IN p_email VARCHAR(50), IN p_country_id INT, IN p_province_id INT, IN p_rol_id INT, IN p_cart_id INT, IN p_ticket_id INT, IN p_user_id INT)
BEGIN
    -- Si p_user_id es NULL, insertamos un nuevo usuario
    IF p_user_id IS NULL THEN
        INSERT INTO usuario (user_name, last_name, email, country_id, province_id, rol_id, cart_id, ticket_id)
        VALUES (p_user_name, p_last_name, p_email, p_country_id, p_province_id, p_rol_id, p_cart_id, p_ticket_id);
    -- Si p_user_id tiene un valor, eliminamos el usuario con ese ID
    ELSE
        DELETE FROM usuario WHERE id = p_user_id;
    END IF;
END;
//
-- Para insertar un nuevo usuario
CALL InsertOrDeleteUser('NuevoUsuario', 'Apellido', 'nuevo@email.com', 1, 1, 1, 3, 3, NULL);

-- Para eliminar un usuario específico 
CALL InsertOrDeleteUser(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);

SELECT * FROM usuario;

-- creamos las tablas para los logs de productos y de usuarios
CREATE TABLE product_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    action VARCHAR(255),
    action_timestamp TIMESTAMP,
    user_id INT
);

CREATE TABLE usuario_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    action VARCHAR(255),
    action_timestamp TIMESTAMP,
    user_id INT
);

-- Este trigger registra la acción antes de realizar una operación en la tabla "product".
DELIMITER //
CREATE TRIGGER before_product_operation
BEFORE INSERT ON product
FOR EACH ROW
BEGIN
    INSERT INTO product_log (product_id, action, action_timestamp, user_id)
    VALUES (NEW.id, 'INSERT', NOW(), @user_id);
END;
//

-- Este trigger registra la acción después de realizar una operación en la tabla "product".
DELIMITER //
CREATE TRIGGER after_product_operation
AFTER UPDATE ON product
FOR EACH ROW
BEGIN
    INSERT INTO product_log (product_id, action, action_timestamp, user_id)
    VALUES (NEW.id, 'UPDATE', NOW(), @user_id);
END;
//

-- Este trigger registra la acción antes de realizar una operación en la tabla "usuario".
DELIMITER //
CREATE TRIGGER before_usuario_operation
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO usuario_log (usuario_id, action, action_timestamp, user_id)
    VALUES (OLD.id, 'DELETE', NOW(), @user_id);
END;
//

-- Este trigger registra la acción después de realizar una operación en la tabla "usuario".
DELIMITER //
CREATE TRIGGER after_usuario_operation
AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO usuario_log (usuario_id, action, action_timestamp, user_id)
    VALUES (NEW.id, 'INSERT', NOW(), @user_id);
END;
//


-- Este trigger inserta datos en la tabla new_product automaticamente al ingresar datos en product
DELIMITER //
CREATE TRIGGER tr_add_new_product
AFTER INSERT ON product
FOR EACH ROW
BEGIN
    INSERT INTO new_product (id_product, product_name, product_description)
    VALUES (NEW.id, NEW.title, NEW.prod_description);
END;
//

-- test de inserción en la tabla "product" y registro en el log antes y después de la inserción:

INSERT INTO product (title, prod_description, price, thumbnail, category_id, stock) 
VALUES ('Nuevo Producto', 'Descripción del nuevo producto', 100, 'imagen.png', 1, 10);

-- Actualiza un producto en la tabla "product"
UPDATE product 
SET price = 150 
WHERE id = 1;

-- Comprueba el registro en la tabla "product_log"
SELECT * FROM product_log;

-- probando el trigger de new_product
INSERT INTO product (title, prod_description, price, thumbnail, category_id, stock)
VALUES
    ('Robin', 'El Fiel compañero de batman', 3500, 'https://i.postimg.cc/8CqxQbsP/imagen15.png', 2, 17);

--  test de inserción en la tabla "usuario" y registro en el log después de la inserción:
INSERT INTO usuario (user_name, last_name, email, country_id, province_id, rol_id, cart_id, ticket_id) 
VALUES ('NuevoUsuario', 'Apellido', 'nuevo@email.com', 1, 1, 1, 3, 3);

-- Elimina un usuario en la tabla "usuario"
DELETE FROM usuario WHERE id = 7; -- completar este = con el numero de ID deseado el 7 es un ejemplo;

-- Comprueba el registro en la tabla "usuario_log"
SELECT * FROM usuario_log;


SELECT * FROM product;
SELECT * FROM new_product;

CREATE VIEW TotalVentas AS
SELECT COUNT(*) AS total_ventas FROM ticket;

SELECT * FROM TotalVentas;

CREATE VIEW VentasPorUsuario AS
SELECT u.user_name, COUNT(t.id) AS cantidad_ventas
FROM usuario u
JOIN ticket t ON u.ticket_id = t.id
GROUP BY u.user_name;

SELECT * FROM VentasPorUsuario;

CREATE VIEW VentasPorCategoria AS
SELECT c.category_name, COUNT(p.id) AS cantidad_productos_vendidos
FROM categories c
LEFT JOIN product p ON c.id = p.category_id
GROUP BY c.category_name;

SELECT * FROM VentasPorCategoria;

CREATE VIEW ProductoMasVendido AS
SELECT p.title AS producto, COUNT(c.product_id) AS cantidad_vendida
FROM cart c
JOIN product p ON c.product_id = p.id
GROUP BY c.product_id
ORDER BY COUNT(c.product_id) DESC
LIMIT 1;

SELECT * FROM ProductoMasVendido;

CREATE VIEW VentasPorFecha AS
SELECT budget_date, COUNT(id) AS cantidad_ventas
FROM ticket
GROUP BY budget_date;

SELECT * FROM VentasPorFecha;
