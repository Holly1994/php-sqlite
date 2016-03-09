<?php

$db = new SQLite3('company.db');

$sql = <<<EOD
    SELECT
    station.name as name,
    mesurement.name as measurement,
    data.value as value,
    mesurement.default_color as color
    FROM data, station, mesurement
    WHERE
    data.id_mesurement = mesurement.id AND
    data.id_station = station.id AND
    station.id = mesurement.id_station
EOD;

$results = $db->query($sql);

$rows = array();

while($res = $results->fetchArray(SQLITE3_ASSOC)) {
    array_push($rows, $res);
}

echo json_encode($rows);
