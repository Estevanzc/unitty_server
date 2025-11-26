CREATE TABLE IF NOT EXISTS `users` (
	`name` varchar(255) NOT NULL,
	`birth_date` date NOT NULL,
	`location_id` int NOT NULL,
	`occupation_id` int NOT NULL,
	`id` int NOT NULL,
	`email` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`description` text NOT NULL,
	`dark_mode` boolean NOT NULL,
	`banner` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `locations` (
	`id` int NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `blogs` (
	`name` varchar(255) NOT NULL,
	`subname` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`photo` varchar(255) NOT NULL,
	`banner` varchar(255) NOT NULL,
	`category_id` int NOT NULL,
	`user_id` int NOT NULL,
	`id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `categories` (
	`name` varchar(255) NOT NULL,
	`id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tags` (
	`id` int NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `followers` (
	`id` int NOT NULL,
	`user_id` int NOT NULL,
	`blog_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `members` (
	`role` enum NOT NULL,
	`id` int NOT NULL,
	`user_id` int NOT NULL,
	`blog_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `occupations` (
	`id` int NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `posts` (
	`id` int NOT NULL,
	`name` varchar(255) NOT NULL,
	`subname` varchar(255) NOT NULL,
	`summary` mediumtext NOT NULL,
	`banner` varchar(255) NOT NULL,
	`user_id` int NOT NULL,
	`blog_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `post_likes` (
	`id` int NOT NULL,
	`user_id` int NOT NULL,
	`post_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `post_tags` (
	`tag_id` int NOT NULL,
	`id` int NOT NULL,
	`post_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `post_views` (
	`id` int NOT NULL,
	`user_id` int NOT NULL,
	`post_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `preferences` (
	`user_id` int NOT NULL,
	`id` int NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `users` ADD CONSTRAINT `users_fk2` FOREIGN KEY (`location_id`) REFERENCES `locations`(`id`);

ALTER TABLE `users` ADD CONSTRAINT `users_fk3` FOREIGN KEY (`occupation_id`) REFERENCES `occupations`(`id`);

ALTER TABLE `blogs` ADD CONSTRAINT `blogs_fk5` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`);

ALTER TABLE `blogs` ADD CONSTRAINT `blogs_fk6` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);


ALTER TABLE `followers` ADD CONSTRAINT `followers_fk1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `followers` ADD CONSTRAINT `followers_fk2` FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`);
ALTER TABLE `members` ADD CONSTRAINT `members_fk2` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `members` ADD CONSTRAINT `members_fk3` FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`);

ALTER TABLE `posts` ADD CONSTRAINT `posts_fk5` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `posts` ADD CONSTRAINT `posts_fk6` FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`);
ALTER TABLE `post_likes` ADD CONSTRAINT `post_likes_fk1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `post_likes` ADD CONSTRAINT `post_likes_fk2` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);
ALTER TABLE `post_tags` ADD CONSTRAINT `post_tags_fk0` FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`);

ALTER TABLE `post_tags` ADD CONSTRAINT `post_tags_fk2` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);
ALTER TABLE `post_views` ADD CONSTRAINT `post_views_fk1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `post_views` ADD CONSTRAINT `post_views_fk2` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`);
ALTER TABLE `preferences` ADD CONSTRAINT `preferences_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);