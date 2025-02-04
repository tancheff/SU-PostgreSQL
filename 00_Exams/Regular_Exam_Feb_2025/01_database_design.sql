CREATE TABLE IF NOT EXISTS brands (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE
);
-------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS classifications  (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE
);
-------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS customers  (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	address VARCHAR(150) NOT NULL,
	phone VARCHAR(30) NOT NULL UNIQUE,
	loyalty_card BOOLEAN NOT NULL DEFAULT FALSE
);
-------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS items  (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	quantity INTEGER NOT NULL, --constraint >=0
	price DECIMAL(12, 2) NOT NULL, --constraint >0.00
	description TEXT,
	brand_id INTEGER NOT NULL, --constriant relationship w/ brands
	classification_id INTEGER NOT NULL, --constraint relationship w/ classifications

	CONSTRAINT ck_quantity_is_positive
		CHECK (quantity >= 0),
	CONSTRAINT ck_price_is_positive
		CHECK (price > 0.00),
	CONSTRAINT fk_items_brands
		FOREIGN KEY (brand_id)
		REFERENCES brands(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT fk_items_classifications
		FOREIGN KEY (classification_id)
		REFERENCES classifications(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);
-------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS orders  (
	id SERIAL PRIMARY KEY,
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	customer_id INTEGER NOT NULL, --constraint relationship w/ cusotmers

	CONSTRAINT fk_orders_customers
		FOREIGN KEY (customer_id)
		REFERENCES	customers(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);
-------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS reviews  (
	customer_id INTEGER NOT NULL, --constraint relationship w/ customers
	item_id INTEGER NOT NULL, --constraint relationship w/ items
	-- composite primary key
	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	rating DECIMAL(3, 1) NOT NULL DEFAULT 0.0, --constraint <=10.0

	CONSTRAINT pk_reviews PRIMARY KEY (customer_id, item_id),
	CONSTRAINT ck_rating_is_below_value
		CHECK (rating <= 10.0),
	CONSTRAINT fk_reviews_customers
		FOREIGN KEY (customer_id)
		REFERENCES customers(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT fk_reviwes_items
		FOREIGN KEY (item_id)
		REFERENCES items(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);
-------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS orders_items  (
	order_id INTEGER NOT NULL, --constraint relationship w/ orders
	item_id INTEGER NOT NULL, --constraint relationship w/ items
	--coomposite primary key
	quantity INTEGER NOT NULL, --constraint >= 0

	CONSTRAINT pk_orders_items PRIMARY KEY (order_id, item_id),
	CONSTRAINT ck_quantity_is_positive
		CHECK(quantity >= 0),
	CONSTRAINT fk_order_items_orders
		FOREIGN KEY (order_id)
		REFERENCES orders(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	CONSTRAINT fk_orders_items_items
		FOREIGN KEY (item_id)
		REFERENCES items(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);
-------------------------------------------------------------------------------