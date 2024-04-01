-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2024 at 06:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `location` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `description`, `location`, `tags`, `path`) VALUES
(1, 'Amsterdam city view', 'First night in guesthouse in Amsterdam. Haven\'t had a view on a busy road from the window for quite a while, so I probably sat there for an hour or so, just looking in the window and listening to some music. One of my various attempts to make a decent retro photo. It might be an overkill a bit, but it definitely gives off the vibe I want it to.', 'Amsterdam, Netherlands', '#night #city #amsterdam #retro #netherlands', 'images\\img_gallery\\Amsterdam-city-view.JPG'),
(2, 'Autumn', 'I enjoy the fall, the vibe it gives off, the colors, its vibrant yellow, orange and russet tones, even that melancholic feeling of realization that by the end of november/ start of december all that vibrant and rich color palette will have been gone already. Fall is the best time for taking all kinds of photos; with right composition and location, the photo can give off so many different vibes: It can be warm and vibrant, showing off the beauty of the nature, or it can be moody and nostalgic. \r\nWith this particular photo I wanted to show the colors of the late-autumn and the reflections of all those beautiful trees in one of my most favorite spot. It might not be the perfect angle and composition, but it definitely has a nice reflection.', 'Ommen, Netherlands', '#fall #reflection #vibrant #ommen #netherlands #nature', 'images\\img_gallery\\Autumn.JPG'),
(3, 'Bridge in Zwolle', 'Reflection. Just a reflection.', 'Zwolle, Netherlands', '#zwolle #reflection #city #netherlands', 'images\\img_gallery\\Bridge-in-Zwolle.JPG'),
(4, 'Dysneyland castle', 'Magnificent castle. Disneyland is an amazing place that sometimes makes you feel as if you are in the fairytale. Just for that one photo I had to carry the tripod all the way to France with me, but it was definitely worth it.', 'Disneyland, Chessy, France', '#france #vibrant #dreamy', 'images\\img_gallery\\Dysneyland-castle.JPG'),
(5, 'Eiffel tower', 'La tour Eiffel. It\'s impossible not to visit when in France for the first time. It looks huge on photos but in reality it\'s so massive that no photo can possibly describe it.', 'Paris, France', '#night #france', 'images\\img_gallery\\Eiffel-Tower.jpg'),
(6, 'Fallen leaves', 'Fall photos are the best. It might be cold and the sun starts to go down earlier every day but it definitely doesn\'t make photos less beatiful.', 'Ommen, Netherlands', '#ommen #fall #vibrant #nature #netherlands', 'images\\img_gallery\\Fallen-leaves.JPG'),
(7, 'Fallen tree', 'Now that\'s what I mean when saying that fall photos can have all kinds of mood!\r\n', 'Ommen, Netherlands', '#fall #ommen #nature #moody #netherlands', 'images\\img_gallery\\Fallen-tree.JPEG'),
(8, 'Fire in the burn barrel', 'Fire is so mesmerizing to look at! ', 'Ommen, Netherlands', '#dark #ommen #netherlands', 'images\\img_gallery\\Fire-in-the-burn-barrel.JPG'),
(9, 'Forest 2', 'Lemelerberg is a fantastic place that I like to explore again and again, even if it\'s the same spot, it would different depending upon weather, season and time.', 'Lemelerberg, Lemele, Netherlands', '#nature #forest #lemele #netherlands', 'images\\img_gallery\\Forest-2.jpg'),
(10, 'Forest', '', 'Lemelerberg, Lemele, Netherlands', '#nature #lemele #netherlands #dreamy', 'images\\img_gallery\\Forest.jpg'),
(11, 'Frost', '', 'Lemele, Netherlands', '#nature #lemele #netherlands #macro', 'images\\img_gallery\\Frost.JPEG'),
(12, 'Kruidnoten', 'You tasty thing!', 'Zwolle, Netherlands', '#food #macro #zwolle #netherlands', 'images\\img_gallery\\Kruidnoten.JPEG'),
(13, 'Ling', 'I am not a big fan of taking photos of flowers, but nevertheless here it is!', 'Lemelerberg, Lemele, Netherlands', '#nature #macro #lemele #netherlands', 'images\\img_gallery\\Ling.jpg'),
(14, 'Night sky Hattem', 'Night photography has quickly become my new passion ever since buying an Iphone. This area is new to me but eventually I will surely master it! ', 'Zandkreek, Hattem, Netherlands', '#night #sky #nature #hattem #netherlands', 'images\\img_gallery\\Night-sky-2.JPG'),
(15, 'Night sky Lemele', 'Is it a bit of a Milky Way that I see? ', 'Lemele, Netherlands', '#night #sky #lemele #netherlands', 'images\\img_gallery\\Night-sky-3.JPG'),
(16, 'Blue night sky', 'This is my first decent attempt to take a picture of a starry night sky. ', 'Lemele, Netherlands', '#night #sky #lemele #netherlands', 'images\\img_gallery\\Night-sky.JPG'),
(17, 'Ommen station', 'There is something about Ommen, something I cannot describe, but for some reason this is one of my favorite towns in the Netherlands. Even its train station, even though it is somewhat old, doesn\'t have any shops nearby, it is not as handy as modern stations in bigger cities, but oh the vibe it gives...', 'Ommen, Netherlands', '#night #moody #ommen #netherlands', 'images\\img_gallery\\Ommen-station.JPEG'),
(18, 'Raindrops', 'Typical dutch weather, yet it still has its beauty.', 'Zwolle, Netherlands', '#zwolle #netherlands #moody #macro', 'images\\img_gallery\\Raindrops.JPG'),
(19, 'Rotterdam', 'In comparison with other cities in the Netherlands, Rotterdam looks more modern, however the reason behind that is quite tragic. Even among those high buildings the sky is what brought my attention. I suppose I more into nature photography than into that of an architecture.', 'Rotterdam, Netherlands', '#sunset #city #rotterdam #netherlands', 'images\\img_gallery\\Rotterdam.JPEG'),
(20, 'Scenic spot De leeuw', '', 'Lemelerberg, Lemele, Netherlands', '#dark #lemele #netherlands', 'images\\img_gallery\\Scenic-spot-De-leeuw.JPG'),
(21, 'Sky during the sunset', 'As the sun is going further down, the sky slowly changes its colors from warm red, orange and yellow colors all the way to the dark blue and black. Isn\'t it mesmerizing to forget about the world and just gaze at the sky gradually being embraced by the darkness of the night?\r\n', 'Ommen, Netherlands', '#sky #sunset #ommen #netherlands', 'images\\img_gallery\\Sky-during-the-sunset.jpg'),
(22, 'Spring', 'As the winter goes by, the spring begins: the nature starts to wake up after its long slumber. The world around at last becomes more alive and less gray. ', 'Lemelerberg, Lemele, Netherlands', '#nature #lemele #netherlands #forest', 'images\\img_gallery\\Spring.JPEG'),
(23, 'Tree with lights', 'Ommen remains beautiful even at night.', 'Ommen, Netherlands', '#ommen #netherlands #night', 'images\\img_gallery\\Tree-with-lights.JPEG'),
(24, 'View from Museum de Fundatie', 'Even though I find most of the art in that museum to be peculiar, there is still something that is worth seeing there beside its window.', 'Museum de Fundatie, Zwolle, Netherlands', '#vibrant #city #zwolle #netherlands', 'images\\img_gallery\\View-from-museum-Foundatie.JPEG'),
(25, 'Wise man', 'Wise man once said... oh never mind it is but a trunk.', 'Lemelerberg, Lemele, Netherlands', '#lemele #netherlands #nature #vibrant', 'images\\img_gallery\\Wise-man.JPEG'),
(26, 'A tree', 'Night photos tend to have their own special vibe.', 'Lemele, Netherlands', '#night #vibrant #nature #lemele #netherlands', 'images/img_gallery/IMG_3740.jpg'),
(27, 'A train', '', 'Zwolle, Netherlands', '#moody #city #zwolle #netherlands ', 'images/img_gallery/IMG_3851-Edit.jpg'),
(28, 'Body of Taurus', 'To be honest I cant find any constellation myself when I look at the night sky, but luckily, there is an app for that (stellarium). Now I am definitely interested in that so I am definitely going to devote some of the photos in the future to all kinds of constellations!', 'Lemele, Netherlands', '#night #nature #lemele #netherlands #astro', 'images/img_gallery/IMG_2794.jpg'),
(29, 'It was a moody day...', 'Even though it was a really moody day that day, I decided to go for a walk with a friend anyway. It was my second time going to that park, so it was some sort of walk down the memory lane for me, seeing all the same objects, paths, bridges again, the only difference is that the last time I went there it was mid-spring, so everything was more colorful, all those flowers, leaves on the trees, but now it was all grey... it felt as if I was in one of those old black and white films. However even the grayest of days can still let you take some photos that will definitely give off that special vibe... ', 'Aa-Landen, Zwolle, Netherlands', '#moody #zwolle #netherlands', 'images/img_gallery/IMG_3924.jpg'),
(30, 'Retro sunrise', 'My first retro photo I\'m satisfied with!', 'Lemele, Netherlands', '#lemele #netherlands #retro #sunrise', 'images/img_gallery/IMG_3770.jpg'),
(31, 'Zwolle city view', 'Is it just me or this photo gives off some sort of 90s vibes?', 'De Peperbus, Zwolle, Netherlands', '#vibrant #city #zwolle #netherlands', 'images/img_gallery/IMG_3186.jpg'),
(32, 'Winter in the Netherlands', 'Just like the previous one last year, winter this year doesn\'t seem to be rich on snowy weather. The funny thing is that this photo was taken on november 29, so technically it wasn\'t during the winter season. Nevertheless, those days when it snows (especially when that snow doesn\'t melt immediately) are much appreciated, well, atleast by me.', 'Ommen, Netherlands', '#ommen #netherlands #dark #winter', 'images/img_gallery/IMG_2875.jpg'),
(33, 'Rainbow', '', 'Lemele, Netherlands', '#dreamy #lemele #netherlands', 'images/img_gallery/1000002204.jpg'),
(34, 'Rhododedron', 'I am no florist but was interested in finding the name of such beauty anyway. ', 'Ommen, Netherlands', '#ommen #netherlands #nature #vibrant', 'images/img_gallery/1000001096.jpg'),
(35, 'Spring is in the air', 'I would have never imagined that a photo of a tree, the plum tree would symbolize the beginning of a spring for me.', 'Zwolle, Netherlands', '#zwolle #netherlands #nature #retro ', 'images/img_gallery/IMG_4169.jpg'),
(36, 'Red dead-nettle', 'When it is time for a sunset I can\'t keep my eyes away from the sky, all those colors... Nature is marvelous. ', 'Lemele, Netherlands', '#lemele #netherlands #nature #sunset #moody', 'images/img_gallery/IMG_4215_jpg.jpg'),
(37, 'What happens after the golden hour?', 'Before photography became my hobby I didn\'t even know that there were names for a certain periods of time during the sunset, I don\'t think I know all of them now, but I can definitely tell when it is the golden hour, or the blue hour. Both of these \"hours\" are 10-20minutes long, and both have quite diverse color palettes. Golden hour is very warm, photos that are taken during this \"hour\" have all shades of yellow and orange, they are \"golden\". \r\nAt this photo you can see the blue hour, the colors are somewhat darker: purple, gray, dark blue-gray. Now it is dark enough to see the moon clearly. Even though it is quite small at the picture, it turned out just sharp enough.\r\nWhich \"hour\" do YOU like the most?', 'Lemele, Netherlands', '#lemele #netherlands #nature #moody #sunset', 'images/img_gallery/20240324APC_0043.jpg'),
(38, 'Beautiful beginning of 2024', 'It is not quite as easy as I thought to take a photo of a fireworks for it can be done in different ways. My way was to take a couple of bursts with as fast shutter speed as possible and here we are :)\r\nHappy 2024!', 'Lemele, Netherlands', '#lemele #netherlands #night ', 'images/img_gallery/IMG_3693.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
