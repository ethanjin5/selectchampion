-- phpMyAdmin SQL Dump
-- version 4.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 12, 2015 at 04:19 PM
-- Server version: 5.6.23
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `selectchampion`
--
CREATE DATABASE IF NOT EXISTS `selectchampion` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `selectchampion`;

-- --------------------------------------------------------

--
-- Table structure for table `champion_list`
--

CREATE TABLE IF NOT EXISTS `champion_list` (
  `id` int(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `eng_name` varchar(25) NOT NULL,
  `alias` varchar(10) NOT NULL,
  `keywords` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `skill_passive` text,
  `skill_q` text,
  `skill_w` text,
  `skill_e` text,
  `skill_r` text,
  `tags` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `champion_list`
--

INSERT INTO `champion_list` (`id`, `name`, `eng_name`, `alias`, `keywords`, `description`, `skill_passive`, `skill_q`, `skill_w`, `skill_e`, `skill_r`, `tags`) VALUES
(1, '亚托克斯', 'Aatrox', '暗裔剑魔', '剑魔', '<p>亚托克斯是一位传奇战士，也是一个被称为暗裔的上古种族里仅存的五位战士之一。他优雅镇定地挥舞着巨剑，用令人迷离的剑式在千军万马中穿行。每当敌人倒下，亚托克斯那把如同活物般的巨剑便会啜饮着他们的鲜血，同时增强他的力量，并为他残暴、优雅的杀戮战役提供给养。</p>\n<p>最早关于亚托克斯的记述来源于尘封历史中的记载。它述说着两大仅留下名字的杰出派系“护国军”和“法术领主”的战争。在那时，法术领主取得了一系列压倒性的胜利，他们发誓要肃清敌人，护国军处在灭绝的边缘。在他们最后交锋的那天，护国军深知自己寡不敌众，筋疲力尽且装备贫乏。他们准备迎接无法避免的失败。</p>\n<p>当所有希望都看似破灭之时，亚托克斯出现在护国军的行列之中。他短短几句话，督促着士兵战斗到最后。他的存在激励着绝望的士兵。一开始，他们只能怀着敬畏看着这位无名英雄扫荡敌人，他的躯体与巨剑仿若一体。随即，士兵们感受到自己对战斗渴望的潜能。他们跟随亚托克斯加入战斗，每个人都迸发出暴怒之力，直到他们取得了这场几乎没有可能的胜利。</p>\n<p>亚托克斯在战役结束后消失了，但护国军迸发出的怒气却并未改变。他们的凯旋连绵而至，直到他们最终将胜利带回家中。国民们将他们称作英雄，但是，尽管他们将文明从毁灭中挽救，黑暗却在每个战士的心中徘徊。一些东西得以改变。久而久之，他们有关战斗的记忆褪去，取而代之的是一个冷酷的启示：他们的英雄主义，事实上，只是他们用双手犯下的暴行。</p>\n<p>这样的记述出现在许多的文明之中。如果这些传说都是可信的，那么亚托克斯的存在就已改变了历史中许多最为重要的战争的进程。尽管这些故事将他奉为黑暗时代的救世主，但亚托克斯真正留下的也许只是一个充满战火与冲突的世界。</p>\n<p>“战者，或为荣耀，或为赞颂。然此皆仅为战所存也。”——亚托克斯</p>', NULL, NULL, NULL, NULL, NULL, '上单,打野,战士,坦克'),
(2, '阿狸', 'Ahri', '九尾妖狐', '狐狸', '跟其他游荡在艾欧尼亚南部丛林中的狐狸不同，阿狸总觉得她跟魔法世界有一种说不清道不明的联系，一种不完整的联系。在内心深处，她觉得她难以适应这具生而拥有的肉体，梦想有一天可以变成人类。这个梦想看起来遥不可及，直到有一天人类战场上发生的事情改变了她。那是一副惨烈的景象，战场上横七竖八地躺着或重伤或死去的士兵。她被其中一人吸引了：一个身穿长袍的男人，他的生命正在极速地流逝，身边萦绕着一个渐渐衰灭的魔法盾。阿狸走近了他并感到自己内心身处的一些东西被激发了，以某种她难以理解的方式向这个男人展开。他生命的精魄通过无形的魔法纽带，灌入到了阿狸体内。这种感觉令人陶醉而又不可抗拒。当这种醉人的感觉渐渐消退后，阿狸惊喜地发现她已经非同往日。她那顺美洁白的皮毛已经消减，她的体形高挑自然，看起来就像倒在她身周的人类一样。\n\n不过，即便她已成人形，她也知道这次幻化并不完整。作为一只机敏的生物，她很快就适应了人类社会的风俗礼仪，并以她不可多得的天生丽质去吸引心无戒备的男人。当他们拜倒在她的魅惑诱术之下的时候，阿狸就可以吞噬他们的精魄，把自己的梦想建立在别人的欲望之上。但她越是这样做，那种古怪的悔恨感就越是难以遏制。她开始有了她在作为一只狐狸时从没有过的自我约束。她意识到她不能克服她日益增长的道德感。在寻求解决之道的时候，阿狸发现了战争学院，符文大陆上天才法师的云集之地。他们答应帮助她在不作恶的情况下变成真正的人类，只要阿狸为英雄联盟效力。\n\n“慈悲是人类的奢侈之举，但也是责任所在。”——阿狸', NULL, NULL, NULL, NULL, NULL, '中单,法师,刺客'),
(3, '阿卡丽', 'Akali', '暗影之拳', NULL, '艾欧尼亚岛上存在一个上古教派，致力于维护均衡。规则与混乱、光明与黑暗——万物必须和谐共存，这就是宇宙的真理。该教派名为均衡教派，维护世界均衡的神圣使命则由三个暗影战士来执行。阿卡丽便是这三名暗影勇士中一员，她肩负着修枝的神圣职责——将威胁瓦洛兰大陆和谐的敌人消灭干净。\r\n\r\n阿卡丽自小和母亲一起习武，练就一身好武功。母亲的训练严酷无情，她的基本原则是：“我们是在替天行道”。阿卡丽十四岁加入均衡教派，那时她就能空手砍断链条。毋庸置疑，她将继承母亲“暗影之拳”的名号。她的所作所为别人可能无法理解，但在阿卡丽看来，她在执行母亲神圣的信条。现在她和同伴慎，凯南一起维护着瓦洛兰大陆的平衡。这一神圣的追求毫无疑问地将三个暗影战士领向正义之地。\r\n\r\n“暗影之拳在死亡中挥动，平衡不容破坏。”', NULL, NULL, NULL, NULL, NULL, '中单,刺客'),
(4, '阿利斯塔', 'Alistar', '牛头酋长', '', '作为宏伟屏障牛头族历史上最强大的勇士，阿利斯塔保护着他的部落免受来自瓦洛兰大陆的伤害，但诺克萨斯军队的出现打破了这个局面。达克威尔男爵最年轻的儿子，也是诺克萨斯远征军的指挥官——恺朗达克威尔用诡计将阿利斯塔引诱出村庄。当阿利斯塔回去时，他发现村庄已被烧毁，家人也被杀。他愤怒地咆哮着，冲向一群诺克萨斯精英，将他们大卸八块。一些诺克萨斯的精英召唤师挡住了阿利斯塔的进攻。阿利斯塔被囚禁在诺克萨斯，在此期间，他成为了“绞肉大赛”的角斗士，陷入了无尽的战斗，只为了供诺克萨斯贵族娱乐。\r\n\r\n阿利斯塔曾经高尚的灵魂渐渐地扭曲。如果不是年轻女仆艾丽亚的出现，他早就疯掉了。她和他交朋友，并协助他逃跑。突然间获得自由的阿利斯塔加入了刚成立的英雄联盟。成为英雄的他希望有一天能够向诺克萨斯复仇，并找到那个令他重燃希望的女孩。一开始，阿利斯塔并不适应他作为英雄的名人身份，但他后来发现，名声给他带来了能力。他声援那些遭到诺克萨斯政府欺压的人，他还揭露那些诺克萨斯军队想掩盖的真相。这让阿利斯塔很不受诺克萨斯贵族的欢迎。他的慈善事业也让他获得了几次慈善奖项，这和他给英雄联盟带来的愤怒和破坏形成有趣的对比。\r\n\r\n作为召唤师，如果你想通过抓住公牛角来制服公牛，那么阿利斯塔可能有话要说。', NULL, NULL, NULL, NULL, NULL, '辅助,坦克'),
(5, '阿木木', 'Amumu', '殇之木乃伊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '艾尼维亚', 'Anivia', '冰晶凤凰', '冰鸟', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '安妮', 'Annie', '黑暗之女', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '艾希', 'Ashe', '寒冰射手', '爱射,艾射', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '阿兹尔', 'Azir', '沙漠皇帝', '黄金级，黄金脆皮鸡', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '巴德', 'Bard', '星界游神', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '布里茨', 'Blitzcrank', '蒸汽机器人', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '布兰德', 'Brand', '复仇焰魂', '火男', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '布隆', 'Braum', '弗雷尔卓德之心', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '凯特琳', 'Caitlyn', '皮城女警', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '卡西奥佩娅', 'Cassiopeia', '魔蛇之拥', '蛇女', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '科加斯', 'Chogath', '虚空恐惧', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '库奇', 'Corki', '英勇投弹手', '飞机', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '德莱厄斯', 'Darius', '诺克萨斯之手', '小学生之手', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '黛安娜', 'Diana', '皎月女神', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '德莱文', 'Draven', '荣耀行刑官', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '蒙多医生', 'DrMundo', '祖安狂人', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '艾克', 'Ekko', '时间刺客', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '伊莉丝', 'Elise', '蜘蛛女皇', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '伊芙琳', 'Evelynn', '寡妇制造者', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '伊泽瑞尔', 'Ezreal', '探险家', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '费德提克', 'FiddleSticks', '末日使者', '稻草人', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '菲奥娜', 'Fiora', '无双剑姬', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '菲兹', 'Fizz', '潮汐海灵', '小鱼人', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '加里奥', 'Galio', '哨兵之殇', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '普朗克', 'Gangplank', '海洋之灾', '船长', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '盖伦', 'Garen', '德玛西亚之力', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '纳尔', 'Gnar', '迷失之牙', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '古拉加斯', 'Gragas', '酒桶', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '格雷福斯', 'Graves', '法外狂徒', '男枪', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, '赫卡里姆', 'Hecarim', '战争之影', '人马', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '黑默丁格', 'Heimerdinger', '大发明家', '炮台', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '艾瑞莉娅', 'Irelia', '刀锋意志', '女刀', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '迦娜', 'Janna', '风暴之怒', '风女,凤女', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '嘉文四世', 'JarvanIV', '德玛西亚皇子', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '贾克斯', 'Jax', '武器大师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE IF NOT EXISTS `counter` (
  `id` int(10) NOT NULL,
  `type` varchar(5) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `champion_weak` int(3) NOT NULL,
  `champion_strong` int(3) NOT NULL,
  `upvote` int(10) NOT NULL DEFAULT '0',
  `downvote` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id`, `type`, `category`, `champion_weak`, `champion_strong`, `upvote`, `downvote`) VALUES
(1, '上单', 'strong', 1, 40, 166, 39),
(2, '上单', 'strong', 1, 25, 101, 21),
(3, '上单', 'strong', 18, 1, 59, 28);

-- --------------------------------------------------------

--
-- Table structure for table `counter_tips`
--

CREATE TABLE IF NOT EXISTS `counter_tips` (
  `id` int(10) NOT NULL,
  `counter_id` int(10) NOT NULL,
  `tip` text NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` varchar(30) NOT NULL,
  `vote` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter_tips`
--

INSERT INTO `counter_tips` (`id`, `counter_id`, `tip`, `date_time`, `author`, `vote`) VALUES
(1, 1, 'Jax does really well against aatrox in lane, his e countrs aatroxes w, his damage out scales aatroxes, jax also wins trades in lane better, as a jax this lane isnt easy to lose', '2015-10-08 08:53:00', 'Feifan', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `champion_list`
--
ALTER TABLE `champion_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counter_tips`
--
ALTER TABLE `counter_tips`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `champion_list`
--
ALTER TABLE `champion_list`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `counter_tips`
--
ALTER TABLE `counter_tips`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
