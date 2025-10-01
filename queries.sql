
SELECT
    p.protest_id,
    p.date AS protest_date,
    p.organizing_group,
    p.expected_size,
    p.actual_size
FROM
    Protests p
JOIN
    Cities c ON p.city_id = c.city_id
WHERE
    c.name = 'Kathmandu'
ORDER BY p.date;


SELECT
    p.protest_id,
    SUM(casualties.number) AS total_casualties
FROM
    Casualties casualties
JOIN
    Protests p ON casualties.protest_id = p.protest_id
WHERE
    p.protest_id = 1
GROUP BY
    p.protest_id;


SELECT
    g.measure,
    g.date AS response_date
FROM
    GovtResponses g
JOIN
    Protests p ON g.protest_id = p.protest_id
WHERE
    p.protest_id = 1
ORDER BY g.date;


SELECT
    c.name AS city_name,
    SUM(CASE WHEN casualties.type = 'Death' THEN casualties.number ELSE 0 END) AS total_deaths,
    SUM(CASE WHEN casualties.type = 'Injury' THEN casualties.number ELSE 0 END) AS total_injuries
FROM
    Casualties casualties
JOIN
    Protests p ON casualties.protest_id = p.protest_id
JOIN
    Cities c ON p.city_id = c.city_id
GROUP BY
    c.name
ORDER BY total_deaths DESC, total_injuries DESC;


SELECT
    d.platform,
    d.purpose,
    d.participants
FROM
    DigitalCoordination d
JOIN
    Protests p ON d.protest_id = p.protest_id
WHERE
    p.protest_id = 2;


SELECT
    p.organizing_group,
    COUNT(p.protest_id) AS number_of_protests
FROM
    Protests p
GROUP BY
    p.organizing_group
ORDER BY number_of_protests DESC;


SELECT
    name,
    date_banned,
    date_restored
FROM
    Platforms
WHERE
    name = 'Discord';


SELECT
    p.protest_id,
    c.name AS city_name,
    p.date AS protest_date,
    p.expected_size,
    p.actual_size
FROM
    Protests p
JOIN
    Cities c ON p.city_id = c.city_id
WHERE
    p.actual_size > p.expected_size
ORDER BY p.date DESC;


SELECT
    c.name AS city_name,
    COUNT(p.protest_id) AS number_of_protests,
    SUM(CASE WHEN casualties.type = 'Death' THEN casualties.number ELSE 0 END) AS total_deaths,
    SUM(CASE WHEN casualties.type = 'Injury' THEN casualties.number ELSE 0 END) AS total_injuries,
    GROUP_CONCAT(DISTINCT g.measure) AS government_measures
FROM
    Cities c
JOIN
    Protests p ON c.city_id = p.city_id
LEFT JOIN
    Casualties casualties ON p.protest_id = casualties.protest_id
LEFT JOIN
    GovtResponses g ON p.protest_id = g.protest_id
GROUP BY
    c.name
ORDER BY number_of_protests DESC;


SELECT
    platform,
    SUM(participants) AS total_participants
FROM
    DigitalCoordination
GROUP BY
    platform
ORDER BY total_participants DESC;

SELECT
    SUM(CASE WHEN casualties.type = 'Death' THEN casualties.number ELSE 0 END) AS total_deaths,
    SUM(CASE WHEN casualties.type = 'Injury' THEN casualties.number ELSE 0 END) AS total_injuries
FROM
    Casualties casualties;


SELECT
    p.protest_id,
    c.name AS city_name,
    p.date AS protest_date,
    p.expected_size,
    p.actual_size
FROM
    Protests p
JOIN
    Cities c ON p.city_id = c.city_id
WHERE
    p.date BETWEEN '2025-09-04' AND '2025-09-10'
ORDER BY p.date;
