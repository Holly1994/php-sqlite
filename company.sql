PRAGMA foreign_keys = ON;

CREATE TABLE mesurement (
    id INTEGER PRIMARY KEY,
    id_station INTEGER,
    name char(20),
    default_color char(20),
    low_value char(20),
    low_color char(20),
    high_value char(20),
    high_color char(20),
    FOREIGN KEY(id_station) REFERENCES station(id)
);

CREATE TABLE station (
    id INTEGER PRIMARY KEY,
    name char(50)
);

CREATE TABLE data (
    id INTEGER PRIMARY KEY,
    id_station INTEGER,
    id_mesurement INTEGER,
    value REAL,
    FOREIGN KEY(id_station) REFERENCES station(id),
    FOREIGN KEY(id_mesurement) REFERENCES mesurement(id)
);

--
-- Insert data
--

INSERT INTO station (name)
VALUES ('Cagliari'), ('Nuoro'), ('Oristano');

INSERT INTO mesurement (id_station, name, default_color)
VALUES
(1, 'temperature', 'success'),
(2, 'temperature', 'warning'),
(3, 'temperature', 'danger');

INSERT INTO data (id_station, id_mesurement, value)
VALUES (1, 1, 15), (2, 2, 12), (3, 3, 2);


--
-- Query data
--

SELECT
station.name as name,
mesurement.name as measurement,
data.value as value,
mesurement.default_color as color
FROM data, station, mesurement
WHERE
data.id_mesurement = mesurement.id AND
data.id_station = station.id AND
station.id = mesurement.id_station

;