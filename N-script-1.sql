CREATE TABLE IF NOT EXISTS Artists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60),
	year INTEGER NOT NULL,
		CHECK (YEAR > 1900 AND YEAR < 2022)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80),
	duration TIME,
	album_id INTEGER REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80),
	year INTEGER NOT NULL,
		CHECK (YEAR > 1900 AND YEAR < 2022)
);

CREATE TABLE IF NOT EXISTS AtistsAlbums (
	artist_id INTEGER REFERENCES Artists(id),
	album_id INTEGER REFERENCES Albums(id),
	CONSTRAINT pk_artistsalbums PRIMARY KEY (artist_id,
album_id)
);

CREATE TABLE IF NOT EXISTS TracksCollections (
	track_id INTEGER REFERENCES Tracks(id),
	collection_id INTEGER REFERENCES Collections(id),
	CONSTRAINT pk_trackscollections PRIMARY KEY (track_id,
	collection_id)
);

CREATE TABLE IF NOT EXISTS ArtistGenres (
	artist_id INTEGER REFERENCES Artists(id),
	genre_id INTEGER REFERENCES Genres(id),
	CONSTRAINT pk_artistgenres PRIMARY KEY (artist_id, genre_id)
);
