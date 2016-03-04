<?php

$db = new SQLite3('company.db');

$results = $db->query('SELECT * FROM company');

$jsonData = array();
while ($row = $results->fetchArray()) {
    $jsonData = $row;
}

echo json_encode($jsonData);

#echo xmlrpc_encode ($jsonData);
