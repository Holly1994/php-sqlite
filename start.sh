php -S localhost:8000 > php.out 2>&1 &
rm company.db
sqlite3 company.db < company.sql

