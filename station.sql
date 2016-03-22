PRAGMA foreign_keys = ON;

CREATE TABLE threshold (
    id INTEGER,
    quantity CHAR(20), --  a value or component that may be expressed in numbers: humidity, temperature
    color_default CHAR(20),
    color_high CHAR(20),
    color_low CHAR(20),
    value_high CHAR(20),
    value_low CHAR(20),
    PRIMARY KEY(id),
    UNIQUE (quantity)
);

CREATE TABLE station (
    id INTEGER,
    name CHAR(50),
    PRIMARY KEY(id),
    UNIQUE (name)
);

CREATE TABLE data (
    id KEY,
    date DATETIME,
    id_station INTEGER,
    id_threshold INTEGER,
    value REAL,
    FOREIGN KEY(id_station) REFERENCES station(id),
    FOREIGN KEY(id_threshold) REFERENCES threshold(id),
    PRIMARY KEY(id),
    UNIQUE (date, id_station, id_threshold)
);

--
-- Insert data
--

INSERT INTO station (name)
VALUES ('Cagliari'), ('Nuoro'), ('Oristano');

INSERT INTO threshold (quantity, color_default, value_low, color_low, value_high, color_high)
VALUES ('temperature', 'success', 18, 'info', 22, 'danger'),
('humidity', 'success', 50, 'info', 60, 'danger');

INSERT INTO data (id_station, id_threshold, value, date)
VALUES (1, 1, 15, 1458318738), (2, 1, 4, 1458318738), (3, 1, 10, 1458318738),
(1, 2, 72, 1458318738), (2, 2, 54, 1458318738), (3, 2, 69, 1458318738);
