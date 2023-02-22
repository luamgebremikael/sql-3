CREATE TABLE customer(
 customer_id SERIAL PRIMARY KEY,
 first_name varchar(55),
 last_name varchar(55),
 address varchar(255),
 billing_info varchar(255) NOT NULL
);

INSERT INTO customer(
 first_name,
 last_name,
 address,
 billing_info
)VALUES(
 'Arsema',
 'Luam',
 '1212 Make st Columbius Ohio',
 '3234-3333-2222-1222'
),(
 'Erm',
 'Jordan',
 '3222 baker st Berkely CA',
 '9000-2229-9888-8898'
);



CREATE TABLE ticket(
 ticket_id SERIAL PRIMARY KEY,
 price float,
 seat_number integer,
 "date" timestamp,
 customer_id integer NOT NULL,
 movie_title_id integer NOT NULL,
 FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
 FOREIGN KEY (movie_title_id) REFERENCES movie_title(movie_title_id)
);

INSERT INTO ticket(
 price,
 seat_number,
 "date",
 customer_id,
 movie_title_id
)VALUES(
 12.00,
 2,
 '2023-02-22 10:23:54',
 1,
 1
),(
 12.00,
 5,
 '2023-02-22 12:23:54',
 2,
 2
);

CREATE TABLE concession_product(
 concession_product_id SERIAL PRIMARY KEY,
 "name" varchar(55),
 description TEXT,
 price float,
 concession_purchase_id integer NOT NULL,
 quantity integer,
 FOREIGN KEY (concession_purchase_id) REFERENCES concession_purchase(concession_purchase_id)
);

INSERT INTO concession_product(
 "name",
 description,
 price,
 concession_purchase_id,
 quantity
)VALUES(
 'M&Ms',
 'small chocolate pieces',
 4.00,
 1,
 2
),(
 'water bottle',
 'water 8oz',
 5.00,
 1,
 1
);

CREATE TABLE concession_purchase(
 concession_purchase_id SERIAL PRIMARY KEY,
 customer_id integer NOT NULL,
 "date" timestamp,
 total float,
 FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO concession_purchase(
 customer_id,
 "date",
 total
)VALUES(
 1,
 '2023-02-22 10:02:00',
 25.33
),(
 2,
 '2023-02-22 12:10:00',
 8.99
);



CREATE TABLE screen_room(
 screen_room_id SERIAL PRIMARY KEY,
 room integer
);

INSERT Into screen_room(
 room
)values(
 1
),(
 2
);



CREATE TABLE movie_title(
 movie_title_id SERIAL PRIMARY KEY,
 "name" varchar(55),
 screen_room_id integer NOT NULL,
 FOREIGN KEY (screen_room_id) REFERENCES screen_room(screen_room_id)
);

INSERT INTO movie_title(
 "name",
 screen_room_id
)VALUES(
 'Avatar',
 1
),(
 'Creed 2',
 2
);

CREATE OR REPLACE PROCEDURE insertCustomer(
 f_n varchar,
 l_n varchar,
 address_ varchar,
 billingInfo varchar
)
LANGUAGE plpgsql AS $$
BEGIN 
 INSERT INTO customer(
  first_name,
  last_name,
  address,
  billing_info
 )values(
  f_n,
  l_n,
  address_,
  billingInfo
 );
 COMMIT;
END; $$

SELECT *
FROM customer;

CALL insertCustomer('Joe', 's','20020 dog st Oakland CA', '4222-3232-1111-0922')