-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2014 at 09:19 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `quizcomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `AnswerId` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text,
  `Time` datetime DEFAULT NULL,
  `QuestionId` int(11) NOT NULL DEFAULT '0',
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `Marks` int(11) DEFAULT NULL,
  `UserId` int(19) NOT NULL,
  PRIMARY KEY (`AnswerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`AnswerId`, `Content`, `Time`, `QuestionId`, `correct`, `Marks`, `UserId`) VALUES
(10, '{"type":"multi","title":"sdfsdf","answers":[{"id":1,"title":"sfsdfdf","correct":true,"userAnswer":true},{"id":2,"title":"sfsdfsdf","correct":false,"userAnswer":false},{"id":3,"title":"sdfsdf","correct":false,"userAnswer":false},{"id":4,"title":"sfsdff","correct":false,"userAnswer":false},{"id":5,"title":"sdfsdf","correct":true,"userAnswer":true}],"questionId":101,"quizIdentifier":null}', '2014-04-13 20:23:46', 101, 1, 1, 1),
(11, '{"type":"multi","title":"ssdf","answers":[{"id":1,"title":"sdfsdf","correct":false,"userAnswer":true},{"id":2,"title":"sfsdf","correct":false,"userAnswer":false},{"id":3,"title":"","correct":true,"userAnswer":false},{"id":4,"title":"fsdfsdf","correct":false,"userAnswer":false},{"id":5,"title":"sfd","correct":true,"userAnswer":true}],"questionId":102,"quizIdentifier":null}', '2014-04-13 20:23:47', 102, 0, 0, 1),
(12, '{"type":"multi","title":"sdfsdf","answers":[{"id":1,"title":"sdfsdfdfsdf","correct":true,"userAnswer":true},{"id":2,"title":"aaaaaaaaa","correct":false,"userAnswer":false},{"id":3,"title":"aaaaa","correct":false,"userAnswer":false},{"id":4,"title":"33333","correct":true,"userAnswer":false},{"id":5,"title":"33333333333","correct":false,"userAnswer":true}],"questionId":103,"quizIdentifier":null}', '2014-04-13 20:23:48', 103, 0, 0, 1),
(13, '{"type":"multi","answers":[{"id":1,"correct":true,"userAnswer":true,"title":"sfsdfdf"},{"id":2,"correct":false,"userAnswer":false,"title":"sfsdfsdf"},{"id":3,"correct":false,"userAnswer":false,"title":"sdfsdf"},{"id":4,"correct":false,"userAnswer":false,"title":"sfsdff"},{"id":5,"correct":true,"userAnswer":true,"title":"sdfsdf"}],"questionId":101,"quizIdentifier":null,"title":"sdfsdf"}', '2014-04-14 23:08:14', 101, 1, 1, 2),
(14, '{"type":"multi","answers":[{"id":1,"correct":false,"userAnswer":false,"title":"sdfsdf"},{"id":2,"correct":false,"userAnswer":false,"title":"sfsdf"},{"id":3,"correct":true,"userAnswer":false,"title":""},{"id":4,"correct":false,"userAnswer":false,"title":"fsdfsdf"},{"id":5,"correct":true,"userAnswer":false,"title":"sfd"}],"questionId":102,"quizIdentifier":null,"title":"ssdf"}', '2014-04-14 23:08:18', 102, 0, 0, 2),
(15, '{"type":"multi","answers":[{"id":1,"correct":true,"userAnswer":false,"title":"sdfsdfdfsdf"},{"id":2,"correct":false,"userAnswer":false,"title":"aaaaaaaaa"},{"id":3,"correct":false,"userAnswer":false,"title":"aaaaa"},{"id":4,"correct":true,"userAnswer":false,"title":"33333"},{"id":5,"correct":false,"userAnswer":false,"title":"33333333333"}],"questionId":103,"quizIdentifier":null,"title":"sdfsdf"}', '2014-04-14 23:08:20', 103, 0, 0, 2),
(16, '{"type":"multi","answers":[{"id":1,"correct":true,"userAnswer":false,"title":"sfsdfdf"},{"id":2,"correct":false,"userAnswer":false,"title":"sfsdfsdf"},{"id":3,"correct":false,"userAnswer":true,"title":"sdfsdf"},{"id":4,"correct":false,"userAnswer":false,"title":"sfsdff"},{"id":5,"correct":true,"userAnswer":false,"title":"sdfsdf"}],"title":"sdfsdf","questionId":101,"quizIdentifier":null}', '2014-04-16 23:52:28', 101, 0, 0, 1),
(17, '{"type":"multi","answers":[{"id":1,"correct":false,"userAnswer":false,"title":"sdfsdf"},{"id":2,"correct":false,"userAnswer":false,"title":"sfsdf"},{"id":3,"correct":true,"userAnswer":true,"title":""},{"id":4,"correct":false,"userAnswer":false,"title":"fsdfsdf"},{"id":5,"correct":true,"userAnswer":false,"title":"sfd"}],"title":"ssdf","questionId":102,"quizIdentifier":null}', '2014-04-16 23:52:29', 102, 0, 0, 1),
(18, '{"type":"multi","answers":[{"id":1,"correct":true,"userAnswer":false,"title":"sdfsdfdfsdf"},{"id":2,"correct":false,"userAnswer":false,"title":"aaaaaaaaa"},{"id":3,"correct":false,"userAnswer":false,"title":"aaaaa"},{"id":4,"correct":true,"userAnswer":true,"title":"33333"},{"id":5,"correct":false,"userAnswer":false,"title":"33333333333"}],"title":"sdfsdf","questionId":103,"quizIdentifier":null}', '2014-04-16 23:52:30', 103, 0, 0, 1),
(19, '{"type":"multi","answers":[{"id":1,"correct":true,"userAnswer":false,"title":"sfsdfdf"},{"id":2,"correct":false,"userAnswer":false,"title":"sfsdfsdf"},{"id":3,"correct":false,"userAnswer":true,"title":"sdfsdf"},{"id":4,"correct":false,"userAnswer":false,"title":"sfsdff"},{"id":5,"correct":true,"userAnswer":false,"title":"sdfsdf"}],"title":"sdfsdf","questionId":101,"quizIdentifier":null}', '2014-04-16 23:52:58', 101, 0, 0, 1),
(20, '{"type":"multi","answers":[{"id":1,"correct":false,"userAnswer":false,"title":"sdfsdf"},{"id":2,"correct":false,"userAnswer":false,"title":"sfsdf"},{"id":3,"correct":true,"userAnswer":true,"title":""},{"id":4,"correct":false,"userAnswer":false,"title":"fsdfsdf"},{"id":5,"correct":true,"userAnswer":false,"title":"sfd"}],"title":"ssdf","questionId":102,"quizIdentifier":null}', '2014-04-16 23:53:31', 102, 0, 0, 1),
(21, '{"type":"multi","answers":[{"id":1,"correct":true,"userAnswer":false,"title":"sdfsdfdfsdf"},{"id":2,"correct":false,"userAnswer":false,"title":"aaaaaaaaa"},{"id":3,"correct":false,"userAnswer":false,"title":"aaaaa"},{"id":4,"correct":true,"userAnswer":true,"title":"33333"},{"id":5,"correct":false,"userAnswer":false,"title":"33333333333"}],"title":"sdfsdf","questionId":103,"quizIdentifier":null}', '2014-04-16 23:53:33', 103, 0, 0, 1),
(22, '{"type":"multi","answers":[{"id":1,"correct":false,"title":"dfs","userAnswer":false},{"id":2,"correct":false,"title":"dfs","userAnswer":false},{"id":3,"correct":false,"title":"dfsdfs","userAnswer":false},{"id":4,"correct":false,"title":"dfsd","userAnswer":true},{"id":5,"correct":true,"title":"fsdffdf","userAnswer":true}],"title":"sdfsdfs","questionId":162,"quizIdentifier":null}', '2014-04-17 22:02:14', 162, 0, 0, 1),
(23, '{"type":"multi","answers":[{"id":1,"correct":true,"title":"sdf","userAnswer":false},{"id":2,"correct":true,"title":"sdfs","userAnswer":false},{"id":3,"correct":false,"title":"dfsd","userAnswer":false},{"id":4,"correct":false,"title":"fsdf","userAnswer":true},{"id":5,"correct":false,"title":"sdfdff","userAnswer":false}],"title":"sfsdf","questionId":163,"quizIdentifier":null}', '2014-04-17 22:02:17', 163, 0, 0, 1),
(24, '{"type":"multi","answers":[{"id":1,"correct":false,"title":"1111111111111111111111","userAnswer":false},{"id":2,"correct":true,"title":"sssssssss","userAnswer":false},{"id":3,"correct":true,"title":"ssssssssss","userAnswer":false},{"id":4,"correct":false,"title":"ssssssssss","userAnswer":true},{"id":5,"correct":true,"title":"sssssssssss","userAnswer":true}],"title":"sdfs","questionId":164,"quizIdentifier":null}', '2014-04-17 22:02:19', 164, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `QuestionId` int(11) NOT NULL AUTO_INCREMENT,
  `QuizId` int(11) NOT NULL DEFAULT '0',
  `Title` text NOT NULL,
  `Content` text,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`QuestionId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=165 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`QuestionId`, `QuizId`, `Title`, `Content`, `Type`) VALUES
(101, 76, 'sdfsdf', '{"type":"multi","title":"sdfsdf","answers":[{"id":1,"title":"sfsdfdf","correct":true},{"id":2,"title":"sfsdfsdf","correct":false},{"id":3,"title":"sdfsdf","correct":false},{"id":4,"title":"sfsdff","correct":false},{"id":5,"title":"sdfsdf","correct":true}],"questionId":101,"quizIdentifier":null}', 'multi'),
(102, 76, 'ssdf', '{"type":"multi","title":"ssdf","answers":[{"id":1,"title":"sdfsdf","correct":false},{"id":2,"title":"sfsdf","correct":false},{"id":3,"title":"","correct":true},{"id":4,"title":"fsdfsdf","correct":false},{"id":5,"title":"sfd","correct":true}],"questionId":102,"quizIdentifier":null}', 'multi'),
(103, 76, 'sdfsdf', '{"type":"multi","title":"sdfsdf","answers":[{"id":1,"title":"sdfsdfdfsdf","correct":true},{"id":2,"title":"aaaaaaaaa","correct":false},{"id":3,"title":"aaaaa","correct":false},{"id":4,"title":"33333","correct":true},{"id":5,"title":"33333333333","correct":false}],"questionId":103,"quizIdentifier":null}', 'multi'),
(104, 77, 'aasasss55555asdasd', '{"type":"multi","questionId":104,"quizIdentifier":null,"title":"aasasss55555asdasd","answers":[{"id":1,"correct":true,"title":"asdasd"},{"id":2,"correct":false,"title":"adas"},{"id":3,"correct":false,"title":"asdasd"},{"id":4,"correct":false,"title":"adas"},{"id":5,"correct":true,"title":"asdasd"}]}', 'multi'),
(105, 77, 'sdfsdf', '{"type":"multi","questionId":105,"quizIdentifier":null,"title":"sdfsdf","answers":[{"id":1,"correct":false,"title":"sdfsdfsdf"},{"id":2,"correct":true,"title":"sdfsdfsdf"},{"id":3,"correct":false,"title":"sdfsdf"},{"id":4,"correct":false,"title":"sdfsdf"},{"id":5,"correct":false,"title":"sdfsdfsdf"}]}', 'multi'),
(106, 78, 'asdasd', '{"type":"multi","questionId":null,"quizIdentifier":null,"title":"asdasd","answers":[{"id":1,"correct":true,"title":"asdasd"},{"id":2,"correct":false,"title":"asdasd"},{"id":3,"correct":false,"title":"asdasd"},{"id":4,"correct":false,"title":"asdasd"},{"id":5,"correct":true,"title":""}]}', 'multi'),
(107, 78, 'asdasd', '{"type":"multi","questionId":null,"quizIdentifier":null,"title":"asdasd","answers":[{"id":1,"correct":true,"title":"asdasd"},{"id":2,"correct":false,"title":"asdasd"},{"id":3,"correct":false,"title":"asdasd"},{"id":4,"correct":false,"title":"asdasd"},{"id":5,"correct":true,"title":""}]}', 'multi'),
(108, 78, 'asdasdasd', '{"type":"multi","questionId":null,"quizIdentifier":null,"title":"asdasdasd","answers":[{"id":1,"correct":false,"title":"asdasd"},{"id":2,"correct":false,"title":"asdasdasd"},{"id":3,"correct":false,"title":"asdas"},{"id":4,"correct":true,"title":"asdasdsd"},{"id":5,"correct":true,"title":"adasd"}]}', 'multi'),
(109, 78, 'asdasd', '{"type":"multi","questionId":null,"quizIdentifier":null,"title":"asdasd","answers":[{"id":1,"correct":true,"title":"asdasd"},{"id":2,"correct":false,"title":"asdasd"},{"id":3,"correct":false,"title":"asdasd"},{"id":4,"correct":false,"title":"asdasd"},{"id":5,"correct":true,"title":""}]}', 'multi'),
(110, 78, 'asdasd', '{"type":"multi","questionId":null,"quizIdentifier":null,"title":"asdasd","answers":[{"id":1,"correct":true,"title":"asdasd"},{"id":2,"correct":false,"title":"asdasd"},{"id":3,"correct":false,"title":"asdasd"},{"id":4,"correct":false,"title":"asdasd"},{"id":5,"correct":true,"title":""}]}', 'multi'),
(111, 78, 'asdasdasd', '{"type":"multi","questionId":null,"quizIdentifier":null,"title":"asdasdasd","answers":[{"id":1,"correct":false,"title":"asdasd"},{"id":2,"correct":false,"title":"asdasdasd"},{"id":3,"correct":false,"title":"asdas"},{"id":4,"correct":true,"title":"asdasdsd"},{"id":5,"correct":true,"title":"adasd"}]}', 'multi'),
(112, 79, 'yujyuj', '{"type":"multi","questionId":112,"quizIdentifier":null,"title":"yujyuj","answers":[{"id":1,"correct":true,"title":"yujyuj"},{"id":2,"correct":false,"title":"yujyuju"},{"id":3,"correct":false,"title":"jujuju"},{"id":4,"correct":true,"title":"ujujuj"},{"id":5,"correct":false,"title":"jujujuj"}]}', 'multi'),
(113, 79, 'ujuj', '{"type":"multi","questionId":113,"quizIdentifier":null,"title":"ujuj","answers":[{"id":1,"correct":true,"title":"ujuj"},{"id":2,"correct":false,"title":"jujuj"},{"id":3,"correct":false,"title":"jujuj"},{"id":4,"correct":false,"title":"juju"},{"id":5,"correct":false,"title":"jujuj"}]}', 'multi'),
(114, 79, 'ujujuj', '{"type":"multi","questionId":114,"quizIdentifier":null,"title":"ujujuj","answers":[{"id":1,"correct":true,"title":"jujuj"},{"id":2,"correct":false,"title":"ujuj"},{"id":3,"correct":false,"title":"jujuj"},{"id":4,"correct":false,"title":"juju"},{"id":5,"correct":true,"title":"jujuj"}]}', 'multi'),
(115, 80, 'sdfsdf', '{"type":"multi","questionId":115,"quizIdentifier":null,"title":"sdfsdf","answers":[{"id":1,"correct":true,"title":"sdfsdf"},{"id":2,"correct":true,"title":"sdfsdf"},{"id":3,"correct":true,"title":"sdfsdf"},{"id":4,"correct":false,"title":"sfsdfsdf"},{"id":5,"correct":false,"title":"sfsfd"}]}', 'multi'),
(116, 80, 'sdfsdf', '{"type":"multi","questionId":116,"quizIdentifier":null,"title":"sdfsdf","answers":[{"id":1,"correct":false,"title":"sdfsdfsdf"},{"id":2,"correct":false,"title":"sdfsdfs"},{"id":3,"correct":false,"title":"sdfsdf"},{"id":4,"correct":false,"title":"sdfsdf"},{"id":5,"correct":true,"title":"sdfsdf"}]}', 'multi'),
(117, 81, 'cvbcvbcvb', '{"type":"multi","questionId":117,"quizIdentifier":null,"title":"cvbcvbcvb","answers":[{"id":1,"correct":true,"title":"cvbcvbcvb"},{"id":2,"correct":false,"title":"cvbcvb"},{"id":3,"correct":true,"title":"cbcvb"},{"id":4,"correct":false,"title":"cvbcvb"},{"id":5,"correct":false,"title":"cbcvbcvb"}]}', 'multi'),
(118, 81, 'cvbcvbvb', '{"type":"multi","questionId":118,"quizIdentifier":null,"title":"cvbcvbvb","answers":[{"id":1,"correct":true,"title":"cvb"},{"id":2,"correct":false,"title":"bbbbbb"},{"id":3,"correct":true,"title":"bbbbbbbb"},{"id":4,"correct":false,"title":"bbbbbbbb"},{"id":5,"correct":false,"title":"bbbbbbbb"}]}', 'multi'),
(119, 82, 'sdfsdf', '{"type":"multi","title":"sdfsdf","answers":[{"id":1,"title":"sdfsdf","correct":true},{"id":2,"title":"sdfsdf","correct":false},{"id":3,"title":"sdfsdf","correct":true},{"id":4,"title":"sdfsdf","correct":true},{"id":5,"title":"sdfsdf","correct":false}],"questionId":119,"quizIdentifier":null}', 'multi'),
(120, 82, 'sdfsdfsdf', '{"type":"multi","title":"sdfsdfsdf","answers":[{"id":1,"title":"sdfsdfsdfs","correct":true},{"id":2,"title":"sdfsdfs","correct":false},{"id":3,"title":"dfsdfsdf","correct":false},{"id":4,"title":"sdfsdf","correct":false},{"id":5,"title":"sfsdfsdf","correct":false}],"questionId":120,"quizIdentifier":null}', 'multi'),
(121, 83, 'cvbcvb', '{"type":"multi","questionId":121,"quizIdentifier":null,"title":"cvbcvb","answers":[{"id":1,"title":"cvbc","correct":true},{"id":2,"title":"cvbcvb","correct":true},{"id":3,"title":"cvbcvb","correct":false},{"id":4,"title":"cvbcvb","correct":false},{"id":5,"title":"cvbcvb","correct":false}]}', 'multi'),
(123, 83, 'xcvxc', '{"type":"multi","questionId":123,"quizIdentifier":null,"title":"xcvxc","answers":[{"id":1,"title":"xcvxcvxc","correct":true},{"id":2,"title":"xcvxcv","correct":false},{"id":3,"title":"xcvx","correct":false},{"id":4,"title":"cvxcvxcv","correct":false},{"id":5,"title":"xcvxcvxcvxcvcv","correct":true}]}', 'multi'),
(124, 84, 'sdfsdfsdf', '{"type":"multi","title":"sdfsdfsdf","answers":[{"id":1,"title":"sdfdf","correct":false,"userAnswer":null},{"id":2,"title":"sdfsdf","correct":false,"userAnswer":null},{"id":3,"title":"sdfsdf","correct":false,"userAnswer":null},{"id":4,"title":"sdfdf","correct":false,"userAnswer":null},{"id":5,"title":"sdfsdfsssssssssss","correct":true,"userAnswer":null}],"questionId":124,"quizIdentifier":null}', 'multi'),
(126, 84, 'sdsdfs', '{"type":"multi","title":"sdsdfs","answers":[{"id":1,"title":"sdfsdf","correct":false,"userAnswer":null},{"id":2,"title":"sdfsdf","correct":false,"userAnswer":null},{"id":3,"title":"sdfsdf","correct":false,"userAnswer":null},{"id":4,"title":"sdfd","correct":true,"userAnswer":null},{"id":5,"title":"ssssss","correct":false,"userAnswer":null}],"questionId":126,"quizIdentifier":null}', 'multi'),
(127, 85, 'asdasd', '{"type":"multi","title":"asdasd","questionId":127,"quizIdentifier":null,"answers":[{"id":1,"title":"asdas","userAnswer":null,"correct":true},{"id":2,"title":"dasda","userAnswer":null,"correct":true},{"id":3,"title":"sdasdasd","userAnswer":null,"correct":false},{"id":4,"title":"asdasd","userAnswer":null,"correct":true},{"id":5,"title":"asdasd","userAnswer":null,"correct":false}]}', 'multi'),
(128, 85, 'asda', '{"type":"multi","title":"asda","questionId":128,"quizIdentifier":null,"answers":[{"id":1,"title":"asda","userAnswer":null,"correct":false},{"id":2,"title":"sdasd","userAnswer":null,"correct":false},{"id":3,"title":"asda","userAnswer":null,"correct":false},{"id":4,"title":"sdasd","userAnswer":null,"correct":true},{"id":5,"title":"asdsdasd","userAnswer":null,"correct":false}]}', 'multi'),
(129, 85, 'tttt', '{"type":"multi","title":"tttt","questionId":null,"quizIdentifier":null,"answers":[{"id":1,"title":"ttttt","userAnswer":null,"correct":false},{"id":2,"title":"tttttttt","userAnswer":null,"correct":false},{"id":3,"title":"ttttttttttt","userAnswer":null,"correct":false},{"id":4,"title":"ttttttttttttt","userAnswer":null,"correct":false},{"id":5,"title":"ttttttt","userAnswer":null,"correct":true}]}', 'multi'),
(130, 85, 'tttt', '{"type":"multi","title":"tttt","questionId":130,"quizIdentifier":null,"answers":[{"id":1,"title":"ttttt","userAnswer":null,"correct":false},{"id":2,"title":"tttttttt","userAnswer":null,"correct":false},{"id":3,"title":"ttttttttttt","userAnswer":null,"correct":false},{"id":4,"title":"ttttttttttttt","userAnswer":null,"correct":false},{"id":5,"title":"333333333","userAnswer":null,"correct":true}]}', 'multi'),
(131, 85, 'tttt', '{"type":"multi","title":"tttt","questionId":131,"quizIdentifier":null,"answers":[{"id":1,"title":"ttttt","userAnswer":null,"correct":false},{"id":2,"title":"tttttttt","userAnswer":null,"correct":false},{"id":3,"title":"ttttttttttt","userAnswer":null,"correct":false},{"id":4,"title":"ttttttttttttt","userAnswer":null,"correct":false},{"id":5,"title":"666666666666666","userAnswer":null,"correct":true}]}', 'multi'),
(132, 85, 'tttt', '{"type":"multi","title":"tttt","questionId":null,"quizIdentifier":null,"answers":[{"id":1,"title":"ttttt","userAnswer":null,"correct":false},{"id":2,"title":"tttttttt","userAnswer":null,"correct":false},{"id":3,"title":"ttttttttttt","userAnswer":null,"correct":false},{"id":4,"title":"ttttttttttttt","userAnswer":null,"correct":false},{"id":5,"title":"ttttttt","userAnswer":null,"correct":true}]}', 'multi'),
(133, 86, 'xcvxcv', '{"type":"multi","title":"xcvxcv","questionId":133,"quizIdentifier":null,"answers":[{"id":1,"title":"xcvxc","userAnswer":null,"correct":false},{"id":2,"title":"vxcvx","userAnswer":null,"correct":false},{"id":3,"title":"cvxcv","userAnswer":null,"correct":false},{"id":4,"title":"11111","userAnswer":null,"correct":false},{"id":5,"title":"xcvxcv","userAnswer":null,"correct":true}]}', 'multi'),
(134, 86, 't5', '{"type":"multi","title":"t5","questionId":null,"quizIdentifier":null,"answers":[{"id":1,"title":"tt","userAnswer":null,"correct":false},{"id":2,"title":"tt","userAnswer":null,"correct":false},{"id":3,"title":"ttt","userAnswer":null,"correct":true},{"id":4,"title":"ttt","userAnswer":null,"correct":false},{"id":5,"title":"tttt","userAnswer":null,"correct":false}]}', 'multi'),
(135, 86, 't5', '{"type":"multi","title":"t5","questionId":135,"quizIdentifier":null,"answers":[{"id":1,"title":"tt","userAnswer":null,"correct":false},{"id":2,"title":"tt","userAnswer":null,"correct":false},{"id":3,"title":"ttt","userAnswer":null,"correct":true},{"id":4,"title":"ttt","userAnswer":null,"correct":false},{"id":5,"title":"tttt","userAnswer":null,"correct":false}]}', 'multi'),
(136, 86, 'zxczxc', '{"type":"multi","title":"zxczxc","questionId":136,"quizIdentifier":null,"answers":[{"id":1,"title":"4444444","userAnswer":null,"correct":true},{"id":2,"title":"zxczxc","userAnswer":null,"correct":false},{"id":3,"title":"zxczx","userAnswer":null,"correct":false},{"id":4,"title":"zxczxcc","userAnswer":null,"correct":true},{"id":5,"title":"czxczxczxc","userAnswer":null,"correct":false}]}', 'multi'),
(137, 86, 't5', '{"type":"multi","title":"t5","questionId":137,"quizIdentifier":null,"answers":[{"id":1,"title":"tt","userAnswer":null,"correct":false},{"id":2,"title":"tt","userAnswer":null,"correct":false},{"id":3,"title":"ttt","userAnswer":null,"correct":true},{"id":4,"title":"ttt","userAnswer":null,"correct":false},{"id":5,"title":"tttt","userAnswer":null,"correct":false}]}', 'multi'),
(138, 86, 't5', '{"type":"multi","title":"t5","questionId":null,"quizIdentifier":null,"answers":[{"id":1,"title":"tt","userAnswer":null,"correct":false},{"id":2,"title":"tt","userAnswer":null,"correct":false},{"id":3,"title":"ttt","userAnswer":null,"correct":true},{"id":4,"title":"ttt","userAnswer":null,"correct":false},{"id":5,"title":"tttt","userAnswer":null,"correct":false}]}', 'multi'),
(139, 86, 't5', '{"type":"multi","title":"t5","questionId":null,"quizIdentifier":null,"answers":[{"id":1,"title":"tt","userAnswer":null,"correct":false},{"id":2,"title":"tt","userAnswer":null,"correct":false},{"id":3,"title":"ttt","userAnswer":null,"correct":true},{"id":4,"title":"ttt","userAnswer":null,"correct":false},{"id":5,"title":"tttt","userAnswer":null,"correct":false}]}', 'multi'),
(140, 86, 't5', '{"type":"multi","title":"t5","questionId":null,"quizIdentifier":null,"answers":[{"id":1,"title":"tt","userAnswer":null,"correct":false},{"id":2,"title":"tt","userAnswer":null,"correct":false},{"id":3,"title":"ttt","userAnswer":null,"correct":true},{"id":4,"title":"ttt","userAnswer":null,"correct":false},{"id":5,"title":"tttt","userAnswer":null,"correct":false}]}', 'multi'),
(141, 87, 'dfgdf', '{"type":"multi","title":"dfgdf","questionId":141,"quizIdentifier":null,"answers":[{"id":1,"title":"gdfgd","userAnswer":null,"correct":false},{"id":2,"title":"fgdfg","userAnswer":null,"correct":false},{"id":3,"title":"dfgdf","userAnswer":null,"correct":true},{"id":4,"title":"gdfg","userAnswer":null,"correct":false},{"id":5,"title":"dfgdfgdf","userAnswer":null,"correct":true}]}', 'multi'),
(142, 87, 'eeeeee', '{"type":"multi","title":"eeeeee","questionId":142,"quizIdentifier":null,"answers":[{"id":1,"title":"1111111111111","userAnswer":null,"correct":false},{"id":2,"title":"eeeeeeeeee","userAnswer":null,"correct":false},{"id":3,"title":"eeeeeeeeee","userAnswer":null,"correct":false},{"id":4,"title":"eeeeeeeeeee","userAnswer":null,"correct":false},{"id":5,"title":"eeeeeeeeee","userAnswer":null,"correct":true}]}', 'multi'),
(143, 87, 'cvbc', '{"type":"multi","title":"cvbc","questionId":143,"quizIdentifier":null,"answers":[{"id":1,"title":"vbcvbcvbc","userAnswer":null,"correct":false},{"id":2,"title":"vbcvb","userAnswer":null,"correct":false},{"id":3,"title":"cvbcv","userAnswer":null,"correct":false},{"id":4,"title":"bcvbcvb","userAnswer":null,"correct":true},{"id":5,"title":"cvbcvvbcvbvb","userAnswer":null,"correct":true}]}', 'multi'),
(144, 88, 'xcvx', '{"type":"multi","title":"xcvx","questionId":144,"quizIdentifier":null,"answers":[{"id":1,"title":"cvxcv","userAnswer":null,"correct":false},{"id":2,"title":"33333333","userAnswer":null,"correct":true},{"id":3,"title":"vxcvx","userAnswer":null,"correct":true},{"id":4,"title":"xcvxcvxcvvcv","userAnswer":null,"correct":true},{"id":5,"title":"cvxcvx","userAnswer":null,"correct":false}]}', 'multi'),
(145, 88, 'ww', '{"type":"multi","title":"ww","questionId":145,"quizIdentifier":null,"answers":[{"id":1,"title":"wwwwwwwwww","userAnswer":null,"correct":false},{"id":2,"title":"wwwwwwwwwww","userAnswer":null,"correct":true},{"id":3,"title":"wwwwwwwwwww","userAnswer":null,"correct":false},{"id":4,"title":"wwwwwwwwwww","userAnswer":null,"correct":true},{"id":5,"title":"wwwwwwwwww","userAnswer":null,"correct":false}]}', 'multi'),
(146, 89, 'zxczx', '{"type":"multi","title":"zxczx","questionId":null,"quizIdentifier":null,"answers":[{"id":1,"title":"czxcz","userAnswer":null,"correct":false},{"id":2,"title":"xczx","userAnswer":null,"correct":false},{"id":3,"title":"czxcz","userAnswer":null,"correct":true},{"id":4,"title":"xczxc","userAnswer":null,"correct":false},{"id":5,"title":"zxczxccxc","userAnswer":null,"correct":true}]}', 'multi'),
(147, 89, 'zxczx', '{"type":"multi","title":"zxczx","questionId":null,"quizIdentifier":null,"answers":[{"id":1,"title":"czxcz","userAnswer":null,"correct":false},{"id":2,"title":"xczx","userAnswer":null,"correct":false},{"id":3,"title":"czxcz","userAnswer":null,"correct":true},{"id":4,"title":"xczxc","userAnswer":null,"correct":false},{"id":5,"title":"zxczxccxc","userAnswer":null,"correct":true}]}', 'multi'),
(148, 89, 'zxcz', '{"type":"multi","title":"zxcz","questionId":null,"quizIdentifier":null,"answers":[{"id":1,"title":"xcz","userAnswer":null,"correct":false},{"id":2,"title":"cxzc","userAnswer":null,"correct":false},{"id":3,"title":"zxcz","userAnswer":null,"correct":true},{"id":4,"title":"zc","userAnswer":null,"correct":false},{"id":5,"title":"zxczxc","userAnswer":null,"correct":false}]}', 'multi'),
(149, 89, 'zxczx', '{"type":"multi","quizIdentifier":null,"questionId":null,"title":"zxczx","answers":[{"id":1,"userAnswer":null,"title":"czxcz","correct":false},{"id":2,"userAnswer":null,"title":"xczx","correct":false},{"id":3,"userAnswer":null,"title":"czxcz","correct":true},{"id":4,"userAnswer":null,"title":"xczxc","correct":false},{"id":5,"userAnswer":null,"title":"zxczxccxc","correct":true}]}', 'multi'),
(150, 89, 'zxczx', '{"type":"multi","quizIdentifier":null,"questionId":null,"title":"zxczx","answers":[{"id":1,"userAnswer":null,"title":"czxcz","correct":false},{"id":2,"userAnswer":null,"title":"xczx","correct":false},{"id":3,"userAnswer":null,"title":"czxcz","correct":true},{"id":4,"userAnswer":null,"title":"xczxc","correct":false},{"id":5,"userAnswer":null,"title":"zxczxccxc","correct":true}]}', 'multi'),
(151, 89, 'zxcz', '{"type":"multi","quizIdentifier":null,"questionId":null,"title":"zxcz","answers":[{"id":1,"userAnswer":null,"title":"xcz","correct":false},{"id":2,"userAnswer":null,"title":"cxzc","correct":false},{"id":3,"userAnswer":null,"title":"zxcz","correct":true},{"id":4,"userAnswer":null,"title":"zc","correct":false},{"id":5,"userAnswer":null,"title":"zxczxc","correct":false}]}', 'multi'),
(152, 90, 'ttttttttt', '{"type":"multi","quizIdentifier":null,"questionId":152,"title":"ttttttttt","answers":[{"id":1,"userAnswer":null,"title":"ttt","correct":false},{"id":2,"userAnswer":null,"title":"ttttttttt","correct":false},{"id":3,"userAnswer":null,"title":"tttttttttt","correct":false},{"id":4,"userAnswer":null,"title":"tttttttttt","correct":true},{"id":5,"userAnswer":null,"title":"45566","correct":true}]}', 'multi'),
(153, 90, 'czxc', '{"type":"multi","quizIdentifier":null,"questionId":153,"title":"czxc","answers":[{"id":1,"userAnswer":null,"title":"zxc","correct":false},{"id":2,"userAnswer":null,"title":"zxcz","correct":false},{"id":3,"userAnswer":null,"title":"xczxc","correct":true},{"id":4,"userAnswer":null,"title":"zxcz","correct":true},{"id":5,"userAnswer":null,"title":"xczxcxcxc","correct":false}]}', 'multi'),
(154, 91, 'asdas', '{"type":"multi","quizIdentifier":null,"questionId":154,"title":"asdas","answers":[{"id":1,"userAnswer":null,"title":"dasd","correct":false},{"id":2,"userAnswer":null,"title":"asda","correct":false},{"id":3,"userAnswer":null,"title":"asda","correct":true},{"id":4,"userAnswer":null,"title":"sdasdasd","correct":false},{"id":5,"userAnswer":null,"title":"dsasdd","correct":true}]}', 'multi'),
(155, 91, 'sds', '{"type":"multi","quizIdentifier":null,"questionId":155,"title":"sds","answers":[{"id":1,"userAnswer":null,"title":"dfs","correct":false},{"id":2,"userAnswer":null,"title":"dfsdf","correct":false},{"id":3,"userAnswer":null,"title":"sdf","correct":false},{"id":4,"userAnswer":null,"title":"sdfsdff","correct":true},{"id":5,"userAnswer":null,"title":"fsdfsdf","correct":false}]}', 'multi'),
(156, 92, 'sdfs', '{"type":"multi","quizIdentifier":null,"questionId":156,"title":"sdfs","answers":[{"id":1,"userAnswer":null,"title":"fsdfs","correct":false},{"id":2,"userAnswer":null,"title":"dfsdf","correct":false},{"id":3,"userAnswer":null,"title":"sdfs","correct":false},{"id":4,"userAnswer":null,"title":"dfsdf","correct":true},{"id":5,"userAnswer":null,"title":"sdfsdf","correct":false}]}', 'multi'),
(157, 92, 'sdf', '{"type":"multi","quizIdentifier":null,"questionId":157,"title":"sdf","answers":[{"id":1,"userAnswer":null,"title":"dfdf","correct":false},{"id":2,"userAnswer":null,"title":"fd","correct":false},{"id":3,"userAnswer":null,"title":"fsdf","correct":true},{"id":4,"userAnswer":null,"title":"sdfsdf","correct":false},{"id":5,"userAnswer":null,"title":"sdfsdfdf","correct":false}]}', 'multi'),
(158, 93, 'z', '{"type":"multi","answers":[{"id":1,"correct":false,"userAnswer":null,"title":"zxcz"},{"id":2,"correct":false,"userAnswer":null,"title":"xczx"},{"id":3,"correct":true,"userAnswer":null,"title":"czxcz"},{"id":4,"correct":true,"userAnswer":null,"title":"zxczxcxzcz"},{"id":5,"correct":false,"userAnswer":null,"title":"xczxczxc"}],"title":"z","questionId":null,"quizIdentifier":null}', 'multi'),
(159, 93, 'sdfsdf', '{"type":"multi","questionId":159,"quizIdentifier":null,"answers":[{"id":1,"userAnswer":null,"correct":false,"title":"sdfsd"},{"id":2,"userAnswer":null,"correct":false,"title":"fsdfsd"},{"id":3,"userAnswer":null,"correct":true,"title":"fsdfs"},{"id":4,"userAnswer":null,"correct":true,"title":"sdfsdffd"},{"id":5,"userAnswer":null,"correct":false,"title":"dfsdfsdf"}],"title":"sdfsdf"}', 'multi'),
(160, 93, 'sfdsd', '{"type":"multi","questionId":160,"quizIdentifier":null,"answers":[{"id":1,"userAnswer":null,"correct":false,"title":"fsdfs"},{"id":2,"userAnswer":null,"correct":true,"title":"dfsdfdfdf"},{"id":3,"userAnswer":null,"correct":false,"title":"dfsdf"},{"id":4,"userAnswer":null,"correct":true,"title":"sdfsdfs"},{"id":5,"userAnswer":null,"correct":false,"title":"dfsdfsdfs"}],"title":"sfdsd"}', 'multi'),
(161, 93, 'sdfsdf', '{"type":"multi","questionId":161,"quizIdentifier":null,"answers":[{"id":1,"userAnswer":null,"correct":true,"title":"sdfsdf"},{"id":2,"userAnswer":null,"correct":false,"title":"sdfsdfsdfsd"},{"id":3,"userAnswer":null,"correct":false,"title":"fsdf"},{"id":4,"userAnswer":null,"correct":false,"title":"sdfsdf"},{"id":5,"userAnswer":null,"correct":true,"title":"dfsdfsdfdfdf"}],"title":"sdfsdf"}', 'multi'),
(162, 94, 'sdfsdfs', '{"type":"multi","questionId":162,"quizIdentifier":null,"answers":[{"id":1,"userAnswer":null,"correct":false,"title":"dfs"},{"id":2,"userAnswer":null,"correct":false,"title":"dfs"},{"id":3,"userAnswer":null,"correct":false,"title":"dfsdfs"},{"id":4,"userAnswer":null,"correct":false,"title":"dfsd"},{"id":5,"userAnswer":null,"correct":true,"title":"fsdffdf"}],"title":"sdfsdfs"}', 'multi'),
(163, 94, 'sfsdf', '{"type":"multi","questionId":163,"quizIdentifier":null,"answers":[{"id":1,"userAnswer":null,"correct":true,"title":"sdf"},{"id":2,"userAnswer":null,"correct":true,"title":"sdfs"},{"id":3,"userAnswer":null,"correct":false,"title":"dfsd"},{"id":4,"userAnswer":null,"correct":false,"title":"fsdf"},{"id":5,"userAnswer":null,"correct":false,"title":"sdfdff"}],"title":"sfsdf"}', 'multi'),
(164, 94, 'sdfs', '{"type":"multi","questionId":164,"quizIdentifier":null,"answers":[{"id":1,"userAnswer":null,"correct":false,"title":"1111111111111111111111"},{"id":2,"userAnswer":null,"correct":true,"title":"sssssssss"},{"id":3,"userAnswer":null,"correct":true,"title":"ssssssssss"},{"id":4,"userAnswer":null,"correct":false,"title":"ssssssssss"},{"id":5,"userAnswer":null,"correct":true,"title":"sssssssssss"}],"title":"sdfs"}', 'multi');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `QuizId` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Owner` int(11) NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedData` datetime DEFAULT NULL,
  PRIMARY KEY (`QuizId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`QuizId`, `Title`, `Type`, `Owner`, `Status`, `CreatedDate`, `ModifiedData`) VALUES
