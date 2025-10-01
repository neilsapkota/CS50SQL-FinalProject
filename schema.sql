
DROP TABLE IF EXISTS Cities;
CREATE TABLE Cities (
    city_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL,
    death INTEGER NOT NULL
);


CREATE INDEX idx_cities_city_id ON Cities(city_id);


DROP TABLE IF EXISTS Platforms;
CREATE TABLE Platforms (
    platform_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    date_banned TEXT,
    date_restored TEXT
);


CREATE INDEX idx_platforms_platform_id ON Platforms(platform_id);

DROP TABLE IF EXISTS Protests;
CREATE TABLE Protests (
    protest_id INTEGER PRIMARY KEY,
    city_id INTEGER NOT NULL,
    date TEXT NOT NULL,
    organizing_group TEXT,
    expected_size INTEGER,
    actual_size INTEGER,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);


CREATE INDEX idx_protests_protest_id ON Protests(protest_id);
CREATE INDEX idx_protests_city_id ON Protests(city_id);


DROP TABLE IF EXISTS Casualties;
CREATE TABLE Casualties (
    casualty_id INTEGER PRIMARY KEY,
    protest_id INTEGER NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('Injury','Death')),
    number INTEGER NOT NULL,
    FOREIGN KEY (protest_id) REFERENCES Protests(protest_id)
);


CREATE INDEX idx_casualties_casualty_id ON Casualties(casualty_id);
CREATE INDEX idx_casualties_protest_id ON Casualties(protest_id);

DROP TABLE IF EXISTS GovtResponses;
CREATE TABLE GovtResponses (
    response_id INTEGER PRIMARY KEY,
    protest_id INTEGER NOT NULL,
    measure TEXT NOT NULL,
    date TEXT NOT NULL,
    FOREIGN KEY (protest_id) REFERENCES Protests(protest_id)
);


CREATE INDEX idx_govt_responses_response_id ON GovtResponses(response_id);
CREATE INDEX idx_govt_responses_protest_id ON GovtResponses(protest_id);


DROP TABLE IF EXISTS DigitalCoordination;
CREATE TABLE DigitalCoordination (
    id INTEGER PRIMARY KEY,
    protest_id INTEGER NOT NULL,
    platform TEXT,
    purpose TEXT,
    participants INTEGER,
    FOREIGN KEY (protest_id) REFERENCES Protests(protest_id)
);


CREATE INDEX idx_digital_coordination_protest_id ON DigitalCoordination(protest_id);


CREATE VIEW ProtestSummary AS
SELECT
    p.protest_id,
    c.name AS city,
    p.date AS protest_date,
    p.organizing_group,
    p.expected_size,
    p.actual_size,
    (p.actual_size - p.expected_size) AS size_difference,
    SUM(casualties.number) AS total_casualties
FROM
    Protests p
JOIN
    Cities c ON p.city_id = c.city_id
LEFT JOIN
    Casualties casualties ON p.protest_id = casualties.protest_id
GROUP BY
    p.protest_id, c.name, p.date, p.organizing_group, p.expected_size, p.actual_size;


CREATE VIEW GovtResponseSummary AS
SELECT
    g.response_id,
    p.city_id,
    g.measure,
    g.date AS response_date,
    p.date AS protest_date,
    c.name AS city_name
FROM
    GovtResponses g
JOIN
    Protests p ON g.protest_id = p.protest_id
JOIN
    Cities c ON p.city_id = c.city_id;


CREATE VIEW ProtestsByCity AS
SELECT
    p.city_id,
    c.name AS city_name,
    p.date AS protest_date,
    g.measure AS govt_response
FROM
    Protests p
JOIN
    Cities c ON p.city_id = c.city_id
LEFT JOIN
    GovtResponses g ON p.protest_id = g.protest_id
ORDER BY p.date DESC;


CREATE INDEX idx_protests_by_city_date ON Protests(city_id, date);
