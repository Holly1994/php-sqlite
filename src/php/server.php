<?php

function get ($sql) {
    $db = new SQLite3('station.db');
    $results = $db->query($sql);
    $rows = array();
    while($res = $results->fetchArray(SQLITE3_ASSOC)) {
        array_push($rows, $res);
    }
    return $rows;
}

$sql_color = <<<EOD
    SELECT
    quantity, value_low, color_low, value_high, color_high, color_default
    FROM threshold;
EOD;

$sql_data = <<<EOD
    SELECT
        name, max(temperature_value) as temperature, max(humidity_value) as humidity
    FROM (
        SELECT
        station.name AS name,
        date,
        CASE threshold.quantity WHEN 'temperature' THEN value END AS temperature_value,
        CASE threshold.quantity WHEN 'humidity' THEN value END AS humidity_value
        FROM data, station, threshold
        WHERE
        data.id_threshold = threshold.id AND
        data.id_station = station.id
    ) GROUP BY name;
EOD;

$sql_user = <<<EOF
    SELECT name, password
    FROM user;
EOF;

echo json_encode(array(
    'data' => get($sql_data),
    'colors' => get($sql_color),
    'users' => get($sql_user)
));


