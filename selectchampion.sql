-- phpMyAdmin SQL Dump
-- version 4.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2015 at 09:40 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

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
(40, '贾克斯', 'Jax', '武器大师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '杰斯', 'Jayce', '未来守护者', NULL, '武装着睿智与魅力，以及标志性的可变形铁锤，杰斯毕生致力于守护他的祖国，皮尔特沃夫。靠着发明家的身份而闻达于世的他，用充满磁性的人格以及创意新颖的作品照亮了城邦人民的生活。不过，他的诸多技术奇迹也吸引了皮尔特沃夫的敌人们的注意力。维克托，这个用机械强化身体的祖安科学家，对杰斯的实验室发动了一次致命的袭击。在受到实验室贫乏的安防部队那形同虚设的阻碍后，维克托偷到了一个奥能转换器的设计图。杰斯担心维克托会用偷来的技术制造毁灭性武器。他恳求皮尔特沃夫政府作出回击，但官员们不愿意对一个侵略性的行为作出支持。他决定亲自处理，因为他意识到，如果现在还不还击的话，皮尔特沃夫将永远不得安宁。\r\n\r\n杰斯回到了他的实验室，并开始着手准备他的孤身作战计划。在经过了一段研究、开发、手动测试的紧张时期后，他露面了。他制造了一系列的强力军备，包括他的至高成就——多功能、可变形的墨丘利之锤。在全副武装、准备妥当后，杰斯发起了进攻，轻易地在维克托的助手们冲过来阻止他的时候将他们荡平。杰斯一路猛进至实验室的心脏地带，并与维克托交手，迫使这个祖安人逃之夭夭。在摧毁了维克托那还在原型阶段的武器后，杰斯回到了皮尔特沃夫，并在那儿受到了英雄般的待遇。他沉醉在赞美声中，但他知道，他的行为已经触怒了城邦的敌人们。现在，全身心保护皮城人民的杰斯，是皮尔特沃夫通向光明未来的希望。\r\n\r\n“相信我：如果我们够机灵的话，皮尔特沃夫就能强势地面对任何威胁。我就是个活生生的例子。”——杰斯', NULL, NULL, NULL, NULL, NULL, NULL),
(42, '金克丝', 'Jinx', '暴走萝莉', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '卡莉丝塔', 'Kalista', '复仇之矛', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '卡尔玛', 'Karma', '天启者', '扇子妈', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, '卡尔萨斯', 'Karthus', '死亡颂唱者', '死歌', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, '卡萨丁', 'Kassadin', '虚空行者', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '卡特琳娜', 'Katarina', '不祥之刃', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '凯尔', 'Kayle', '审判天使', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, '凯南', 'Kennen', '狂暴之心', '电耗子', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, '卡兹克', 'Khazix', '虚空掠夺者', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, '克格莫', 'KogMaw', '深渊巨口', '大嘴', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, '乐芙兰', 'Leblanc', '诡术妖姬', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, '李青', 'LeeSin', '盲僧', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, '蕾欧娜', 'Leona', '曙光女神', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, '丽桑卓', 'Lissandra', '冰霜女巫', '冰女', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, '卢锡安', 'Lucian', '圣枪游侠', '奥巴马', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, '璐璐', 'Lulu', '仙灵女巫', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, '拉克丝', 'Lux', '光辉女郎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, '墨菲特', 'Malphite', '熔岩巨兽', '石头人', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, '玛尔扎哈', 'Malzahar', '虚空先知', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, '茂凯', 'Maokai', '扭曲树精', '树人,大树', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, '易', 'MasterYi', '无极剑圣', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, '赏金猎人', 'MissFortune', '厄运小姐', '女枪', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, '孙悟空', 'MonkeyKing', '齐天大圣', '猴哥,猴子', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, '莫德凯撒', 'Mordekaiser', '金属大师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, '莫甘娜', 'Morgana', '堕落天使', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, '唤潮鲛姬', 'Nami', '娜美', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, '内瑟斯', 'Nasus', '沙漠死神', '狗头', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, '诺提勒斯', 'Nautilus', '深海泰坦', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '奈德丽', 'Nidalee', '狂野女猎手', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, '永恒梦魇', 'Nocturne', '魔腾', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'new', 'Kindred', 'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '努努', 'Nunu', '雪人骑士', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '奥拉夫', 'Olaf', '狂战士', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, '奥莉安娜', 'Orianna', '发条魔灵', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, '潘森', 'Pantheon', '战争之王', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '波比', 'Poppy', '钢铁大使', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, '奎因', 'Quinn', '德玛西亚之翼', '鸟人', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, '拉莫斯', 'Rammus', '披甲龙龟', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, '雷克塞', 'RekSai', '虚空遁地兽', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, '雷克顿', 'Renekton', '荒漠屠夫', '鳄鱼', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, '雷恩加尔', 'Rengar', '傲之追猎者', '狮子狗', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, '锐雯', 'Riven', '放逐之刃', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, '兰博', 'Rumble', '机械公敌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, '瑞兹', 'Ryze', '流浪法师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '瑟庄妮', 'Sejuani', '凛冬之怒', '猪女', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, '萨科', 'Shaco', '恶魔小丑', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, '慎', 'Shen', '暮光之眼', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, '希瓦娜', 'Shyvana', '龙血武姬', '龙女', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, '辛吉德', 'Singed', '炼金术士', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, '赛恩', 'Sion', '亡灵战神', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, '希维尔', 'Sivir', '战争女神', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, '斯卡纳', 'Skarner', '水晶先锋', '蝎子', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, '娑娜', 'Sona', '琴瑟仙女', '琴女', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, '索拉卡', 'Soraka', '众星之子', '奶妈', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, '斯维因', 'Swain', '策士统领', '乌鸦', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, '辛德拉', 'Syndra', '暗黑元首', '球女', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, '塔姆', 'TahmKench', '河流之王', '大蛤蟆', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, '泰隆', 'Talon', '刀锋之影', '男刀', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, '塔里克', 'Taric', '宝石骑士', '宝石', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, '提莫', 'Teemo', '迅捷斥候', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, '锤石', 'Thresh', '魂锁典狱长', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, '崔丝塔娜', 'Tristana', '麦林炮手', '小炮,炮娘', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, '巨魔之王', 'Trundle', '特朗德尔', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, '泰达米尔', 'Tryndamere', '蛮族之王', '蛮王', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, '崔斯特', 'TwistedFate', '卡牌大师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, '图奇', 'Twitch', '瘟疫之源', '老鼠', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, '乌迪尔', 'Udyr', '兽灵行者', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, '厄加特', 'Urgot', '首领之傲', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, '韦鲁斯', 'Varus', '惩戒之箭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, '薇恩', 'Vayne', '暗夜猎手', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, '维迦', 'Veigar', '邪恶小法师', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, '维克兹', 'Velkoz', '虚空之眼', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, '蔚', 'Vi', '皮城执法官', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, '维克托', 'Viktor', '机械先驱', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, '弗拉基米尔', 'Vladimir', '猩红收割者', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, '沃利贝尔', 'Volibear', '雷霆咆哮', '狗熊', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, '沃里克', 'Warwick', '嗜血猎手', '狼人', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, '泽拉斯', 'Xerath', '远古巫灵', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, '赵信', 'XinZhao', '德邦总管', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, '亚索', 'Yasuo', '疾风剑豪', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, '约里克', 'Yorick', '掘墓者', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, '扎克', 'Zac', '生化魔人', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, '劫', 'Zed', '影流之主', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, '吉格斯', 'Ziggs', '爆破鬼才', '炸弹人', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, '基兰', 'Zilean', '时光守护者', '时光老头儿', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, '婕拉', 'Zyra', '荆棘之兴', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, '上单', 'strong', 1, 40, 167, 38),
(2, '上单', 'strong', 1, 25, 101, 20),
(3, '上单', 'strong', 18, 1, 61, 28);

-- --------------------------------------------------------

--
-- Table structure for table `counter_tips`
--

CREATE TABLE IF NOT EXISTS `counter_tips` (
  `id` int(10) NOT NULL,
  `counter_id` int(10) NOT NULL,
  `tip` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` varchar(30) NOT NULL DEFAULT '匿名',
  `vote` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter_tips`
--

INSERT INTO `counter_tips` (`id`, `counter_id`, `tip`, `date_time`, `author`, `vote`) VALUES
(1, 1, 'Jax does really well against aatrox in lane, his e countrs aatroxes w, his damage out scales aatroxes, jax also wins trades in lane better, as a jax this lane isnt easy to lose', '2015-10-12 19:07:41', 'Feifan', 3),
(2, 1, 'this is crazy matchup,this is crazy matchup,this is crazy matchup.', '2015-10-12 19:07:41', 'Feifan', 1),
(3, 1, 'qwerwdsfds', '2015-10-13 17:39:44', 'asdf', 1),
(4, 1, 'sdfddddddd', '2015-10-13 17:42:06', 'asdf', 0),
(5, 1, 's', '2015-10-13 17:42:26', 's', 0),
(6, 1, 'fdd', '2015-10-13 17:46:26', 'sd', 1),
(7, 1, 'sdd', '2015-10-13 17:46:59', 'sd', 0),
(8, 1, 'iii', '2015-10-13 17:50:13', 'kk', 0),
(9, 1, 'ssss', '2015-10-13 17:53:54', 'ddd', 0),
(10, 1, 'testing', '2015-10-13 18:03:01', 'feifan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tier`
--

CREATE TABLE IF NOT EXISTS `tier` (
  `god` varchar(1000) DEFAULT NULL,
  `1` varchar(1000) DEFAULT NULL,
  `2` varchar(1000) DEFAULT NULL,
  `3` varchar(1000) DEFAULT NULL,
  `4` varchar(1000) DEFAULT NULL,
  `explained` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `counter_tips`
--
ALTER TABLE `counter_tips`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
