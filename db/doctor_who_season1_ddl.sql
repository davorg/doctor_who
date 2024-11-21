
-- Create the 'season' table
CREATE TABLE season (
    season_id INTEGER PRIMARY KEY AUTOINCREMENT,
    season_number INTEGER NOT NULL,
    start_date DATE,
    end_date DATE,
    main_doctor_id INTEGER,
    FOREIGN KEY (main_doctor_id) REFERENCES doctor(doctor_id)
);

-- Create the 'doctor' table
CREATE TABLE doctor (
    doctor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    start_date DATE,
    end_date DATE
);

-- Create the 'actor' table
CREATE TABLE actor (
    actor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    birth_date DATE,
    death_date DATE
);

-- Create the 'doctor_actor' table
CREATE TABLE doctor_actor (
    doctor_actor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    doctor_id INTEGER NOT NULL,
    actor_id INTEGER NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);

-- Create the 'story' table
CREATE TABLE story (
    story_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    season_id INTEGER NOT NULL,
    number_in_season INTEGER NOT NULL,
    main_doctor_id INTEGER NOT NULL,
    FOREIGN KEY (season_id) REFERENCES season(season_id),
    FOREIGN KEY (main_doctor_id) REFERENCES doctor(doctor_id)
);

-- Create the 'episode' table
CREATE TABLE episode (
    episode_id INTEGER PRIMARY KEY AUTOINCREMENT,
    story_id INTEGER NOT NULL,
    episode_number_in_story INTEGER NOT NULL,
    title TEXT,
    air_date DATE NOT NULL,
    FOREIGN KEY (story_id) REFERENCES story(story_id)
);

-- Create the 'companion' table
CREATE TABLE companion (
    companion_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    actor_id INTEGER NOT NULL,
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);

-- Create the 'companion_appearance' table
CREATE TABLE companion_appearance (
    appearance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    story_id INTEGER NOT NULL,
    companion_id INTEGER NOT NULL,
    FOREIGN KEY (story_id) REFERENCES story(story_id),
    FOREIGN KEY (companion_id) REFERENCES companion(companion_id)
);
