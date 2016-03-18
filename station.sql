PRAGMA foreign_keys = ON;

CREATE TABLE mesurement (
    id INTEGER,
    name char(20), -- humidity, temperature
    default_color char(20),
    low_value char(20),
    low_color char(20),
    high_value char(20),
    high_color char(20),
    PRIMARY KEY(id)
);

CREATE TABLE station (
    id INTEGER,
    name char(50),
    PRIMARY KEY(id)
);

CREATE TABLE data (
    -- TODO add time (auto)
    id KEY,
    date DATETIME,
    id_station INTEGER,
    id_mesurement INTEGER,
    value REAL,
    FOREIGN KEY(id_station) REFERENCES station(id),
    FOREIGN KEY(id_mesurement) REFERENCES mesurement(id),
    PRIMARY KEY(id)
);

--
-- Insert data
--

INSERT INTO station (name)
VALUES ('Cagliari'), ('Nuoro'), ('Oristano');

INSERT INTO mesurement (name, default_color, low_value, low_color, high_value, high_color)
VALUES ('temperature', 'success', 18, 'info', 22, 'danger'),
('humidity', 'success', 50, 'info', 60, 'danger');

INSERT INTO data (id_station, id_mesurement, value, date)
VALUES (1, 1, 15, 1458318738), (2, 1, 10, 1458318738), (3, 1, 14, 1458318738),
(1, 2, 72, 1458318738), (2, 2, 54, 1458318738), (3, 2, 69, 1458318738);


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
data.id_station = station.id;
