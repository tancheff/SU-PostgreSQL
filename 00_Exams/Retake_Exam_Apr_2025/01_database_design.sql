------------- PLANETS -------------
CREATE TABLE planets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE
);

------------- SPACESHIPS -------------
CREATE TABLE spaceships (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE,
    manufacturer VARCHAR(50),
    speed INTEGER NOT NULL DEFAULT 1000
);

------------- COLONISTS -------------
CREATE TABLE colonists (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    identity CHAR(10) NOT NULL UNIQUE,
    birth_date DATE NOT NULL
);

------------- STATIONS -------------
CREATE TABLE stations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    max_capacity INTEGER NOT NULL CHECK (max_capacity >= 0),
    planet_id INTEGER NOT NULL
		REFERENCES planets(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

------------- JOURNEYS -------------
CREATE TABLE journeys (
    id SERIAL PRIMARY KEY,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    purpose VARCHAR(8) NOT NULL CHECK (purpose IN ('Civil', 'Military')),
    station_id INTEGER NOT NULL
		REFERENCES stations(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    spaceship_id INTEGER NOT NULL
		REFERENCES spaceships(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

------------- ASSIGNMENTS -------------
CREATE TABLE assignments (
    colonist_id INTEGER NOT NULL
		REFERENCES colonists(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    journey_id INTEGER NOT NULL
		REFERENCES journeys(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    task TEXT NOT NULL DEFAULT 'Engineering activities',
    PRIMARY KEY (colonist_id, journey_id)
);