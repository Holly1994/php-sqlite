php -S localhost:8000 > php.out 2>&1 &
rm ./src/php/station.db
sqlite3 ./src/php/station.db < station.sql