(76, 'Intet Prog Demo', 'simple', 1, 'COMPLETE', '2014-03-29 16:09:28', '2014-03-29 16:09:28'),
(77, 'Title 10', 'asdasdasd', 1, 'COMPLETE', '2014-03-30 12:20:24', '2014-03-30 12:20:24'),
(78, 'asdas', 'dasdasdasd', 1, 'COMPLETE', '2014-03-30 12:22:06', '2014-03-30 12:22:06'),
(79, 'Intet Prog Demo', 'yuyujyu', 1, 'COMPLETE', '2014-03-30 16:14:06', '2014-03-30 16:14:06'),
(80, 'sdfsdf', 'sdfsdfsdf', 1, 'COMPLETE', '2014-03-30 16:21:24', '2014-03-30 16:21:24'),
(81, 'Title 10', '8', 1, 'COMPLETE', '2014-03-30 16:22:55', '2014-03-30 16:22:55'),
(82, 'sdfsdfs', 'dfsdfsdfsdf', 1, 'COMPLETE', '2014-03-30 19:16:28', '2014-03-30 19:16:28'),
(83, 'Title 1', 'cvbcvb', 1, 'COMPLETE', '2014-04-05 18:45:29', '2014-04-05 18:45:29'),
(84, 'Intet Prog Demo2', 'sdfsdfsdfsdf', 1, 'COMPLETE', '2014-04-15 20:01:45', '2014-04-15 20:01:45'),
(85, 'asasd', 'asdasdasd', 1, 'COMPLETE', '2014-04-16 19:33:42', '2014-04-16 19:33:42'),
(86, 'Intet Prog Demo', 'dfgdfgdfgdfg', 1, 'COMPLETE', '2014-04-16 19:57:55', '2014-04-16 19:57:55'),
(87, 'dfgdf', 'dfgdfdfgdfg', 1, 'COMPLETE', '2014-04-16 20:32:10', '2014-04-16 20:32:10'),
(88, 'xvx', 'cvxcvxcvcvcv', 1, 'COMPLETE', '2014-04-16 20:45:50', '2014-04-16 20:45:50'),
(89, 'xv', 'xcvxvxvxcv', 1, 'COMPLETE', '2014-04-16 20:50:47', '2014-04-16 20:50:47'),
(90, 'tttttttttttttttttttt', 'ttttttttttttttttttttt', 1, 'COMPLETE', '2014-04-16 23:33:46', '2014-04-16 23:33:46'),
(91, 'asda', 'sdasdasddsaa', 1, 'COMPLETE', '2014-04-16 23:36:30', '2014-04-16 23:36:30'),
(92, 'sdfsdfsf', 'sdfsdfsdf', 1, 'COMPLETE', '2014-04-16 23:37:25', '2014-04-16 23:37:25'),
(93, 'sdfsdf', 'sdfsdfsdf', 1, 'COMPLETE', '2014-04-17 20:55:20', '2014-04-17 20:55:20'),
(94, 'eeeeeee', 'eeeeeeeeeeeeeeeeee', 1, 'COMPLETE', '2014-04-17 20:58:54', '2014-04-17 20:58:54');

