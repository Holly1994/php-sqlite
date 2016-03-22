<?php

$db = new SQLite3('station.db');

$sql = <<<EOD
    SELECT quantity, value_low, value_high
    FROM threshold;
EOD;

$results = $db->query($sql);

$rows = array();

while($res = $results->fetchArray(SQLITE3_ASSOC)) {
    array_push($rows, $res);
}

echo json_encode($rows);
