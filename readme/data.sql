CREATE TABLE `jfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `annotation` text COMMENT '文件描述',
  `path` text COMMENT '文件路径',
  `link` text COMMENT '链接',
  `uploader` varchar(255) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `localname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;


CREATE TABLE `t_user_msg` (
  `leave_msg` varchar(255) DEFAULT NULL,
  `leave_name` varchar(255) DEFAULT NULL,
  `insert_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_visitor_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remoteAddr` varchar(255) DEFAULT NULL,
  `ip_location` varchar(255) DEFAULT NULL,
  `os_name` varchar(255) DEFAULT NULL COMMENT '操作系统名',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户浏览器信息',
  `os_version` varchar(255) DEFAULT NULL COMMENT '操作系统版本',
  `visitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `os_arch` varchar(255) DEFAULT NULL COMMENT '64/32位操作系统',
  `protocol` varchar(255) DEFAULT NULL COMMENT '请求协议,一般1.1',
  `encode` varchar(255) DEFAULT NULL,
  `others` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8 ;