-- --------------------------------------------------------

--
-- Table structure for table `quiztags`
--

CREATE TABLE IF NOT EXISTS `quiztags` (
  `Tag` int(11) NOT NULL DEFAULT '0',
  `QuizId` varchar(45) NOT NULL,
  PRIMARY KEY (`Tag`,`QuizId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `TagId` int(11) NOT NULL AUTO_INCREMENT,
  `Tag` varchar(50) NOT NULL,
  PRIMARY KEY (`TagId`),
  UNIQUE KEY `Tag` (`Tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `AddL1` varchar(45) DEFAULT NULL,
  `AddL2` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Password` varchar(250) DEFAULT NULL,
  `Status` int(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserId` (`UserId`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `UserId`, `Email`, `Role`, `FirstName`, `LastName`, `AddL1`, `AddL2`, `City`, `PostalCode`, `Country`, `Password`, `Status`) VALUES
(1, 'user1', 'test@hotmail.com', 'ROLE_USER', 'GC', NULL, NULL, NULL, NULL, NULL, NULL, '098f6bcd4621d373cade4e832627b4f6', 1),
(2, 'user2', 'test@hotmal.com', 'ROLE_USER', 'test', 'test', 'test', 'test', 'test', '3434', 'sdf', '098f6bcd4621d373cade4e832627b4f6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userquiz`
--

CREATE TABLE IF NOT EXISTS `userquiz` (
  `QuizId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `StartITime` datetime DEFAULT NULL,
  `Marks` int(11) DEFAULT NULL,
  `UserQuizcol` varchar(45) DEFAULT NULL,
  `FinishedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`,`QuizId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
