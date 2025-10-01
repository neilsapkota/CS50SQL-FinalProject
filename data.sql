INSERT INTO Cities (city_id, name, region,  death) VALUES
(1, 'Kathmandu', 'Bagmati', 19),
(2,'Pokhara','Gandaki', 2),
(3,'Itahari','Koshi',2),
(4,'Damak','Koshi',1),
(5,'Janakpur','Madhesh Pradesh',3),
(6,'Biratnagar','Koshi',4),
(7,'Nepalgunj','Madhesh Pradesh',3),
(8,'Hetauda','Bagmati',2),
(9,'Birgunj','Madhesh Pradesh',3),
(10, 'Bharatpur','Bagmati',2),
(11,'Dhangadhi','Sudurpaschim',2),
(12,'Dadeldhura','Sudurpaschim',2),
(13, 'Lalitpur','Bagmati',2),
(14,'Banepa','Bagmati',2),
(15,'Dhulikhel','Bagmati',1),
(16,'Gaur','Madhesh Pradesh',2),
(17,'Bardibas','Madhesh Pradesh',1),
(18,'Tansen','Lumbini Province',1),
(19,'Besisahar','Gandaki Province',1),
(20,'Jaleshwar','Madhesh Pradesh',1),
(21,'Dipayal','Sudurpaschim',1),
(22,'Rajbiraj','Madhesh Pradesh',2),
(23,'Gaighat','Koshi',1),
(24,'Baglung','Gandaki',1),
(25,'Khotang','Koshi',1),
(26,'Bardiya','Lumbini',1),
(27,'Siraha','Madhesh',1),
(28,'Damauli','Gandaki',1),
(29,'SandiKharka','Lumbini',1),
(30,'Gulmi','Lumbini',1),
(31,'Parasi','Lumbini',1),
(32,'Kanchanpur','Sudurpaschim',1),
(33,'Tikapur','Sudurpaschim',1),
(34,'Phidim','Koshi',1),
(35,'Bhojpur','Koshi',1);

INSERT INTO Platforms (platform_id, name, date_banned, date_restored) VALUES
(1, 'Facebook', '2025-09-04', '2025-09-08'),
(2, 'X', '2025-09-04', '2025-09-08'),
(3, 'YouTube', '2025-09-04', '2025-09-08'),
(4, 'LinkedIn', '2025-09-04', '2025-09-08'),
(5, 'Reddit', '2025-09-04', '2025-09-08'),
(6, 'Signal', '2025-09-04', '2025-09-08'),
(7, 'Snapchat', '2025-09-04', '2025-09-08');

INSERT INTO Protests (protest_id, city_id, date, organizing_group, expected_size, actual_size) VALUES
(1, 1, '2025-09-04', 'Online protest groups', 5000, 8000),
(2, 1, '2025-09-08', 'Hami Nepal', 20000, 50000),
(3, 1, '2025-09-09', 'Decentralized youth groups', 30000, 70000),
(5, 1, '2025-09-11', 'Gen Z representatives', 15000, 30000),
(6, 1, '2025-09-12', 'Gen Z representatives', 20000, 40000),
(7, 1, '2025-09-13', 'Gen Z representatives', 10000, 15000);

INSERT INTO DigitalCoordination (id, protest_id, platform, purpose, participants) VALUES
(1, 2, 'Discord', 'Tactical planning and coordination', 5000),
(2, 4, 'Discord', 'Virtual debate and vote for interim leader', 145000),
(3, 4, 'Instagram', 'Mobilization and awareness', NULL),
(4, 6, 'Discord', 'Final vote for Sushila Karki', 145000);

INSERT INTO GovtResponses (response_id, protest_id, measure, date) VALUES
(1, 1, 'Social media ban announced (26 platforms)', '2025-09-04'),
(2, 2, 'Curfew imposed in Kathmandu', '2025-09-08'),
(3, 2, 'Social media ban lifted', '2025-09-08'),
(4, 2, 'Home Minister Ramesh Lekhak resigned', '2025-09-08'),
(5, 3, 'PM Oli resigned', '2025-09-09'),
(6, 3, 'Army announced it would take charge', '2025-09-09'),
(7, 4, 'Discord vote selected Sushila Karki', '2025-09-10'),
(8, 5, 'Army-led talks with Gen Z and President Poudel', '2025-09-11'),
(9, 6, 'Sushila Karki inaugurated as Interim PM', '2025-09-12'),
(10, 6, 'Parliament dissolved, elections set for 2026-03-05', '2025-09-12'),
(11, 7, 'Curfew lifted in Kathmandu', '2025-09-13'),
(12, 7, 'PM Karki visited injured protesters', '2025-09-13'),
(13, 6, 'National mourning declared', '2025-09-17'),
(14, 6, 'Compensation announced (NPR 1M per death)', '2025-09-14'),
(15, 6, 'PM Karki pledged investigations into arson', '2025-09-14');


INSERT INTO Casualties (casualty_id, protest_id, type, number) VALUES
(1, 1, 'Death', 74),
(2, 1, 'Injury', 2113);
