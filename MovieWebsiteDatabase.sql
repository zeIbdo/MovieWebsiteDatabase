create database MovieWebsiteDatabase
Use MovieWebsiteDatabase
CREATE TABLE Genres (
    id INTEGER PRIMARY KEY identity,
    Name NVARCHAR(255) NOT NULL
)
CREATE TABLE Movies (
    id INTEGER PRIMARY KEY identity,
    Name NVARCHAR(255) NOT NULL,
    Description TEXT,
    IMDB DECIMAL(3, 1),
	Check(IMDB<=10)
)
CREATE TABLE Actors (
    id INTEGER PRIMARY KEY identity,
    FullName NVARCHAR(255) NOT NULL,
    BirthDate DATE
)
CREATE TABLE Directors (
    id INTEGER PRIMARY KEY identity,
    FullName NVARCHAR(255) NOT NULL,
    BirthDate DATE
)
-- Create MovieGenres table because one movie can have multiple genres and one genre can have multiple movies too
CREATE TABLE MovieGenres (
    MovieId INT REFERENCES Movies(id),
    GenreId INTEGER REFERENCES Genres(id),
    PRIMARY KEY (MovieId, GenreId)
)

CREATE TABLE MovieActors (
    MovieId INTEGER REFERENCES Movies(id),
    ActorId INTEGER REFERENCES Actors(id),
    PRIMARY KEY (MovieId, ActorId)
)
-- Create MovieDirectors table because one movie can have multiple directors and one director can have multiple movies too

