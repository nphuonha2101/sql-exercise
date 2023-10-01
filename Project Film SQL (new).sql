create table user_info(
	username varchar(255) primary key not null,
	user_fullname varchar(255) not null,
	user_email varchar(255) not null,
	user_password varchar(255) not null,
	account_role varchar(255) not null
);

create table film(
	film_id varchar(255) primary key not null,
	film_name varchar(255) not null,
	film_price varchar(255) not null,
	film_director varchar(255) not null,
	film_actors varchar(255) not null,
	film_length int not null,
	film_description varchar,
	img_path varchar(255)
);
 create table theater(
 theater_id varchar(255)  primary key not null ,
 theater_name varchar(255) not null,
 tax_number varchar(15) not null,
 theater_address varchar(255) not null
 );
create table room(
	room_id varchar(255) primary key not null,
	room_name varchar(255) not null,
	seat_rows int  not null,
	seat_cols int  not null,
	seat_matrix varchar(255) not null,
	theater_id varchar(255) not null references theater(theater_id)
);

create table showtime(
showtime_id varchar(255) primary key  not null,
film_id varchar(255) not null references film(film_id),
room_id varchar(255) not null references room(room_id),
showtime_date date not null
);

create table genre(
 genre_id varchar(255)  primary key not null ,
 genre_name varchar(255) not null,
 genre_description varchar not null
);

create table film_genre(
	genre_id varchar(255) not null references genre(genre_id),
	film_id varchar(255) not null references film(film_id),
	primary key (genre_id, film_id)
);

 create table booking_film(
 booking_film_id varchar(255)  primary key not null ,
 showtime_id varchar(255) references showtime(showtime_id) not null,
 username varchar(255) references user_info(username)  not null,
 booking_date date not null,
 seat varchar(4) not null,
 total_price numeric not null
 );


 create table food(
 food_id varchar(255)  primary key not null ,
 food_name varchar(255) not null,
 food_price numeric not null
);
create table booking_food(
 film_id varchar(255) references film(film_id) not null,
 food_id varchar(255) references food(food_id) not null,
 primary key(film_id,food_id)
);



create view genre_detail_view
as
select genre.genre_id, genre.genre_name, film_genre.film_id
from genre inner join film_genre ON film_genre.genre_id = genre.genre_id;
select * from genre_detail_view;

SELECT * from user_info;

insert into genre(genre_id, genre_name, genre_description)
values('haikich', 'Hài kịch', 'Thể loại Hài kịch');
