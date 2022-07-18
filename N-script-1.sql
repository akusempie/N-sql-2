create table if not exists Artists (
	id SERIAL primary key,
	name VARCHAR(60) unique not null
);

create table if not exists Genres (
	id SERIAL primary key,
	name VARCHAR(40) unique not null
);

create table if not exists ArtistGenres (
	artist_id INTEGER references Artist(id),
	genre_id INTEGER references Genres(id),
	constraint pk primary key (artist_id, genre_id)
);

create table if not exists Albums (
	id SERIAL primary key,
	name VARCHAR(60),
	year YEAR,
);

create table if not exists Tracks (
	id SERIAL primary key,
	name VARCHAR(80),
	duration TIME,
	album_id INTEGER references Albums(id)
);

create table if not exists Collections (
	id SERIAL primary key,
	name VARCHAR(80),
	year year,
);

create table if not exists AtistsAlbums (
	artist_id INTEGER references Artist(id),
	album_id INTEGER references Albums(id),
	constraint pk primary key (artist_id, album_id)
);

create table if not exists TracksCollections (
	track_id INTEGER references Tracks(id),
	collection_id INTEGER references Collections(id),
	constraints pk primary key (track_id, collection_id)
);
	