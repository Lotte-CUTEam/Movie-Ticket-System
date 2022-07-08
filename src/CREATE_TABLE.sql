DROP TABLE  if exists `SCREEN`;
DROP TABLE  if exists `RESERVATION`;
DROP TABLE  if exists `MEMBER`;
DROP TABLE  if exists `MOVIE`;


CREATE TABLE `MEMBER` (
	`member_id`	varchar(50)	NOT NULL  PRIMARY KEY ,
	`name`	varchar(50)	NOT NULL,
	`email`	varchar(200)	NOT NULL,
	`pwd`	varchar(50)	NOT NULL,
	`phone_number`	varchar(50)	NOT NULL,
	`created_at`	timestamp	NOT NULL
);

CREATE TABLE `MOVIE` (
	`movie_id`	bigint	NOT NULL  auto_increment PRIMARY KEY,
	`title`	varchar(200)	NOT NULL,
	`director`	varchar(50)	NOT NULL,
	`actor`	varchar(500)	NULL,
	`opening_date`	timestamp	NULL,
	`rating`	varchar(10)	NULL,
	`runtime`	int	NULL,
	`image_url`	varchar(500)	NULL,
    `genre`		varchar(100)	NULL,
    `rated`		int				NOT NULL
);

CREATE TABLE `RESERVATION` (
	`reservation_id`	bigint	NOT NULL  auto_increment ,
	`member_id`	varchar(50)	NOT NULL,
	`screen_id`	bigint	NOT NULL,
	`movie_id`	int	NOT NULL,
	`screen_at`	timestamp	NOT NULL,
	`people_count`	int	NOT NULL,
	`cinema`	varchar(50)	NOT NULL,
	`title`	varchar(200)	NOT NULL,
	`runtime`	int	NULL,
	`created_at`	timestamp	NOT NULL,
	`deleted_at`	timestamp	NULL,
	`status`	int	NOT NULL,

	PRIMARY KEY (reservation_id, member_id)
);

CREATE TABLE `SCREEN` (
	`screen_id`	bigint	NOT NULL  auto_increment ,
	`movie_id`	bigint	NOT NULL,
	`screen_at`	timestamp	NOT NULL,
	`cinema`	varchar(100)	NOT NULL,
	PRIMARY KEY (screen_id, movie_id)

);



ALTER TABLE `RESERVATION` ADD CONSTRAINT `FK_MEMBER_TO_RESERVATION_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `MEMBER` (
	`member_id`
);

ALTER TABLE `SCREEN` ADD CONSTRAINT `FK_MOVIE_TO_SCREEN_1` FOREIGN KEY (
	`movie_id`
)
REFERENCES `MOVIE` (
	`movie_id`
);



