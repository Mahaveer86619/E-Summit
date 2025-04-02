CREATE TABLE Skills (
    skill_id SERIAL PRIMARY KEY,
    skill_name VARCHAR(255)
);
CREATE TABLE JobPortals (
    portal_id SERIAL PRIMARY KEY,
    portal_name VARCHAR(255)
);
CREATE TABLE Jobs (
    job_id SERIAL PRIMARY KEY,
    job_title VARCHAR(255),
    company VARCHAR(255),
    location VARCHAR(255),
    description TEXT,
    portal_id INTEGER REFERENCES JobPortals(portal_id)
);
CREATE TABLE JobRequiredSkills (
    job_id INTEGER REFERENCES Jobs(job_id),
    skill_id INTEGER REFERENCES Skills(skill_id),
    PRIMARY KEY (job_id, skill_id)
);
INSERT INTO Skills (skill_name) VALUES ('Python'), ('FastAPI'), ('PostgreSQL'), ('Docker');
INSERT INTO JobPortals (portal_name) VALUES ('LinkedIn'), ('Indeed');
INSERT INTO Jobs (job_title, company, location, description, portal_id) VALUES ('FastAPI Developer', 'Tech Corp', 'Remote', 'Develop APIs with FastAPI.', 1), ('Python Engineer', 'Data Inc', 'New York', 'Data processing with Python.', 2);
INSERT INTO JobRequiredSkills (job_id, skill_id) VALUES (1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (2, 3);
