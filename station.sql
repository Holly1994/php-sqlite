PRAGMA foreign_keys = ON;

CREATE TABLE mesurement (
    id INTEGER PRIMARY KEY,
    id_station INTEGER,
    name char(20), -- humidity, temperature
    default_color char(20),
    low_value char(20),
    low_color char(20),
    high_value char(20),
    high_color char(20),
    -- TODO add time (auto)
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

INSERT INTO mesurement (id_station, name, default_color, low_value, low_color, high_value, high_color)
VALUES (1, 'temperature', 'success', 20, 'info', 28, 'danger'),
(2, 'temperature', 'success', 10, 'info', 20, 'danger'),
(3, 'temperature', 'success', 5, 'info', 10, 'danger');

INSERT INTO data (id_station, id_mesurement, value)
VALUES (1, 1, 22), (2, 2, 4), (3, 3, 31);


--
-- Query data
--

SELECT
station.name as name,
mesurement.name as measurement,
data.value as value,
case
when data.value < low_value then mesurement.low_color
when data.value > high_value then mesurement.high_color
else mesurement.default_color
end as color
FROM data, station, mesurement
WHERE
data.id_mesurement = mesurement.id AND
data.id_station = station.id AND
station.id = mesurement.id_station;