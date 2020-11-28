-- 作业：2、(必做):基于电商交易场景(用户、商品、订单)，设计一套简单的表结构，提交DDL 的 SQL 文件到 Github(后面2周的作业依然要是用到这个表结构)。
-- MySql 版本：8.0.21

-- 建库
create database `mmall` default character set utf8mb4;

-- 用户表
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint auto_increment primary key comment '用户 ID',
  `user_name` varchar(50) not null comment '用户名',
  `password` varchar(100) not null comment '用户密码',
  `nick_name` varchar(50) comment '昵称',
  `id_card` char(18) comment '身份证号码',
  `mobile` char(11) comment '手机号',
  `sex` tinyint(1) comment '性别：0:男，1:女',
  `status` tinyint(1) default 1 comment '账户状态：1:有效，2:注销',
  `create_time` bigint(20) comment '创建时间',
  `update_time` bigint(20) comment '更新时间'
) ENGINE = InnoDB COMMENT='用户表';


-- 商品表
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`  (
  `id` bigint auto_increment primary key comment '商品 ID',
  `name` varchar(50) not null comment '商品名称',
  `code` varchar(100) not null comment '商品编码',
  `type` varchar(50) comment '分类',
  `price` char(18) comment '价格',
  `image` varchar(100) comment '商品图片',
  `storage` int comment '库存',
  `desc` varchar(512) comment '商品描述',
  `status` tinyint(1) default 1 comment '商品状态：1:上架，2:下架',
  `create_time` bigint(20) comment '创建时间',
  `update_time` bigint(20) comment '更新时间'
) ENGINE = InnoDB COMMENT='商品表';


-- 订单表
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders`  (
  `id` bigint primary key comment '订单号',
  `user_id` bigint not null comment '用户ID',
  `pay_price` char(18) comment '支付金额',
  `pay_time` bigint(20) comment '支付时间	',
  `pay_way` tinyint(1) comment '支付方式：1:银行卡支付 2:微信 3:支付宝 4:到付',
  `status` tinyint(1) default 1 comment '订单状态：1:待支付 2:已取消 3:已完成',
  `create_time` bigint(20) comment '创建时间',
  `update_time` bigint(20) comment '更新时间'
) ENGINE = InnoDB COMMENT='订单表';

-- 订单商品表
DROP TABLE IF EXISTS `t_order_goods_relation`;
CREATE TABLE `t_order_goods_relation`  (
  `id` bigint primary key comment '主键 ID',
  `order_id` bigint not null comment '订单ID',
  `goods_id` bigint comment '商品ID',
  `num` bigint(20) comment '数量'
) ENGINE = InnoDB COMMENT='订单商品表';
