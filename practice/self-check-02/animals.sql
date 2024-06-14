DROP TABLE IF EXISTS animals;

CREATE TABLE
    animals (
        animal_id TEXT NOT NULL,
        animal_name TEXT NOT NULL,
        created_at TIMESTAMP(0)
        WITH
            TIME ZONE NOT NULL DEFAULT NOW ()
    );

INSERT INTO
    animals (animal_id, animal_name)
VALUES
    ('GRF', 'Giraffe'),
    ('HPP', 'Hippopotamus'),
    ('JAG', 'Jaguar'),
    ('LEO', 'Lion'),
    ('PEA', 'Peacock');