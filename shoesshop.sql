create database shoes;
use shoes;

CREATE TABLE `accounts` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(128) UNIQUE,
    `email` VARCHAR(128) UNIQUE,
    `password` VARCHAR(128),
    `role` VARCHAR(128),
    `fname` VARCHAR(128),
    `dob` VARCHAR(128),
    `phone_number` VARCHAR(128)
);

CREATE TABLE `categories` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(128)
);

CREATE TABLE `products` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `category_id` INT(11),
    `name` VARCHAR(128),
    `created_at` VARCHAR(128),
    `price` INT(11),
    `description` VARCHAR(128),
    `image_link` VARCHAR(128),
    `image_list` TEXT,
    FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id`)
);

CREATE TABLE `product_details` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `product_id` INT(11) NOT NULL,
    `size` INT(11),
    `quantity` INT(11),
    FOREIGN KEY (`product_id`)
        REFERENCES `products` (`id`)
);

CREATE TABLE `bills` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `status` VARCHAR(128) NOT NULL,
    `user_id` INT(11),
    `fname` VARCHAR(128),
    `email` VARCHAR(128),
    `phone_number` VARCHAR(128),
    `total_cost` INT(11),
    `pay_method` VARCHAR(128),
    `message` TEXT
);

CREATE TABLE `bill_details` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `status` VARCHAR(128),
    `bill_id` INT(11),
    `quantity` INT(11),
    `product_id` INT(11),
    `total_cost` INT(11),
    FOREIGN KEY (`bill_id`)
        REFERENCES `bills` (`id`),
    FOREIGN KEY (`product_id`)
        REFERENCES `products` (`id`)
);