CREATE TABLE MovieDirectors (
    MovieId INTEGER REFERENCES Movies(id),
    DirectorId INTEGER REFERENCES Directors(id),
    PRIMARY KEY (MovieId, DirectorId)
)
CREATE TABLE Reviews (
    id INTEGER PRIMARY KEY identity,
    ReviewerName NVARCHAR(255),
    MovieId INTEGER FOREIGN KEY (MovieId) REFERENCES Movies(id),
    Summary TEXT,
    Rating DECIMAL(3, 1) ,
	Check(Rating<=10)
)
INSERT INTO Movies (Name, Description, IMDB) 
VALUES
('Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.', 8.8),
('The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 9.2),
('The Dark Knight', 'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.', 9.0),
('The Priest', 'A horror thriller about a priest who uncovers dark secrets while investigating mysterious occurrences.', 5.7),
('Cloud Atlas', 'An exploration of how the actions of individual lives impact one another in the past, present, and future.', 7.4);

INSERT INTO Genres (Name) VALUES ('Action');
INSERT INTO Genres (Name) VALUES ('Drama');
INSERT INTO Genres (Name) VALUES ('Sci-Fi');
INSERT INTO Genres (Name) VALUES ('Horror');
INSERT INTO Genres (Name) VALUES ('Adventure');
INSERT INTO Genres (Name) VALUES ('Comedy'); 
INSERT INTO Genres (Name) VALUES ('Romance'); 

INSERT INTO Actors (FullName, BirthDate) VALUES 
('Leonardo DiCaprio', '1974-11-11'),
('Marlon Brando', '1924-04-03'),
('Christian Bale', '1974-01-30'),
('Tom Hanks', '1956-07-09'),
('Michael Caine', '1933-03-14'),
('Heath Ledger', '1979-04-04'),
('Joseph Gordon-Levitt', '1981-02-17'),
('Cate Blanchett', '1969-05-14'),
('Hugo Weaving', '1960-04-04'),
('Paul Bettany', '1971-05-27'),
('Cam Gigandet', '1982-08-16'),
('Karl Urban', '1972-06-07'),
('Al Pacino', '1940-04-25'); 

INSERT INTO Directors (FullName, BirthDate) VALUES 
('Christopher Nolan', '1970-07-30'),
('Francis Ford Coppola', '1939-04-07'),
('Scott Stewart', '1971-03-08'), 
('Andy Wachowski', '1967-12-29'),
('Lana Wachowski', '1965-06-21');

INSERT INTO Directors (FullName, BirthDate) VALUES 
('Steven Spielberg', '1946-12-18'),
('Martin Scorsese', '1942-11-17');

INSERT INTO MovieGenres (MovieId, GenreId) VALUES (1, (SELECT id FROM Genres WHERE Name = 'Action'));
INSERT INTO MovieGenres (MovieId, GenreId) VALUES (1, (SELECT id FROM Genres WHERE Name = 'Sci-Fi'));
INSERT INTO MovieGenres (MovieId, GenreId) VALUES (2, (SELECT id FROM Genres WHERE Name = 'Drama'));
INSERT INTO MovieGenres (MovieId, GenreId) VALUES (3, (SELECT id FROM Genres WHERE Name = 'Action'));
INSERT INTO MovieGenres (MovieId, GenreId) VALUES (4, (SELECT id FROM Genres WHERE Name = 'Horror'));
INSERT INTO MovieGenres (MovieId, GenreId) VALUES (5, (SELECT id FROM Genres WHERE Name = 'Adventure'));
INSERT INTO MovieGenres (MovieId, GenreId) VALUES (5, (SELECT id FROM Genres WHERE Name = 'Sci-Fi'));

INSERT INTO MovieActors (MovieId, ActorId) VALUES (1, (SELECT id FROM Actors WHERE FullName = 'Leonardo DiCaprio'));
INSERT INTO MovieActors (MovieId, ActorId) VALUES (1, (SELECT id FROM Actors WHERE FullName = 'Joseph Gordon-Levitt'));
INSERT INTO MovieActors (MovieId, ActorId) VALUES (1, (SELECT id FROM Actors WHERE FullName = 'Michael Caine'));

INSERT INTO MovieActors (MovieId, ActorId) VALUES (2, (SELECT id FROM Actors WHERE FullName = 'Marlon Brando'));
INSERT INTO MovieActors (MovieId, ActorId) VALUES (2, (SELECT id FROM Actors WHERE FullName = 'Al Pacino')); 

INSERT INTO MovieActors (MovieId, ActorId) VALUES (3, (SELECT id FROM Actors WHERE FullName = 'Christian Bale'));
INSERT INTO MovieActors (MovieId, ActorId) VALUES (3, (SELECT id FROM Actors WHERE FullName = 'Heath Ledger'));

INSERT INTO MovieActors (MovieId, ActorId) VALUES (4, (SELECT id FROM Actors WHERE FullName = 'Paul Bettany'));
INSERT INTO MovieActors (MovieId, ActorId) VALUES (4, (SELECT id FROM Actors WHERE FullName = 'Cam Gigandet'));
INSERT INTO MovieActors (MovieId, ActorId) VALUES (4, (SELECT id FROM Actors WHERE FullName = 'Karl Urban'));

INSERT INTO MovieActors (MovieId, ActorId) VALUES (5, (SELECT id FROM Actors WHERE FullName = 'Tom Hanks'));
INSERT INTO MovieActors (MovieId, ActorId) VALUES (5, (SELECT id FROM Actors WHERE FullName = 'Hugo Weaving'));
INSERT INTO MovieActors (MovieId, ActorId) VALUES (5, (SELECT id FROM Actors WHERE FullName = 'Cate Blanchett'));

INSERT INTO MovieDirectors (MovieId, DirectorId) VALUES (1, (SELECT id FROM Directors WHERE FullName = 'Christopher Nolan'));
INSERT INTO MovieDirectors (MovieId, DirectorId) VALUES (2, (SELECT id FROM Directors WHERE FullName = 'Francis Ford Coppola'));
INSERT INTO MovieDirectors (MovieId, DirectorId) VALUES (3, (SELECT id FROM Directors WHERE FullName = 'Christopher Nolan'));
INSERT INTO MovieDirectors (MovieId, DirectorId) VALUES (4, (SELECT id FROM Directors WHERE FullName = 'Scott Stewart'));
INSERT INTO MovieDirectors (MovieId, DirectorId) VALUES (5, (SELECT id FROM Directors WHERE FullName = 'Andy Wachowski'));
INSERT INTO MovieDirectors (MovieId, DirectorId) VALUES (5, (SELECT id FROM Directors WHERE FullName = 'Lana Wachowski'));

INSERT INTO Reviews (ReviewerName, MovieId, Summary, Rating) VALUES ('Alice', 1, 'An incredible film with a unique concept.', 9.0);
INSERT INTO Reviews (ReviewerName, MovieId, Summary, Rating) VALUES ('Bob', 2, 'A masterpiece of cinema.', 10.0);
INSERT INTO Reviews (ReviewerName, MovieId, Summary, Rating) VALUES ('Charlie', 3, 'The best Batman movie ever made.', 9.5);
INSERT INTO Reviews (ReviewerName, MovieId, Summary, Rating) VALUES ('David', 4, 'A decent horror film with some intriguing moments.', 5.7);
INSERT INTO Reviews (ReviewerName, MovieId, Summary, Rating) VALUES ('Eva', 5, 'An ambitious film with a complex narrative.', 7.5);
-- Movies with IMDb over 7
SELECT 
    m.Name AS MovieName,
    m.Description,
    m.IMDB
FROM 
    Movies m
WHERE 
    m.IMDB > 7
	-- Actors who played in movies that are in the Movies table
SELECT 
    a.FullName AS ActorName,
    m.Name AS MovieName
FROM 
    Actors a
JOIN 
    MovieActors ma ON a.id = ma.ActorId
JOIN 
    Movies m ON ma.MovieId = m.id
	-- List of Movies with Their Genres, Actors, and Directors
SELECT 
    m.Name AS MovieName,
    m.Description,
    m.IMDB,
    g.Name AS GenreName,
    a.FullName AS ActorName,
    d.FullName AS DirectorName
FROM 
    Movies m
JOIN 
    MovieGenres mg ON m.id = mg.MovieId
JOIN 
    Genres g ON mg.GenreId = g.id
LEFT JOIN 
    MovieActors ma ON m.id = ma.MovieId
LEFT JOIN 
    Actors a ON ma.ActorId = a.id
LEFT JOIN 
    MovieDirectors md ON m.id = md.MovieId
LEFT JOIN 
    Directors d ON md.DirectorId = d.id
ORDER BY 
    m.Name, g.Name, a.FullName, d.FullName;
