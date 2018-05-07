/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.28 : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demo`;

/*Table structure for table `demo_blog` */

DROP TABLE IF EXISTS `demo_blog`;

CREATE TABLE `demo_blog` (
  `id` varchar(60) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` text,
  `coverimagpath` varchar(500) DEFAULT NULL,
  `imagename` varchar(200) DEFAULT NULL,
  `createTime` varchar(100) DEFAULT NULL,
  `classid` varchar(10) DEFAULT NULL COMMENT '分类（1234。。。）',
  `brief` text,
  `viewcount` int(11) DEFAULT '0',
  `top` varchar(10) DEFAULT '0' COMMENT '1是置顶',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `demo_blog` */

insert  into `demo_blog`(`id`,`title`,`content`,`coverimagpath`,`imagename`,`createTime`,`classid`,`brief`,`viewcount`,`top`) values ('5f793c93-7d96-47c4-88bb-8f1e35565384','Blog','<p>BlogBlogBlogBlogBlogBlog</p>\r\n','2018/4/2/5f793c93-7d96-47c4-88bb-8f1e35565384','2018/4/2/5f793c93-7d96-47c4-88bb-8f1e35565384/清新枫叶Win7 - 副本.jpg','2018-05-02 10:30:30','2','<p>BlogBlogBlogBlogBlogBlog</p>\r\n',3,'1'),('a5600497-331f-465b-8cab-c49a4c7a8e76','Blog','<p>BlogBlogBlogBlogBlogBlog</p>\r\n','2018/4/2/a5600497-331f-465b-8cab-c49a4c7a8e76','2018/4/2/a5600497-331f-465b-8cab-c49a4c7a8e76/清新枫叶Win7 - 副本.jpg','2018-05-02 10:26:48','2','<p>BlogBlogBlogBlogBlogBlog</p>\r\n',1,'1');

/*Table structure for table `demo_class` */

DROP TABLE IF EXISTS `demo_class`;

CREATE TABLE `demo_class` (
  `id` varchar(50) DEFAULT NULL,
  `genre` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `demo_class` */

insert  into `demo_class`(`id`,`genre`) values ('1','java'),('2','html'),('3','python'),('4','javascript');

/*Table structure for table `demo_comments` */

DROP TABLE IF EXISTS `demo_comments`;

CREATE TABLE `demo_comments` (
  `id` varchar(50) DEFAULT NULL,
  `comments` text,
  `userid` varchar(50) DEFAULT NULL,
  `blogid` varchar(50) DEFAULT NULL,
  `createTime` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `demo_comments` */

insert  into `demo_comments`(`id`,`comments`,`userid`,`blogid`,`createTime`) values ('aa7305b5-d5c7-4b62-9b42-1c778059afbf','123-----admin','fd5fbdc7-40be-488f-ab31-2e1adf8f0e62','816bc270-7a9f-451a-a454-f9add4fc21db','2018-04-27 16:42:02'),('cc54cdc6-78b7-4428-86af-d581ebeff030','456----liuy\r\n','fd5fbdc7-40be-488f-ab31-2e1adf8f0e63','816bc270-7a9f-451a-a454-f9add4fc21db','2018-04-27 16:42:42'),('2e21b744-c26f-4641-933a-79eee0e0273d','@admin: 回复----admin-----by-----liuy','fd5fbdc7-40be-488f-ab31-2e1adf8f0e63','aa7305b5-d5c7-4b62-9b42-1c778059afbf','2018-04-27 16:43:12'),('3eb41cfb-9cf0-42bd-8dc0-eb29787cfdb9','ddd','null','816bc270-7a9f-451a-a454-f9add4fc21db','2018-04-27 16:52:21');

/*Table structure for table `demo_model` */

DROP TABLE IF EXISTS `demo_model`;

CREATE TABLE `demo_model` (
  `id` varchar(66) NOT NULL,
  `userId` varchar(66) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `createTime` varchar(500) DEFAULT NULL,
  `fileName` varchar(500) DEFAULT NULL,
  `type` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `demo_model` */

insert  into `demo_model`(`id`,`userId`,`path`,`createTime`,`fileName`,`type`) values ('033bc07e-5cf8-4cca-93a7-84733e11bd0a','admin','admin/033bc07e-5cf8-4cca-93a7-84733e11bd0a033bc07e-5cf8-4cca-93a7-84733e11bd0a','2018-04-02 18:11:02','timg.jpg','jpg'),('40c39bc9-56c4-45ad-912b-55c9cb1e77ce','admin','2018/3/5/admin/40c39bc9-56c4-45ad-912b-55c9cb1e77ce40c39bc9-56c4-45ad-912b-55c9cb1e77ce','2018-04-05 13:45:25','std.err','err'),('4a333331-8db9-4232-996f-949b6fb1c52f','admin','admin/4a333331-8db9-4232-996f-949b6fb1c52f4a333331-8db9-4232-996f-949b6fb1c52f','2018-04-02 18:58:21','000.txt','txt'),('7384487a-e678-454f-af3b-9f49163e4908','admin','upload/admin/7384487a-e678-454f-af3b-9f49163e49087384487a-e678-454f-af3b-9f49163e4908','2018-04-02 18:07:18','timg - 副本.jpg','jpg'),('a392e91c-c871-4b6a-9bea-cc161623d491','admin','admin/a392e91c-c871-4b6a-9bea-cc161623d491a392e91c-c871-4b6a-9bea-cc161623d491','2018-04-05 13:40:21','trail.txt.7','7'),('c9b4eb8a-c17c-4a50-ae87-d7fb9f23bdc4','admin','2018/3/5/admin/c9b4eb8a-c17c-4a50-ae87-d7fb9f23bdc4c9b4eb8a-c17c-4a50-ae87-d7fb9f23bdc4','2018-04-05 13:58:20','symbol.sym','sym'),('ef5bcd0d-6dcc-40f6-9059-643d56039c7c','admin','admin/ef5bcd0d-6dcc-40f6-9059-643d56039c7cef5bcd0d-6dcc-40f6-9059-643d56039c7c','2018-04-05 13:39:11','base.log','log');

/*Table structure for table `demo_user` */

DROP TABLE IF EXISTS `demo_user`;

CREATE TABLE `demo_user` (
  `id` varchar(66) NOT NULL,
  `name` varchar(666) NOT NULL,
  `password` varchar(50) DEFAULT '1',
  `phoneoremail` varchar(50) DEFAULT NULL,
  `type` varchar(5) DEFAULT '0' COMMENT '1:管理员0:普通用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `demo_user` */

insert  into `demo_user`(`id`,`name`,`password`,`phoneoremail`,`type`) values ('fd5fbdc7-40be-488f-ab31-2e1adf8f0e62','admin','1','939059425@qq.com','1'),('fd5fbdc7-40be-488f-ab31-2e1adf8f0e63','liuy','1','939059425@qq.com','0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
