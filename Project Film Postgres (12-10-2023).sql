create table user_info(
	username varchar(50) not null primary key,
	user_fullname varchar(100) not null, 
	user_email varchar(50) not null,
	user_password varchar(50) not null,
	account_role varchar(10) not null
);

create table film(
	film_id serial primary key,
	film_name varchar(100) not null, 
	film_price numeric not null,
	film_director varchar(100) not null,
	film_castors varchar(255) not null,
	film_length int not null,
	film_description varchar,
	img_path varchar(255) not null
);

create table theater(
	theater_id serial primary key,
	theater_name varchar(255) not null,
	tax_code varchar(20) not null,
	theater_address varchar(255) not null
);

create table room(
	room_id serial primary key,
	room_name varchar(50),
	theater_id int references theater(theater_id),
	seat_rows int not null, 
	seat_cols int not null,
	seat_data varchar not null
);

create table showtime(
	showtime_id serial primary key, 
	film_id int references film(film_id),
	room_id int references room(room_id),
	showtime_date date not null
);

create table film_booking(
	film_booking_id serial primary key,
	username varchar(50) references user_info(username),
	showtime_id int references showtime(showtime_id),
	booking_date date not null,
	seats varchar(100) not null,
	total_fee numeric not null
);

create table genre(
	genre_id varchar(30) not null primary key,
	genre_name varchar(50) not null
);

create table film_genre(
	film_id int references film(film_id),
	genre_id varchar(30) references genre(genre_id),
	primary key (film_id, genre_id)
);

create table food(
	food_id varchar(50) not null primary key,
	food_name varchar(100) not null,
	food_price numeric not null
);

create table food_booking(
	food_booking_id serial primary key,
	food_id varchar(50) references food(food_id),
	film_booking_id int references film_booking(film_booking_id)
);

create view v_showtime_details
as 
select showtime.showtime_id, film.film_name, room.room_name, theater.theater_name, showtime.showtime_date
from showtime inner join film on showtime.film_id = film.film_id
inner join room on showtime.room_id = room.room_id
inner join theater on room.theater_id = theater.theater_id;

select * from v_showtime_details;

