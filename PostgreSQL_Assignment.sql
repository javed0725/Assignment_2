CREATE DATABASE conservation_db

create Table rangers (
    rangers_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50)
);

INSERT INTO
    rangers (name, region)
VALUES ('Mee', 'Western Range'),
    ('Raj', 'Western Range'),
    ('Anika', 'Eastern Range'),
    ('Tariq', 'Eastern Range'),
    ('Sahil', 'Southern Range'),
    ('Kavya', 'Northern Range'),
    ('Rina', 'Western Range'),
    ('Dev', 'Western Range'),
    ('Ishaan', 'Eastern Range'),
    ('Nila', 'Central Range');

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50) CHECK (
        conservation_status IN (
            'Least consern',
            'Vulnerable',
            'Endangered',
            'Critically Endangered'
        )
    )
);

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Shadow Leopard',
        'Panthera pardus shadows',
        '2019-09-01',
        'Critically Endangered'
    ),
    (
        'Golden Langur',
        'Trachypithecus geei',
        '2018-12-05',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '2018-09-14',
        'Endangered'
    ),
    (
        'Indian Peacock',
        'Pavo cristatus',
        '2019-08-29',
        'Least consern'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '2020-02-12',
        'Vulnerable'
    ),
    (
        'Sloth Bear',
        'Melursus ursinus',
        '2018-11-03',
        'Vulnerable'
    ),
    (
        'Indian Python',
        'Python molurus',
        '2019-08-17',
        'Least consern'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '2020-10-01',
        'Endangered'
    ),
    (
        'Indian Pangolin',
        'Manis crassicaudata',
        '2019-07-12',
        'Endangered'
    ),
    (
        'Snow Leopard',
        'Panthera uncia',
        '2023-04-02',
        'Vulnerable'
    );

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    rangers_id INT REFERENCES rangers (rangers_id),
    species_id INT REFERENCES species (species_id),
    sighting_time TIMESTAMP without TIME zone,
    location VARCHAR(100),
    notes TEXT
);

INSERT INTO
    sightings (
        rangers_id,
        species_id,
        sighting_time,
        location,
        notes
    )
VALUES (
        1,
        7,
        '2025-02-04 10:23:54',
        'Shadow Valley',
        'Visual sighting'
    ),
    (
        8,
        5,
        '2025-02-20 17:13:04',
        'Shadow Valley',
        'Group activity'
    ),
    (
        1,
        4,
        '2025-01-28 05:20:34',
        'Elephant Corridor',
        'Nest found'
    ),
    (
        3,
        3,
        '2025-01-09 20:23:54',
        'Peacock Point',
        'Roar heard'
    ),
    (
        5,
        6,
        '2025-05-30 12:50:54',
        'Elephant Corridor',
        'Roar heard'
    );

INSERT INTO
    sightings
VALUES (
        1,
        8,
        5,
        '2025-02-20 23:18:04',
        'Shadow Valley',
        'Group activity'
    ),
    (
        2,
        1,
        4,
        '2025-01-28 11:20:34',
        'Elephant Corridor',
        'Nest found'
    );

INSERT INTO
    sightings
VALUES (
        3,
        8,
        5,
        '2010-02-20 13:18:04',
        'Snowfall Pass',
        'Group activity'
    ),
    (
        4,
        1,
        4,
        '2008-01-28 17:20:34',
        'Elephant Corridor',
        'Nest found'
    ),
    (
        5,
        1,
        4,
        '2005-01-28 19:40:34',
        'Elephant Pass ',
        'Nest found'
    );

INSERT INTO
    sightings
VALUES (
        11,
        1,
        7,
        '2005-01-28 19:40:34',
        'Elephant Pass ',
        'Nest found'
    );

SELECT * FROM sightings

-- Problem 1

INSERT INTO rangers VALUES ( '11', 'Derek Fox', 'Coastal Plains' );

-- Problem 2

SELECT COUNT(DISTINCT (species_id)) AS unique_species_count
FROM sightings;

-- Problem 3
SELECT * FROM sightings WHERE location ILIKE '%Pass%';