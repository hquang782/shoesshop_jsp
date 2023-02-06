create database shoes;
use shoes;

create table `account`(
	`id` int(255) primary key auto_increment,
    `name` varchar(255) not null,
    `username` varchar(50) not null unique,
    `password` varchar(50) not null,
    `role` int(20) not null,
    `dob` date not null,
    `phone` varchar(20) not null,
    `created_at` datetime not null
);
