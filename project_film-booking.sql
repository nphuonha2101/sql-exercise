create database FilmBooking;

create table user_info(
	username varchar(255) not null primary key,
	user_fullname varchar(255) not null,
	user_email varchar(255) not null,
	user_password varchar(255) not null,
	user_role varchar(10) not null
);

create table film(
	film_id varchar(255) not null primary key,
	film_name varchar(255) not null,
	film_price varchar(255) not null,
	room_id varchar(255) not null,
	genre varchar(255) not null,
	img_path varchar
)


insert into film(film_id, film_name, film_price, room_id, genre) 
values ('US-DTS', 'Doctor Strange', '50000', 'R101','Hành động');

insert into film(film_id, film_name, film_price, room_id, genre) 
values ('US-IRM', 'Iron Man', '60000', 'R203', 'Hành động');

insert into film(film_id, film_name, film_price, room_id, genre) 
values ('US-SPM', 'Spider Man', '55000', 'R302', 'Hành động');

insert into film(film_id, film_name, film_price, room_id, genre) 
values ('US-WWM', 'Wonder Woman', '53000', 'R205', 'Hành động');


select * from film;
select * from user_info;
