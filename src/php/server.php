<?php

$db = new SQLite3('station.db');

$sql = <<<EOD
    SELECT
    station.name as name,
    mesurement.name as measurement,
    data.value as value,
    case
    when data.value < low_value then mesurement.low_color
    when data.value > high_value then mesurement.high_color
    else mesurement.default_color
    end as color
    FROM data, station, mesurement
    WHERE
    data.id_mesurement = mesurement.id AND
    data.id_station = station.id AND
    station.id = mesurement.id_station;
EOD;

$results = $db->query($sql);

$rows = array();

while($res = $results->fetchArray(SQLITE3_ASSOC)) {
    array_push($rows, $res);
}

echo json_encode($rows);

// $sql = <<<EOD
//     SELECT station.name, low_value, high_value
//     FROM mesurement, station
//     WHERE station.id=mesurement.id_station;
// EOD;

// $results = $db->query($sql);

// $rows = array();

// while($res = $results->fetchArray(SQLITE3_ASSOC)) {
//     array_push($rows, $res);
// }

// echo json_encode($rows);
