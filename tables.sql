CREATE TABLE stores (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64),
    latitude FLOAT,
    longitude FLOAT,
    location GEOGRAPHY(POINT,4326)
);