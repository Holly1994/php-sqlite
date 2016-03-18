<?php

$db = new SQLite3('station.db');

$sql = <<<EOD
    SELECT name, low_value, high_value
    FROM mesurement;
EOD;

$results = $db->query($sql);

$rows = array();

while($res = $results->fetchArray(SQLITE3_ASSOC)) {
    array_push($rows, $res);
}

echo json_encode($rows);
