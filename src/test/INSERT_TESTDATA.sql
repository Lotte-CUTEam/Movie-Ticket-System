INSERT INTO `MEMBER` (`member_id`, `name`, `email`, `pwd`, `phone_number`, `created_at`) VALUES ('hyewon', '장혜원', 'hyewon1118@gmail.com', '1234', '01044997591', NOW());

INSERT INTO `MOVIE` (`title`, `director`, `actor`, `opening_date`, `rating`, `runtime`, `image_url`) VALUES ('토르-러브 앤 썬더', '타이카 와이티티', '크리스 헴스워스, 나탈리 포트만, 테사 톰슨, 크리스찬 베일, 타이카 와이티티', '2022-07-06 00:00:00', '7.8', 119, 'https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202207/18748_103_1.jpg');

INSERT INTO `SCREEN` (`movie_id`, `screen_at`, `cinema`) VALUES ('1', '2022-07-10 19:20:00', '서울/월드타워');

INSERT INTO `RESERVATION` (`reservation_id`, `member_id`, `screen_id`, `movie_id`, `screen_at`, `people_count`, `cinema`, `title`, `runtime`, `created_at`, `status`) VALUES (1, 'hyewon', 1, 1, '2022-07-10 19:20:00', 2, '서울/월드타워', '토르-러브 앤 썬더', 119, NOW(), 0);
