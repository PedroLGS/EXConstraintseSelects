CREATE DATABASE projetos

USE projetos

CREATE TABLE users(
id                 INT               IDENTITY(1,1)                 NOT NULL,
name               VARCHAR(45)                                     NOT NULL,
username           VARCHAR(45)                                     NOT NULL,
password           VARCHAR(45)                                     NOT NULL,
email              VARCHAR(45)                                     NOT NULL
PRIMARY KEY (id)
)

ALTER TABLE users
ADD CONSTRAINT username UNIQUE (username)
ALTER TABLE users
ADD CONSTRAINT password DEFAULT '123mudar' FOR password

EXEC sp_help users

CREATE TABLE users_has_projects(
users_id           INT                                             NOT NULL,
projects_id        INT                                             NOT NULL
PRIMARY KEY (users_id, projects_id)
FOREIGN KEY (users_id) REFERENCES users (id),
FOREIGN KEY (projects_id) REFERENCES projects (id)
)

CREATE TABLE projects(
id                 INT                IDENTITY(10001,1)            NOT NULL,
name               VARCHAR(45)                                     NOT NULL,
description        VARCHAR(45)                                     NULL,
date               DATETIME           CHECK(date > '01-09-2014')   NOT NULL
PRIMARY KEY (id)
)

ALTER TABLE users
DROP CONSTRAINT username

ALTER TABLE users
ALTER COLUMN username VARCHAR(10) NOT NULL

ALTER TABLE users
ALTER COLUMN password VARCHAR(8) NOT NULL

SELECT * FROM users
SELECT * FROM projects
SELECT * FROM users_has_projects

INSERT INTO users VALUES
('Maria', 'Rh_maria', 'maria@empresa.com')

INSERT INTO users VALUES
('Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com')

INSERT INTO users VALUES
('Ana', 'Rh_ana', 'ana@empresa.com')

INSERT INTO users VALUES
('Clara', 'Ti_clara', 'clara@empresa.com')

INSERT INTO users VALUES
('Aparecido', 'Rh_apareci', '55@!cido', 'aparecido@empresa.com')

INSERT INTO projects VALUES
('Re-folha', 'Refatoração das Folhas', '05-09-2014'),
('Manutenção PC ́s', 'Manutenção PC ́s', '06-09-2014'),
('Auditoria ', NULL, '07-09-2014')

INSERT INTO users_has_projects VALUES
('1', '10001'),
('5', '10001'),
('3', '10003'),
('4', '10002'),
('2', '10002')

UPDATE projects
SET date = '12-09-2014'
WHERE name = 'Manutenção PC ́s'

UPDATE users
SET username = 'Rh_cido'
WHERE name = 'Aparecido'

UPDATE users
SET password = '888@*'
WHERE username = 'Rh_maria' AND password = '123mudar' 

DELETE users_has_projects
WHERE users_id = 2