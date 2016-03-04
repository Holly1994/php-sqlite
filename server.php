<?php

$db = new SQLite3('company.db');

$results = $db->query('SELECT * FROM company');

$rows = array();

while($res = $results->fetchArray(SQLITE3_ASSOC)) {
    array_push($rows, $res);
}

echo json_encode($rows);
