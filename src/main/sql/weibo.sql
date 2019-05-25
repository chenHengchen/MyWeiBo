
create table ADMIN_USER_TAB
(
  U_ID           NUMBER not null,
  U_NICKNAME     VARCHAR2(20),
  U_NAME         VARCHAR2(20),
  U_PWD          VARCHAR2(20) not null,
  U_EMAIL        VARCHAR2(200),
  U_SEX          VARCHAR2(8) not null,
  U_POSITION     VARCHAR2(50),
  U_IMAGES       VARCHAR2(200),
  U_SIGN         VARCHAR2(200),
  REGISTERTIME   DATE,
  PWD_QUESTION   VARCHAR2(100),
  PWD_ANSWER     VARCHAR2(100),
  INTEGRAL       NUMBER default 0,
  CONCH_INTEGRAL NUMBER default 0,
  A_NUMBER       NUMBER default 0,
  F_NUMBER       NUMBER default 0,
  CO_NUMBER      NUMBER default 0,
  BLOG_NUMBER    NUMBER default 0,
  LASTLOGIN      DATE,
  U_BIRTHDAY     VARCHAR2(50),
  U_STATE        NUMBER default 0
)
;

create table COLLECT_TAB
(
  C_ID            NUMBER not null,
  M_ID            NUMBER,
  COLLECT_USER_ID NUMBER,
  BE_COLLECT_ID   NUMBER,
  COLLECT_DATE    DATE,
  COLLECT_STATE   NUMBER default 0
)
;
alter table COLLECT_TAB
  add primary key (C_ID);

create table COMM_TAB
(
  C_ID          NUMBER not null,
  M_ID          NUMBER,
  COMMENT_ID    NUMBER,
  BE_COMMENT_ID NUMBER,
  C_DATE        DATE,
  C_BODY        VARCHAR2(500),
  C_LIKE        NUMBER,
  C_STATE       NUMBER
)
;
alter table COMM_TAB
  add primary key (C_ID);

create table CONCH_TAB
(
  ID        NUMBER not null,
  USERID    NUMBER,
  ADOPTID   NUMBER,
  CNUMBER   NUMBER,
  CONCHBODY VARCHAR2(1000),
  CONCHTIME DATE,
  STATE     NUMBER default 0
)
;
alter table CONCH_TAB
  add primary key (ID);

create table FRIEND_TAB
(
  F_ID    NUMBER not null,
  U_ID    NUMBER,
  F_ATTEN NUMBER,
  STATE   NUMBER default 0
)
;
alter table FRIEND_TAB
  add primary key (F_ID);

create table INTEGRAL_TAB
(
  I_ID        NUMBER not null,
  I_OPERATION VARCHAR2(50),
  I_NUMBER    VARCHAR2(50),
  I_DESC      VARCHAR2(100)
)
;
alter table INTEGRAL_TAB
  add primary key (I_ID);

create table LIKE_TAB
(
  LIKE_ID      NUMBER not null,
  WEIBO_ID     NUMBER,
  LIKE_USER_ID NUMBER,
  BE_LIKE_ID   NUMBER,
  LIKE_DATE    DATE
)
;
alter table LIKE_TAB
  add primary key (LIKE_ID);

create table MESSAGE_TAB
(
  ID        NUMBER not null,
  USER_A    NUMBER,
  USER_B    NUMBER,
  M_MESSAGE VARCHAR2(500),
  M_DATE    DATE,
  STATE     NUMBER default 0
)
;
alter table MESSAGE_TAB
  add primary key (ID);

create table RECORD_TAB
(
  R_ID    NUMBER not null,
  U_EMAIL VARCHAR2(50),
  I_ID    NUMBER,
  R_DATE  DATE
)
;
alter table RECORD_TAB
  add primary key (R_ID);

create table TRANS_TAB
(
  T_ID             NUMBER not null,
  M_ID             NUMBER,
  TRANS_USER_ID    NUMBER,
  BE_TRANS_USER_ID NUMBER,
  TRANS_DATE       DATE
)
;
alter table TRANS_TAB
  add primary key (T_ID);

create table USER_TAB
(
  U_ID           NUMBER not null,
  U_NICKNAME     VARCHAR2(20),
  U_NAME         VARCHAR2(20),
  U_PWD          VARCHAR2(20) not null,
  U_EMAIL        VARCHAR2(200),
  U_SEX          VARCHAR2(8) not null,
  U_POSITION     VARCHAR2(50),
  U_IMAGES       VARCHAR2(200),
  U_SIGN         VARCHAR2(200),
  REGISTERTIME   DATE,
  PWD_QUESTION   VARCHAR2(100),
  PWD_ANSWER     VARCHAR2(100),
  INTEGRAL       NUMBER default 0,
  CONCH_INTEGRAL NUMBER default 0,
  A_NUMBER       NUMBER default 0,
  F_NUMBER       NUMBER default 0,
  CO_NUMBER      NUMBER default 0,
  BLOG_NUMBER    NUMBER default 0,
  LASTLOGIN      DATE,
  U_BIRTHDAY     VARCHAR2(50),
  U_STATE        NUMBER default 0,
  BAN_TIME       DATE
)
;
alter table USER_TAB
  add primary key (U_ID);
alter table USER_TAB
  add unique (U_EMAIL);

create table WEIBO_TAB
(
  M_ID      NUMBER not null,
  U_ID      NUMBER,
  M_TRANUM  NUMBER default (0),
  M_COMNUM  NUMBER default (0),
  M_COLNUM  NUMBER default (0),
  M_LIKE    NUMBER default (0),
  M_DATE    DATE,
  M_BODY    VARCHAR2(500),
  M_IMAGE   VARCHAR2(200),
  M_STATE   NUMBER default 0,
  M_TAG     NUMBER default 0,
  M_T_STATE NUMBER default 0
)
;
alter table WEIBO_TAB
  add primary key (M_ID);

