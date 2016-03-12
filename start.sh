php -S localhost:8000 > php.out 2>&1 &
rm station.db
sqlite3 station.db < station.sql

