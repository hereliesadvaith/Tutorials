-- One table represents 1 real world object
-- Columns store 1 piece of information
CREATE TABLE
	customer (
		first_name VARCHAR(30) NOT NULL,
		last_name VARCHAR(30) NOT NULL,
		email VARCHAR(60) NOT NULL,
		company VARCHAR(60) NOT NULL,
		street VARCHAR(50) NOT NULL,
		city VARCHAR(30) NOT NULL,
		state CHAR(2) NOT NULL,
		zip SMALLINT NOT NULL,
		phone VARCHAR(20) NOT NULL,
		birth_date DATE NULL,
		sex CHAR(1) NOT NULL,
		date_entered TIMESTAMP NOT NULL,
		id SERIAL PRIMARY KEY
	);

CREATE TABLE
	sales_person (
		first_name VARCHAR(30) NOT NULL,
		last_name VARCHAR(30) NOT NULL,
		email VARCHAR(60) NOT NULL,
		company VARCHAR(60) NOT NULL,
		street VARCHAR(50) NOT NULL,
		city VARCHAR(30) NOT NULL,
		state CHAR(2) NOT NULL,
		zip SMALLINT NOT NULL,
		phone VARCHAR(20) NOT NULL,
		birth_date DATE NULL,
		sex CHAR(1) NOT NULL,
		date_entered TIMESTAMP NOT NULL,
		id SERIAL PRIMARY KEY
	);

CREATE TABLE
	product_type (name VARCHAR(30) NOT NULL, id SERIAL PRIMARY KEY);

CREATE TABLE
	product (
		type_id INTEGER REFERENCES product_type (id), -- FOREIGN KEY
		name VARCHAR(30) NOT NULL,
		supplier VARCHAR(30) NOT NULL,
		description TEXT NOT NULL,
		id SERIAL PRIMARY KEY
	);

CREATE TABLE
	item (
		product_id INTEGER REFERENCES product (id), --FOREIGN KEY
		size INTEGER NOT NULL,
		colour VARCHAR(30) NOT NULl,
		picture VARCHAR(256) NOT NULL,
		price NUMERIC(6, 2) NOT NULL,
		id SERIAL PRIMARY KEY
	);

CREATE TABLE
	sales_order (
		customer_id INTEGER REFERENCES customer (id),
		sales_person_id INTEGER REFERENCES sales_person (id),
		time_order_taken TIMESTAMP NOT NULL,
		purchase_order_number INTEGER NOT NULL,
		credit_card_number VARCHAR(16) NOT NULL,
		credit_card_exp_year SMALLINT NOT NULL,
		credit_card_exp_month SMALLINT NOT NULL,
		credit_card_cvv SMALLINT NOT NULL,
		credit_card_name VARCHAR(100) NOT NULL,
		id SERIAL PRIMARY KEY
	);

CREATE TABLE
	sales_item (
		item_id INTEGER REFERENCES item (id),
		sales_order_id INTEGER REFERENCES sales_order (id),
		quantity INTEGER NOT NULL,
		discount NUMERIC(3, 2) NOT NULL DEFAULT 0,
		taxabel BOOLEAN NOT NULL DEFAULT FALSE,
		sales_tax_rate NUMERIC(5, 2) NOT NULL DEFAULT 0,
		id SERIAL PRIMARY KEY
	);

CREATE TABLE
	transaction_type (
		name VARCHAR(30) NOT NULL,
		payment_type VARCHAR(30) NOT NULL,
		id SERIAL PRIMARY KEY
	);

-- Creating index based on an individual single column
CREATE INDEX transaction_id ON transaction (name);

-- based on multiple column
CREATE INDEX transaction_id_2 ON transaction (name, payment_type);