insert into ADMIN_USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE)
values (1, null, 'admin', 'admin', null, '1', null, 'face/admin.jpg', null, null, null, null, 0, 0, 0, 0, 0, 0, null, null, 0);
commit;
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (21, 123, 1, 24, to_date('23-03-2017 16:06:41', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (41, 122, 1, 24, to_date('28-03-2017 15:08:47', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (61, 181, 1, 25, to_date('28-03-2017 20:03:43', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (62, 261, 1, 1, to_date('28-03-2017 20:18:51', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (63, 65, 1, 48, to_date('28-03-2017 20:18:54', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (64, 122, 1, 24, to_date('28-03-2017 20:19:00', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (65, 126, 1, 2, to_date('28-03-2017 20:19:02', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (66, 123, 1, 24, to_date('28-03-2017 20:19:07', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (81, 122, 1, 24, to_date('15-04-2017 15:14:28', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (1, 122, 1, 24, to_date('22-03-2017 14:52:24', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (2, 181, 1, 25, to_date('22-03-2017 15:08:26', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (3, 128, 1, 24, to_date('22-03-2017 15:08:28', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (4, 125, 1, 48, to_date('22-03-2017 15:08:35', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (67, 66, 1, 48, to_date('28-03-2017 20:58:58', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (68, 68, 1, 49, to_date('28-03-2017 20:59:16', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (69, 67, 1, 49, to_date('28-03-2017 20:59:18', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into COLLECT_TAB (C_ID, M_ID, COLLECT_USER_ID, BE_COLLECT_ID, COLLECT_DATE, COLLECT_STATE)
values (70, 70, 1, 50, to_date('28-03-2017 20:59:21', 'dd-mm-yyyy hh24:mi:ss'), 0);
commit;
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (1, 122, 1, 24, to_date('13-03-2017', 'dd-mm-yyyy'), '哈哈哈', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (2, 122, 2, 24, to_date('13-03-2017', 'dd-mm-yyyy'), '吼吼吼[@F_51@]', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (181, 422, 1, 0, to_date('18-04-2017 19:44:14', 'dd-mm-yyyy hh24:mi:ss'), '因为你是傻瓜[@F_9@]', 0, 100);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (201, 427, 1, 24, to_date('21-04-2017 10:57:14', 'dd-mm-yyyy hh24:mi:ss'), '你好', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (202, 461, 24, 1, to_date('21-04-2017 10:58:47', 'dd-mm-yyyy hh24:mi:ss'), '天气不错哈', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (221, 482, 1, 1, to_date('26-04-2017 21:42:34', 'dd-mm-yyyy hh24:mi:ss'), '[@F_1@][@F_1@]', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (241, 502, 1, 0, to_date('02-05-2017 10:32:42', 'dd-mm-yyyy hh24:mi:ss'), '嘿', 0, 100);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (242, 502, 1, 0, to_date('02-05-2017 10:32:49', 'dd-mm-yyyy hh24:mi:ss'), '你好', 0, 100);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (243, 502, 1, 0, to_date('02-05-2017 10:32:55', 'dd-mm-yyyy hh24:mi:ss'), '你好', 0, 100);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (244, 462, 1, 24, to_date('02-05-2017 10:33:10', 'dd-mm-yyyy hh24:mi:ss'), '呀', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (41, 128, 1, 24, to_date('21-03-2017', 'dd-mm-yyyy'), '啊呀[@F_26@]', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (21, 181, 1, 25, to_date('15-03-2017', 'dd-mm-yyyy'), '嘿嘿嘿[@F_3@]', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (3, 122, 2, 24, to_date('13-03-2017', 'dd-mm-yyyy'), '[@F_24@]呵呵呵', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (4, 122, 48, 24, to_date('13-03-2017', 'dd-mm-yyyy'), '[@F_13@]好好好', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (5, 122, 48, 24, to_date('13-03-2017', 'dd-mm-yyyy'), '这是第五条评论', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (6, 122, 49, 24, to_date('13-03-2017', 'dd-mm-yyyy'), '第六条，5条评论一个分页，开始', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (61, 262, 1, 1, to_date('22-03-2017', 'dd-mm-yyyy'), '嘿嘿嘿', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (81, 128, 1, 24, to_date('24-03-2017 11:13:33', 'dd-mm-yyyy hh24:mi:ss'), '哈哈哈，还有谁', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (101, 122, 1, 24, to_date('25-03-2017 17:17:35', 'dd-mm-yyyy hh24:mi:ss'), '我特么是个', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (121, 261, 1, 1, to_date('28-03-2017 16:42:20', 'dd-mm-yyyy hh24:mi:ss'), 'hhh', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (141, 122, 1, 24, to_date('28-03-2017 21:12:02', 'dd-mm-yyyy hh24:mi:ss'), '你好', 0, 1);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (161, 24, 1, 0, to_date('18-04-2017 17:21:57', 'dd-mm-yyyy hh24:mi:ss'), '因为爱情[@F_51@]', 0, 100);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (162, 24, 1, 0, to_date('18-04-2017 17:22:55', 'dd-mm-yyyy hh24:mi:ss'), '怎么样[@F_51@]采纳我吧', 0, 100);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (163, 422, 1, 0, to_date('18-04-2017 17:26:43', 'dd-mm-yyyy hh24:mi:ss'), '因为爱情[@F_51@]', 0, 101);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (203, 426, 48, 0, to_date('21-04-2017 13:50:42', 'dd-mm-yyyy hh24:mi:ss'), '嗯，好诗[@F_23@]', 0, 100);
insert into COMM_TAB (C_ID, M_ID, COMMENT_ID, BE_COMMENT_ID, C_DATE, C_BODY, C_LIKE, C_STATE)
values (204, 426, 49, 0, to_date('21-04-2017 14:23:05', 'dd-mm-yyyy hh24:mi:ss'), '个人认为这两句还有待提高！！！', 0, 100);
commit;
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (502, 1, null, 10, '嘿，你好', to_date('02-05-2017 10:32:31', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (400, 1, null, 30, '有问题为什么不先问问神奇海螺~[@F_23@]', to_date('17-04-2017 17:22:10', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (401, 1, null, 10, '为什么还不下班[@F_21@]', to_date('17-04-2017 17:24:32', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (402, 1, null, 10, '为什么还不下班[@F_21@]', to_date('17-04-2017 17:25:38', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (421, 24, null, 10, '为什么天是蓝的，云是白的[@F_35@]', to_date('18-04-2017 10:20:02', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (422, 24, null, 10, '为什么我这么无聊[@F_50@]', to_date('18-04-2017 10:20:33', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (423, 1, null, 10, '为什么[@F_40@]', to_date('18-04-2017 10:21:59', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (424, 1, null, 10, '水水水水水水水水水水水水水水[@F_50@][@F_8@][@F_8@][@F_8@][@F_8@][@F_8@]', to_date('18-04-2017 10:25:09', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (425, 1, null, 10, '铃兰且素雅<br>不惭满庭芳', to_date('18-04-2017 10:28:33', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into CONCH_TAB (ID, USERID, ADOPTID, CNUMBER, CONCHBODY, CONCHTIME, STATE)
values (426, 1, null, 10, '铃兰且素雅<br>不惭满庭芳', to_date('18-04-2017 10:30:07', 'dd-mm-yyyy hh24:mi:ss'), 2);
commit;
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (13, 45, 41, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (4, 1, 24, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (15, 45, 2, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (6, 1, 23, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (19, 46, 45, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (17, 46, 25, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (14, 45, 43, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (8, 1, 22, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (9, 1, 23, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (18, 46, 1, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (20, 46, 24, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (21, 46, 43, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (22, 47, 46, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (23, 47, 42, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (24, 47, 2, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (25, 47, 44, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (26, 47, 1, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (27, 48, 47, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (28, 48, 25, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (29, 48, 1, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (30, 48, 21, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (31, 48, 23, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (32, 49, 24, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (33, 49, 42, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (34, 49, 43, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (35, 49, 22, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (36, 49, 1, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (37, 50, 1, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (38, 50, 41, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (39, 50, 43, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (40, 50, 22, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (41, 50, 48, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (42, 50, 41, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (43, 41, 49, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (44, 41, 24, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (45, 41, 50, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (46, 41, 45, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (47, 41, 48, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (51, 1, 2, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (49, 1, 48, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (82, 2, 24, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (81, 2, 41, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (101, 1, 25, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (83, 48, 24, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (61, 2, 1, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (62, 1, 21, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (102, 1, 41, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (143, 24, 2, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (141, 24, 21, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (142, 24, 1, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (161, 1, 44, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (103, 1, 50, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (105, 1, 45, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (106, 1, 49, 0);
insert into FRIEND_TAB (F_ID, U_ID, F_ATTEN, STATE)
values (107, 1, 46, 0);
commit;

insert into INTEGRAL_TAB (I_ID, I_OPERATION, I_NUMBER, I_DESC)
values (1, 'REGISTER', '50', '注册用户');
insert into INTEGRAL_TAB (I_ID, I_OPERATION, I_NUMBER, I_DESC)
values (2, 'LOGIN', '10', '每日登陆');
commit;

insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (44, 129, 1, 48, to_date('09-03-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (161, 122, 1, 24, to_date('28-03-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (46, 65, 1, 48, to_date('09-03-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (45, 124, 1, 48, to_date('09-03-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (181, 304, 1, 1, to_date('28-03-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (201, 427, 1, 24, to_date('21-04-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (202, 461, 24, 1, to_date('21-04-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (221, 481, 1, 1, to_date('26-04-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (81, 181, 1, 25, to_date('15-03-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (101, 128, 1, 24, to_date('18-03-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (241, 521, 1, 1, to_date('09-05-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (141, 66, 1, 48, to_date('24-03-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (142, 41, 1, 2, to_date('24-03-2017', 'dd-mm-yyyy'));
insert into LIKE_TAB (LIKE_ID, WEIBO_ID, LIKE_USER_ID, BE_LIKE_ID, LIKE_DATE)
values (162, 261, 1, 1, to_date('28-03-2017', 'dd-mm-yyyy'));
commit;

insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (362, 1, 24, '[@F_3@]云开真人', to_date('14-04-2017 22:32:20', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (364, 24, 1, '你好呀[@F_3@]', to_date('14-04-2017 22:38:49', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (384, 48, 1, '未读2条[@F_34@]', to_date('17-04-2017 11:02:31', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (385, 49, 1, '你好呀[@F_51@]', to_date('17-04-2017 11:10:45', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (386, 49, 1, 'dog[@F_51@]二哈[@F_52@]', to_date('17-04-2017 11:11:03', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (387, 1, 49, '[@F_30@]', to_date('17-04-2017 11:11:58', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (388, 1, 49, '嘿嘿嘿', to_date('17-04-2017 11:12:17', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (392, 47, 1, '哈哈哈', to_date('17-04-2017 11:16:30', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (393, 47, 1, '哈哈哈', to_date('17-04-2017 11:16:32', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (394, 47, 1, '[@F_18@]', to_date('17-04-2017 11:17:14', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (395, 50, 1, '[@F_33@]....', to_date('17-04-2017 11:17:52', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (396, 1, 47, '[@F_18@]...' || chr(13) || '' || chr(10) || '', to_date('17-04-2017 11:18:27', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (397, 1, 50, 'what?[@F_23@]', to_date('17-04-2017 11:18:41', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (398, 1, 48, '未读1条', to_date('17-04-2017 11:21:56', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (399, 1, 48, '[@F_15@]两条', to_date('17-04-2017 11:22:08', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (1, 2, 1, '嘿嘿嘿，你好呀', to_date('12-04-2017', 'dd-mm-yyyy'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (2, 1, 2, '你好', to_date('20-04-2017', 'dd-mm-yyyy'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (3, 2, 1, '阿尼呀赛呦', to_date('26-04-2017', 'dd-mm-yyyy'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (4, 1, 2, '咳咳咳咳咳', to_date('10-04-2017', 'dd-mm-yyyy'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (381, 1, 23, '[@F_4@]你好', to_date('17-04-2017 10:26:32', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (382, 1, 21, '[@F_20@]你好', to_date('17-04-2017 10:26:42', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (383, 48, 1, 'hi boy[@F_3@]', to_date('17-04-2017 10:30:05', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (389, 1, 24, '嗯嗯', to_date('17-04-2017 11:13:57', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (390, 1, 49, '你才是二哈[@F_51@]', to_date('17-04-2017 11:14:09', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into MESSAGE_TAB (ID, USER_A, USER_B, M_MESSAGE, M_DATE, STATE)
values (391, 47, 1, '早上好[@F_15@]', to_date('17-04-2017 11:15:09', 'dd-mm-yyyy hh24:mi:ss'), 1);
commit;

insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (1, '1296401512@qq.com', 1, to_date('23-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (2, 'xx1297673205@qq.com', 1, to_date('23-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (6, '1296401512@qq.com', 2, to_date('23-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (22, '1296401512@qq.com', 2, to_date('24-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (61, '1296401512@qq.com', 2, to_date('28-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (81, '1296401512@qq.com', 2, to_date('01-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (101, '1296401512@qq.com', 2, to_date('02-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (122, 'wxiao222@163.com', 2, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (123, '1@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (124, '2@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (125, '3@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (126, '4@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (127, 'sss@', 2, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (128, 'qqq@', 2, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (129, '18166049292@163.com', 2, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (130, '5@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (131, '6@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (132, '7@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (133, '8@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (134, '9@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (135, '10@qq.com', 1, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (161, '1296401512@qq.com', 2, to_date('08-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (181, '1296401512@qq.com', 2, to_date('09-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (201, '1296401512@qq.com', 2, to_date('10-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (222, '18166049292@163.com', 2, to_date('13-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (223, 'xx1297673205@qq.com', 2, to_date('13-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (261, '1296401512@qq.com', 2, to_date('16-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (281, '1296401512@qq.com', 2, to_date('17-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (301, '1296401512@qq.com', 2, to_date('18-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (381, '1296401512@qq.com', 2, to_date('23-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (401, '1296401512@qq.com', 2, to_date('24-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (421, '1296401512@qq.com', 2, to_date('25-03-2017 16:39:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (441, '1296401512@qq.com', 2, to_date('27-03-2017 16:59:51', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (461, '1296401512@qq.com', 2, to_date('28-03-2017 15:08:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (521, '1296401512@qq.com', 2, to_date('13-04-2017 19:35:32', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (522, 'SYF@qq.com', 2, to_date('13-04-2017 20:14:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (541, '1296401512@qq.com', 2, to_date('14-04-2017 09:04:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (641, '1296401512@qq.com', 2, to_date('19-04-2017 09:48:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (661, '1296401512@qq.com', 2, to_date('20-04-2017 10:42:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (681, '1296401512@qq.com', 2, to_date('21-04-2017 09:35:57', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (682, '18166049292@163.com', 2, to_date('21-04-2017 10:57:47', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (701, '1296401512@qq.com', 2, to_date('26-04-2017 21:40:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (741, 'cs11@qq.com', 1, to_date('30-04-2017 00:02:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (761, '1296401512@qq.com', 2, to_date('02-05-2017 10:32:07', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (781, '1296401512@qq.com', 2, to_date('03-05-2017 13:26:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (821, '1296401512@qq.com', 2, to_date('08-05-2017 11:12:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (841, '1296401512@qq.com', 2, to_date('09-05-2017 09:24:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (141, '1296401512@qq.com', 2, to_date('07-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (341, '1296401512@qq.com', 2, to_date('21-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (581, '1296401512@qq.com', 2, to_date('15-04-2017 14:54:31', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (242, 'SYF@qq.com', 2, to_date('15-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (21, 'xx1297673205@qq.com', 2, to_date('24-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (41, '1296401512@qq.com', 2, to_date('27-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (42, 'xx1297673205@qq.com', 2, to_date('27-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (62, 'xx1297673205@qq.com', 2, to_date('28-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (63, 'wxiao222@163.com', 1, to_date('28-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (64, 'sss@', 1, to_date('28-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (66, '18166049292@163.com', 1, to_date('28-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (67, 'SYF@qq.com', 1, to_date('28-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (102, 'xx1297673205@qq.com', 2, to_date('02-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (121, '1296401512@qq.com', 2, to_date('03-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (162, 'xx1297673205@qq.com', 2, to_date('08-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (163, '18166049292@163.com', 2, to_date('08-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (164, '8@qq.com', 2, to_date('08-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (221, '1296401512@qq.com', 2, to_date('13-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (224, '8@qq.com', 2, to_date('13-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (225, '9@qq.com', 2, to_date('13-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (241, '1296401512@qq.com', 2, to_date('15-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (361, '1296401512@qq.com', 2, to_date('22-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (422, '18166049292@163.com', 2, to_date('25-03-2017 17:34:51', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (481, '18166049292@163.com', 2, to_date('01-04-2017 15:33:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (482, '1296401512@qq.com', 2, to_date('01-04-2017 15:33:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (561, '18166049292@163.com', 2, to_date('14-04-2017 22:37:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (604, '9@qq.com', 2, to_date('17-04-2017 11:06:32', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (606, '10@qq.com', 2, to_date('17-04-2017 11:17:31', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (622, '18166049292@163.com', 2, to_date('18-04-2017 10:19:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (683, '8@qq.com', 2, to_date('21-04-2017 13:50:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (684, '9@qq.com', 2, to_date('21-04-2017 14:22:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (721, '1296401512@qq.com', 2, to_date('28-04-2017 09:16:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (801, '1296401512@qq.com', 2, to_date('05-05-2017 23:04:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (65, 'qqq@', 1, to_date('28-02-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (321, '1296401512@qq.com', 2, to_date('20-03-2017', 'dd-mm-yyyy'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (501, '1296401512@qq.com', 2, to_date('11-04-2017 17:43:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (601, '1296401512@qq.com', 2, to_date('17-04-2017 09:39:27', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (602, '18166049292@163.com', 2, to_date('17-04-2017 09:41:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (603, '8@qq.com', 2, to_date('17-04-2017 10:29:20', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (605, '7@qq.com', 2, to_date('17-04-2017 11:14:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (621, '1296401512@qq.com', 2, to_date('18-04-2017 10:12:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into RECORD_TAB (R_ID, U_EMAIL, I_ID, R_DATE)
values (722, '111@', 1, to_date('28-04-2017 15:02:51', 'dd-mm-yyyy hh24:mi:ss'));
commit;

insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (9, 121, 1, 2, to_date('10-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (10, 41, 1, 2, to_date('10-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (7, 122, 1, 24, to_date('10-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (8, 66, 1, 48, to_date('10-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (21, 128, 1, 24, to_date('13-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (22, 125, 1, 48, to_date('13-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (121, 262, 1, 1, to_date('23-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (181, 65, 1, 48, to_date('14-04-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (221, 461, 24, 1, to_date('21-04-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (241, 481, 1, 1, to_date('26-04-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (101, 261, 1, 1, to_date('22-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (41, 122, 1, 24, to_date('18-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (81, 69, 1, 50, to_date('21-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (141, 123, 1, 24, to_date('28-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (142, 261, 1, 1, to_date('28-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (201, 41, 24, 2, to_date('18-04-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (61, 122, 1, 24, to_date('20-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (62, 128, 1, 24, to_date('20-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (63, 181, 1, 25, to_date('20-03-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (161, 262, 1, 1, to_date('11-04-2017', 'dd-mm-yyyy'));
insert into TRANS_TAB (T_ID, M_ID, TRANS_USER_ID, BE_TRANS_USER_ID, TRANS_DATE)
values (162, 241, 1, 1, to_date('11-04-2017', 'dd-mm-yyyy'));
commit;

insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (1, '吾生而流浪', '王潇', '111111', '1296401512@qq.com', '1', '火星', 'face/10DE89D172157033BCF353C027B2E493A.jpg', '吾生而流浪，处处皆风景', to_date('23-02-2017', 'dd-mm-yyyy'), '喜欢谁', '雅芳', 460, 900, 25, 7, 16, 26, to_date('09-05-2017 09:24:24', 'dd-mm-yyyy hh24:mi:ss'), '1967-1-1', 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (2, '傻雅芳', 'SYF', '520LYFXE', 'xx1297673205@qq.com', '1', '南昌', 'face/2huahua.jpg', '笨蛋潇', to_date('23-02-2017', 'dd-mm-yyyy'), '喜欢谁', '雅芳儿', 110, 0, 3, 7, 0, 4, to_date('13-03-2017', 'dd-mm-yyyy'), '1967-1-1', 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (41, '测试1号', null, '111111', '1@qq.com', '1', null, 'face/41u=4135025624,423214642&fm=214&gp=0.jpg', '好热啊', to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 50, 0, 5, 5, 0, 1, to_date('03-03-2017', 'dd-mm-yyyy'), '1967-1-1', 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (42, '测试2号', null, '111111', '2@qq.com', '1', null, 'face/424-1604161HA9-50.jpg', null, to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 50, 0, 0, 2, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (43, '测试3号', null, '111111', '3@qq.com', '1', null, 'face/4301164209eb3d4c13e0eb904e387fca7c.jpg', null, to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 50, 0, 0, 4, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (44, '测试4号', null, '111111', '4@qq.com', '1', null, 'face/449596d14d6206d6a77b5517457378516b.jpg', null, to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 50, 0, 0, 2, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (45, '测试5号', null, '111111', '5@qq.com', '0', null, 'face/4520151208084927827.jpg', null, to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 50, 0, 3, 3, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (46, '测试6号', null, '111111', '6@qq.com', '1', null, 'face/4620151208084927827.jpg', null, to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 50, 0, 5, 2, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (47, '测试7号', null, '111111', '7@qq.com', '0', null, 'face/47bd11314178.jpg', null, to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 60, 0, 5, 1, 0, 3, to_date('17-04-2017 11:14:39', 'dd-mm-yyyy hh24:mi:ss'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (48, '测试8号', null, '111111', '8@qq.com', '0', null, 'face/4820150217165304_8kHxx.jpg', null, to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 90, 0, 6, 3, 0, 5, to_date('21-04-2017 13:50:22', 'dd-mm-yyyy hh24:mi:ss'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (49, '测试8号', null, '111111', '9@qq.com', '1', null, 'face/492015011613064.jpg', null, to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 80, 0, 5, 2, 0, 2, to_date('21-04-2017 14:22:17', 'dd-mm-yyyy hh24:mi:ss'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (50, '测试10号', null, '111111', '10@qq.com', '1', null, 'face/50u=3227679192,1354975473&fm=214&gp=0.jpg', null, to_date('03-03-2017', 'dd-mm-yyyy'), '111', '111', 60, 0, 6, 2, 0, 2, to_date('17-04-2017 11:17:31', 'dd-mm-yyyy hh24:mi:ss'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (81, '测试11号', null, '111111', 'cs11@qq.com', '1', null, 'face/boy.png', null, to_date('30-04-2017 00:02:05', 'dd-mm-yyyy hh24:mi:ss'), 'qqqqqq', 'qq去', 50, 0, 0, 0, 0, 0, to_date('30-04-2017 00:02:05', 'dd-mm-yyyy hh24:mi:ss'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (21, '听雨成雪', null, '222222', 'wxiao222@163.com', '1', null, 'face/219031e329gy1fcwq2ngcrhj20m80vgdkn.jpg', null, to_date('28-02-2017', 'dd-mm-yyyy'), '喜欢谁', '雅芳儿', 60, 0, 0, 7, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (22, '111', null, '111111', 'sss@', '1', null, 'face/22u=406895119,1281264363&fm=214&gp=0.jpg', null, to_date('28-02-2017', 'dd-mm-yyyy'), '111', '111', 60, 0, 0, 3, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (24, '云开晴空', null, '111111', '18166049292@163.com', '1', null, 'face/24u=3227679192,1354975473&fm=214&gp=0.jpg', null, to_date('28-02-2017', 'dd-mm-yyyy'), '喜欢谁', '雅芳儿', 140, 0, 3, 6, 0, 3, to_date('21-04-2017 10:57:47', 'dd-mm-yyyy hh24:mi:ss'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (25, '傻雅芳', ' ', '520LYFXE', 'SYF@qq.com', '1', null, 'face/2520150217165304_8kHxx.jpg', null, to_date('28-02-2017', 'dd-mm-yyyy'), '喜欢谁', '雅芳儿', 70, 0, 0, 7, 0, 1, to_date('13-04-2017 20:14:00', 'dd-mm-yyyy hh24:mi:ss'), '1967-1-1', 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (23, 'qqqqqq', null, 'qqqqqq', 'qqq@', '1', null, 'face/23bd11314178.jpg', null, to_date('28-02-2017', 'dd-mm-yyyy'), 'qqqqqq', 'qqqqqq', 60, 0, 0, 3, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), null, 0, null);
insert into USER_TAB (U_ID, U_NICKNAME, U_NAME, U_PWD, U_EMAIL, U_SEX, U_POSITION, U_IMAGES, U_SIGN, REGISTERTIME, PWD_QUESTION, PWD_ANSWER, INTEGRAL, CONCH_INTEGRAL, A_NUMBER, F_NUMBER, CO_NUMBER, BLOG_NUMBER, LASTLOGIN, U_BIRTHDAY, U_STATE, BAN_TIME)
values (61, '碎梦残光', null, '111111', '111@', '1', null, 'face/boy.png', null, to_date('28-04-2017 15:02:51', 'dd-mm-yyyy hh24:mi:ss'), '111', '111', 50, 0, 0, 0, 0, 0, to_date('28-04-2017 15:02:51', 'dd-mm-yyyy hh24:mi:ss'), null, 0, null);
commit;

insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (61, 47, 0, 0, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), '嗯？刚才居然忘记发微博了，失误[@F_5@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (62, 47, 0, 0, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), '王之蔑视[@F_51@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (64, 47, 0, 0, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), '[@F_47@]带图片的测试', 'upload/pic/47u=3227679192,1354975473&fm=214&gp=0.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (65, 48, 1, 0, 0, 1, to_date('03-03-2017', 'dd-mm-yyyy'), '不知不觉到8了，先写点数据进去，方便接下来的开发[@F_43@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (66, 48, 1, 0, 0, 1, to_date('03-03-2017', 'dd-mm-yyyy'), '[@F_6@][@F_5@]', 'upload/pic/48u=3227679192,1354975473&fm=214&gp=0.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (67, 49, 0, 0, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), '测试9号[@F_52@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (68, 49, 0, 0, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), '[@F_18@][@F_18@][@F_18@]', 'upload/pic/499031e329gy1fcwq2mrz19j20m30gotci.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (69, 50, 1, 0, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), '哈哈[@F_5@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (70, 50, 0, 0, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), '先写到测试10吧[@F_42@][@F_42@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (71, 41, 0, 0, 0, 0, to_date('03-03-2017', 'dd-mm-yyyy'), '好热啊，空调温度太高了[@F_24@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (151, 1, 0, 0, 0, 0, to_date('10-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=2">@傻雅芳</a> 说点什么吧[@F_51@]', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (155, 1, 0, 0, 0, 0, to_date('10-03-2017', 'dd-mm-yyyy'), '[@F_47@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (156, 1, 0, 0, 0, 0, to_date('10-03-2017', 'dd-mm-yyyy'), '嗯？</br>换行[@F_51@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (157, 1, 0, 0, 0, 0, to_date('10-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=2">@傻雅芳</a> 笨蛋潇[@F_29@]', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (161, 1, 0, 0, 0, 0, to_date('13-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=24style=''text-decoration:none'' ">@云开晴空</a> [@F_51@]傻孩砸', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (162, 1, 0, 0, 0, 0, to_date('13-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=48" style=''text-decoration:none'' ">@测试8号</a> 唔。。。。。。。' || chr(13) || '' || chr(10) || '。。。。' || chr(13) || '' || chr(10) || '。。。。' || chr(13) || '' || chr(10) || '。。。。', 'upload/pic/48bd11314178.jpg', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (149, 1, 0, 0, 0, 0, to_date('10-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=24">@云开晴空</a> 傻孩砸[@F_34@]给奶奶看看你的小手。。。。。嗯。。又圆润了许多啊', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (150, 1, 0, 0, 0, 0, to_date('10-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=48">@测试8号</a> [@F_6@][@F_5@]', 'upload/pic/48u=3227679192,1354975473&fm=214&gp=0.jpg', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (281, 1, 0, 0, 0, 0, to_date('23-03-2017 13:23:05', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=1" style=''text-decoration:none'' ">@吾生而流浪</a> 转发<a href="user_index?userId=1" style=''text-decoration:none'' ">@吾生而流浪</a> oracle 1521', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (341, 1, 0, 0, 0, 0, to_date('14-04-2017 09:05:44', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=48" style=''text-decoration:none'' ">@测试8号</a> 不知不觉到8了，先写点数据进去，方便接下来的开发[@F_43@]', 'null', 1, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (461, 1, 1, 1, 0, 1, to_date('21-04-2017 09:37:26', 'dd-mm-yyyy hh24:mi:ss'), '今天天气不错[@F_25@]', 'upload/pic/11161320162423_mthumb.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (462, 24, 0, 1, 0, 0, to_date('21-04-2017 10:58:37', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=1" style=''text-decoration:none'' ">@吾生而流浪</a> 今天天气不错[@F_25@]', 'upload/pic/11161320162423_mthumb.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (481, 1, 1, 0, 0, 1, to_date('26-04-2017 21:41:31', 'dd-mm-yyyy hh24:mi:ss'), '[@F_27@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (482, 1, 0, 1, 0, 0, to_date('26-04-2017 21:41:56', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=1" style=''text-decoration:none'' ">@吾生而流浪</a> [@F_27@]', 'null', 1, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (501, 1, 0, 0, 0, 0, to_date('02-05-2017 10:32:19', 'dd-mm-yyyy hh24:mi:ss'), '今天星期一[@F_48@]', 'null', 1, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (521, 1, 0, 0, 0, 1, to_date('08-05-2017 11:21:36', 'dd-mm-yyyy hh24:mi:ss'), '今天星期一。。。。[@F_22@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (81, 1, 0, 0, 0, 0, to_date('07-03-2017', 'dd-mm-yyyy'), '[@F_34@]', 'upload/pic/120150217165304_8kHxx.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (181, 25, 1, 1, 0, 1, to_date('15-03-2017', 'dd-mm-yyyy'), 'hi boy[@F_34@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (24, 1, 0, 0, 0, 0, to_date('01-03-2017', 'dd-mm-yyyy'), '呐！第一次送你的花花[@F_3@]', 'upload/pic/1huahua.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (25, 1, 0, 0, 0, 0, to_date('01-03-2017', 'dd-mm-yyyy'), '你好[@F_33@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (26, 1, 0, 0, 0, 0, to_date('01-03-2017', 'dd-mm-yyyy'), '想你[@F_33@]', 'upload/pic/13EB00CCE5559D6DD1343765DAE62013E.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (41, 2, 2, 0, 0, 1, to_date('02-03-2017', 'dd-mm-yyyy'), '笨蛋潇[@F_29@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (101, 1, 0, 0, 0, 0, to_date('07-03-2017', 'dd-mm-yyyy'), '[@F_33@]是不是越来越远了', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (102, 1, 0, 0, 0, 0, to_date('07-03-2017', 'dd-mm-yyyy'), '虽然以前一直想看你空间，我明白等你把空间开了，只有两个结果', 'null', 1, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (103, 1, 0, 0, 0, 0, to_date('07-03-2017', 'dd-mm-yyyy'), '[@F_33@]我会等你的', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (104, 1, 0, 0, 0, 0, to_date('07-03-2017', 'dd-mm-yyyy'), '[@F_33@]一直', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (105, 1, 0, 0, 0, 0, to_date('07-03-2017', 'dd-mm-yyyy'), '[@F_10@][@F_5@]', 'upload/pic/19031e329gy1fcwq2mrz19j20m30gotci.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (106, 1, 0, 0, 0, 0, to_date('07-03-2017', 'dd-mm-yyyy'), '[@F_1@]', 'upload/pic/10ad5d7213dc2f618f834c6d7ede810de.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (107, 1, 0, 0, 0, 0, to_date('07-03-2017', 'dd-mm-yyyy'), '分页[@F_5@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (121, 2, 1, 0, 0, 0, to_date('08-03-2017', 'dd-mm-yyyy'), '说点什么吧[@F_51@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (122, 24, 3, 8, 0, 1, to_date('08-03-2017', 'dd-mm-yyyy'), '傻孩砸[@F_34@]给奶奶看看你的小手。。。。。嗯。。又圆润了许多啊', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (123, 24, 1, 0, 0, 0, to_date('08-03-2017', 'dd-mm-yyyy'), '[@F_28@]哈哈哈哈哈哈哈哈', 'upload/pic/24006ajtzXgy1fcwsrrio5uj30hs0rwabi.jpg', 1, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (124, 48, 0, 0, 0, 1, to_date('08-03-2017', 'dd-mm-yyyy'), '该怎么办呢，心慌慌。。。。[@F_22@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (125, 48, 1, 0, 0, 0, to_date('08-03-2017', 'dd-mm-yyyy'), '唔。。。。。。。' || chr(13) || '' || chr(10) || '。。。。' || chr(13) || '' || chr(10) || '。。。。' || chr(13) || '' || chr(10) || '。。。。', 'upload/pic/48bd11314178.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (126, 2, 0, 0, 0, 0, to_date('08-03-2017', 'dd-mm-yyyy'), '[@F_22@]吃饭吃饭[@F_22@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (127, 2, 0, 0, 0, 0, to_date('08-03-2017', 'dd-mm-yyyy'), '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '啊啊啊', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (128, 24, 2, 2, 0, 1, to_date('08-03-2017', 'dd-mm-yyyy'), '[@F_51@]傻孩砸', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (129, 48, 0, 0, 0, 1, to_date('08-03-2017', 'dd-mm-yyyy'), '[@F_18@]嘿嘿' || chr(13) || '' || chr(10) || '1' || chr(13) || '' || chr(10) || '2' || chr(13) || '' || chr(10) || '3' || chr(13) || '' || chr(10) || '4', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (201, 1, 0, 0, 0, 0, to_date('18-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=24" style=''text-decoration:none'' ">@云开晴空</a> 傻孩砸[@F_34@]给奶奶看看你的小手。。。。。嗯。。又圆润了许多啊', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (227, 1, 0, 0, 0, 0, to_date('20-03-2017 17:33:20', 'dd-mm-yyyy hh24:mi:ss'), 'time[@F_8@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (241, 1, 1, 0, 0, 0, to_date('21-03-2017 10:22:25', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=50" style=''text-decoration:none'' ">@测试10号</a> 哈哈[@F_5@]', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (261, 1, 2, 1, 0, 1, to_date('22-03-2017 15:21:49', 'dd-mm-yyyy hh24:mi:ss'), 'oracle 1521', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (262, 1, 2, 1, 0, 0, to_date('22-03-2017 15:59:17', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=1" style=''text-decoration:none'' ">@吾生而流浪</a> oracle 1521', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (301, 1, 0, 0, 0, 0, to_date('28-03-2017 16:15:30', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=24" style=''text-decoration:none'' ">@云开晴空</a> [@F_28@]哈哈哈哈哈哈哈哈', 'upload/pic/24006ajtzXgy1fcwsrrio5uj30hs0rwabi.jpg', 1, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (302, 1, 0, 0, 0, 0, to_date('28-03-2017 16:41:52', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=1" style=''text-decoration:none'' ">@吾生而流浪</a> oracle 1521', 'null', 1, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (304, 1, 0, 0, 0, 1, to_date('28-03-2017 17:04:31', 'dd-mm-yyyy hh24:mi:ss'), 'wwwww', 'upload/pic/120150217165304_8kHxx.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (427, 24, 0, 1, 0, 1, to_date('18-04-2017 10:34:58', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=2" style=''text-decoration:none'' ">@傻雅芳</a> 笨蛋潇[@F_29@]', 'null', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (221, 1, 0, 0, 0, 0, to_date('20-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=24" style=''text-decoration:none'' ">@云开晴空</a> 傻孩砸[@F_34@]给奶奶看看你的小手。。。。。嗯。。又圆润了许多啊', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (222, 1, 0, 0, 0, 0, to_date('20-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=24" style=''text-decoration:none'' ">@云开晴空</a> [@F_51@]傻孩砸', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (223, 1, 0, 0, 0, 0, to_date('20-03-2017', 'dd-mm-yyyy'), '转发<a href="user_index?userId=25" style=''text-decoration:none'' ">@傻雅芳</a> hi boy[@F_34@]', 'null', 0, 0, 1);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (303, 1, 0, 0, 0, 0, to_date('28-03-2017 16:47:04', 'dd-mm-yyyy hh24:mi:ss'), '[@F_18@]', 'upload/pic/120150217165304_8kHxx.jpg', 0, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (321, 1, 0, 0, 0, 0, to_date('11-04-2017 17:43:37', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=1" style=''text-decoration:none'' ">@吾生而流浪</a> 转发<a href="user_index?userId=1" style=''text-decoration:none'' ">@吾生而流浪</a> oracle 1521', 'null', 1, 0, 0);
insert into WEIBO_TAB (M_ID, U_ID, M_TRANUM, M_COMNUM, M_COLNUM, M_LIKE, M_DATE, M_BODY, M_IMAGE, M_STATE, M_TAG, M_T_STATE)
values (322, 1, 0, 0, 0, 0, to_date('11-04-2017 17:43:39', 'dd-mm-yyyy hh24:mi:ss'), '转发<a href="user_index?userId=1" style=''text-decoration:none'' ">@吾生而流浪</a> 转发<a href="user_index?userId=50" style=''text-decoration:none'' ">@测试10号</a> 哈哈[@F_5@]', 'null', 1, 0, 0);
commit;
create sequence SEQ_COLLECT
minvalue 1
maxvalue 999999999999999999999999999
start with 101
increment by 1
cache 20;
create sequence SEQ_COMM
minvalue 1
maxvalue 999999999999999999999999999
start with 261
increment by 1
cache 20;
create sequence SEQ_FRIEND
minvalue 1
maxvalue 999999999999999999999999999
start with 181
increment by 1
cache 20;
create sequence SEQ_LIKE
minvalue 1
maxvalue 999999999999999999999999999
start with 261
increment by 1
cache 20;
create sequence SEQ_MESSAGE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;
create sequence SEQ_RECORD
minvalue 1
maxvalue 999999999999999999999999999
start with 861
increment by 1
cache 20;
create sequence SEQ_TRANS
minvalue 1
maxvalue 999999999999999999999999999
start with 261
increment by 1
cache 20;
create sequence SEQ_USER
minvalue 1
maxvalue 999999999999999999999999999
start with 101
increment by 1
cache 20;
create sequence SEQ_WEIBO
minvalue 1
maxvalue 999999999999999999999999999
start with 541
increment by 1
cache 20;

