CREATE TABLE company (
        id              INTEGER	    PRIMARY KEY,
        name            char(50)    NOT NULL,
        age             int         NOT NULL,
        address         char(50),
        salary          real
);

INSERT INTO COMPANY (name, age, address, salary)
VALUES ('Buffon', 32, 'Italy', 20000.00 );

INSERT INTO COMPANY (name, age, address, salary)
VALUES ('Zaza', 32, 'Italy', 20000.00 );
