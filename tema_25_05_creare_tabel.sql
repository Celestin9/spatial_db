CREATE EXTENSION postgis;

CREATE TABLE IF NOT EXISTS tip_zona_verde (
    fid SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tip_vegetatie (
    fid SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tip_mobilier_urban (
    fid SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS zona_verde (
    fid SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(255) NOT NULL,
    tip_zona_verde_fid INTEGER REFERENCES tip_zona_verde(fid),
    geom GEOMETRY(Polygon, 4326)
);

CREATE TABLE IF NOT EXISTS vegetatie (
    fid SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(255) NOT NULL,
    tip_vegetatie_fid INTEGER REFERENCES tip_vegetatie(fid),
    zona_verde_id INTEGER REFERENCES zona_verde(fid),
    geom GEOMETRY(Point, 4326)
);

CREATE TABLE IF NOT EXISTS mobilier_urban (
    fid SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(255) NOT NULL,
    tip_mobilier_urban_fid INTEGER REFERENCES tip_mobilier_urban(fid),
    zona_verde_id INTEGER REFERENCES zona_verde(fid),
    geom GEOMETRY(Point, 4326)
);


CREATE TABLE IF NOT EXISTS sistem_irigare (
    fid SERIAL PRIMARY KEY NOT NULL,
    nume VARCHAR(255) NOT NULL,
	zona_verde_fid INTEGER NOT NULL,
    zona_verde_id INTEGER REFERENCES zona_verde(fid),
    geom GEOMETRY(LineString, 4326)
);
