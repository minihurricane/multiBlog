/*
Navicat MySQL Data Transfer

Source Server         : wsf
Source Server Version : 50508
Source Host           : 127.0.0.1:3306
Source Database       : multiblog_v1.0

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2019-10-19 00:38:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for t_administrators
-- ----------------------------
DROP TABLE IF EXISTS `t_administrators`;
CREATE TABLE `t_administrators` (
  `Administrators_id` int(11) NOT NULL AUTO_INCREMENT,
  `Administrators_name` varchar(50) DEFAULT NULL,
  `Administrators_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Administrators_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_administrators
-- ----------------------------
INSERT INTO `t_administrators` VALUES ('1', '忘了爱', null);

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `time` datetime DEFAULT '2017-09-18 00:00:00',
  `star` int(11) DEFAULT '0',
  `visit` int(11) DEFAULT '0',
  `content` text,
  PRIMARY KEY (`article_id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('4', '6', '13', '\"nested exception is org.apache.ibatis.binding.BindingException: Parameter \'openid\'', '2015-06-18 21:00:21', '0', '0', '前言：出现这个问题的原因有好几个，所以我们逐步的来解释并解决问题；\r\n1、首先，要明确一点的是，Dao层的抽象方法中的参数一般情况下默认的是一个参数或者一个对象；\r\n例如：\r\n\r\n    public interface StudentDao {\r\n     \r\n    	int selectById(int id);\r\n    	\r\n    	int insert(Student stu);\r\n    	\r\n    }\r\n\r\n\r\n这两种是正常的方式，不会出现什么问题，mappper中的对应取值都是用#{}这种方式；\r\n例如：\r\n\r\n    <select id=\"selectById\" resultMap=\"BaseResultMap\">\r\n    		select\r\n    		<include refid=\"Base_Column_List\" />\r\n    		from student\r\n    		where 1=1 and id = #{id}\r\n    	</select>\r\n--------------------- \r\n作者：中单大魔王 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/qq_33142257/article/details/53202443 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！');
INSERT INTO `t_article` VALUES ('5', '4', '1', '不是码农，不会敲代码的她，却最懂程序员！| 人物志', '2016-06-18 21:30:33', '0', '0', '作为程序员，想必你肯定看过这样一组漫画：简洁的画风，常年驼背对着电脑敲代码的程序员，他表情木讷，嘴里吐槽的内容扎心又有趣，关键是这位程序员发量还很多！\r\n\r\n没错，这就是我们那些年来追过的《神秘的程序员们》系列漫画：\r\n\r\n「年会上的程序员们」告诉我们，程序员的年会不是反串，没有调戏鼓励师，而是一个大型的代码 Review 现场……\r\n\r\n而「开发和产品之间的恩怨从何来」告诉我们产品经理的有一套真传的“八卦刀法”：就一句的需求；具体实现我不管；照着这个页面做就行，不好改就去掉吧。\r\n\r\n程序员则是用“打狗棍法”来应对：实现不了；讲了你不懂；要提需求先走流程；起码需要四个月……\r\n\r\n对于这漫画背后的作者，从TA对程序员知（知）根（道）知（太）底（多）的一幅幅漫画里，你是否就猜测他应是一名程序员老司机呢？\r\n\r\n但真相是——\r\n\r\n她不是程序员，她不会敲代码，她是西乔，是最懂程序员的人。\r\n\r\n那么不是程序员的她是如何开始创作深受程序员喜欢的《神秘的程序员们》漫画？不是程序员的她，如何获取这么多关于程序员的灵感呢？\r\n\r\n下面程序人生（ID：coder_life）为你揭开西乔小姐姐的“神秘面纱”，一起聊聊《神秘的程序员们》背后的那些事儿。');
INSERT INTO `t_article` VALUES ('6', '4', '13', 'Springmvc controller获取不到jsp中的数据', '2018-06-18 23:23:24', '0', '0', '今天在练习一个SSM例子中，在最后的数据修改提交的过程中出现了一个有意思的错误，记录下来。\r\n\r\n首先是在数据列表中通过点击修改跳转到对应的controller后台函数中，其中传递的是数据对应的id。\r\n如下图：\r\n\r\n这里写图片描述\r\n\r\n对应的接收方法如下，这里使用的无返回值类型的返回方式：\r\n\r\n@RequestMapping(value=\"/editItems\", method=RequestMethod.GET)\r\n        public void editItems(HttpServletRequest request,HttpServletResponse response,Integer id) throws Exception{\r\n            ItemsCustom itemsCustom = itemsService.findItemsById(id);\r\n            request.setAttribute(\"itemsCustom\", itemsCustom);\r\n\r\n            request.getRequestDispatcher(\"/WEB-INF/jsp/editItem.jsp\").forward(request, response);;\r\n        }\r\n--------------------- \r\n作者：leoe_ \r\n来源：CSDN \r\n原文：https://blog.csdn.net/LEoe_/article/details/71907867 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！');
INSERT INTO `t_article` VALUES ('7', '6', '2', 'Python常用的模块的使用技巧', '2017-06-18 23:39:07', '0', '0', 'Python常用模块的使用技巧\r\n\r\n目录\r\n\r\nPython常用模块的使用技巧\r\n\r\n1.Python配置说明\r\n\r\n（1）Python注释说明\r\n\r\n（2）函数说明\r\n\r\n（3）ipynb文件转.py文件\r\n\r\n（4）Python计算运行时间\r\n\r\n（5）镜像加速方法\r\n\r\n（6）代码分析工具 Pylint安装+pycharm下的配置\r\n\r\n（7）Python添加环境路径和搜索路径的方法\r\n\r\n2.常用的模块\r\n\r\n2.1 numpy模块：矩阵的拼接和分割,奇偶项分割数据\r\n\r\n2.2 pickle模块\r\n\r\n2.3 random.shuffle产生固定种子\r\n\r\n2.4 zip()与zip(*) 函数：\r\n\r\n2.5 map、for快速遍历方法：\r\n\r\n2.6 glob模块\r\n\r\n2.7 os模块\r\n\r\n2.8 判断图像文件为空和文件不存，文件过小\r\n\r\n2.9 保存多维array数组的方法\r\n\r\n2.10读取txt数据的方法\r\n\r\n2.11 pandas模块\r\n\r\n（1）文件数据拼接\r\n\r\n（2）DataFrame\r\n\r\nPandas DataFrame数据的增、删、改、查\r\n\r\n2.12 csv模块\r\n\r\n2.13 logging模块\r\n\r\n3. 数据预处理\r\n\r\n3.1 数据（图像）分块处理\r\n\r\n3.2 读取图片和显示\r\n\r\n（1）matplotlib.image、PIL.Image、cv2图像读取模块\r\n\r\n（2）将 numpy 数组转换为 PIL 图片：\r\n\r\n（3）python中PIL.Image和OpenCV图像格式相互转换\r\n\r\n（4）matplotlib显示阻塞问题\r\n\r\n（5）matplotlib绘制矩形框\r\n\r\n3.3 one-hot独热编码\r\n\r\n3.4 循环产生batch数据:\r\n\r\n3.5 统计元素个数和种类\r\n\r\n3.6 python 字典(dict)按键和值排序\r\n\r\n3.7 自定义排序sorted\r\n\r\n3.8 加载yml配置文件\r\n\r\n3.9 移动、复制、重命名文件 \r\n\r\n4.常用的图像预处理和文件处理包\r\n--------------------- \r\n作者：pan_jinquan \r\n来源：CSDN \r\n原文：https://blog.csdn.net/guyuealian/article/details/80805807 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！');
INSERT INTO `t_article` VALUES ('8', '6', '13', 'Integer == Integer?', '2019-06-18 23:46:37', '0', '0', '[size=xx-large][color=red][b]Integer == Integer？[/b][/color][/size]\r\n\r\n\r\n/** \r\n *Q：Integer和Integer对象用  == 进行比较的过程是怎样的？ \r\n * \r\n *看例子 \r\n */  \r\npublic class Test {  \r\n\r\n    public static void main(String[] args) {  \r\n        int a = 1;  \r\n        int b = 1;  \r\n        Integer c = 3;  \r\n        Integer d = 3;  \r\n        Integer e = 321;  \r\n        Integer f = 321;  \r\n\r\n        System.out.println(a == b);  \r\n        System.out.println(c == d);  \r\n        System.out.println(e == f);  \r\n\r\n    }  \r\n}  \r\noutput：  \r\ntrue  \r\ntrue  \r\nfalse  \r\n\r\n--------------------- \r\n作者：mohaiyong \r\n来源：CSDN \r\n原文：https://blog.csdn.net/mohaiyong/article/details/84416777 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！');
INSERT INTO `t_article` VALUES ('9', '6', '13', 'Integer及Integer缓冲池', '2016-06-18 23:59:01', '0', '0', 'Integer中有个静态内部类IntegerCache，里面有个cache[],也就是Integer常量池，常量池的大小为一个字节（-128~127）。\r\n\r\n源码为（jdk1.8.0_101）\r\n复制代码\r\n\r\n 1  private static class IntegerCache {\r\n 2         static final int low = -128;\r\n 3         static final int high;\r\n 4         static final Integer cache[];\r\n 5 \r\n 6         static {\r\n 7             // high value may be configured by property\r\n 8             int h = 127;\r\n 9             String integerCacheHighPropValue =\r\n10                 sun.misc.VM.getSavedProperty(\"java.lang.Integer.IntegerCache.high\");\r\n11             if (integerCacheHighPropValue != null) {\r\n12                 try {\r\n13                     int i = parseInt(integerCacheHighPropValue);\r\n14                     i = Math.max(i, 127);\r\n15                     // Maximum array size is Integer.MAX_VALUE\r\n16                     h = Math.min(i, Integer.MAX_VALUE - (-low) -1);\r\n17                 } catch( NumberFormatException nfe) {\r\n18                     // If the property cannot be parsed into an int, ignore it.\r\n19                 }\r\n20             }\r\n21             high = h;\r\n22 \r\n23             cache = new Integer[(high - low) + 1];\r\n24             int j = low;\r\n25             for(int k = 0; k < cache.length; k++)\r\n26                 cache[k] = new Integer(j++);\r\n27 \r\n28             // range [-128, 127] must be interned (JLS7 5.1.7)\r\n29             assert IntegerCache.high >= 127;\r\n30         }\r\n31 \r\n32         private IntegerCache() {}\r\n33     }');
INSERT INTO `t_article` VALUES ('10', '6', '13', 'Spring MVC中redirect重定向3种方式（带参数）', '2017-06-19 10:27:34', '0', '0', 'Spring MVC中做form表单功能提交时，防止用户客户端后退或者刷新时重复提交问题，需要在服务端进行重定向跳转,其中redirect是直接跳转到其他页面，有以下3种方法进行重定向。\r\n\r\n    redirect重定向流程\r\n\r\n客户发送一个请求到服务器，服务器匹配servlet，这都和请求转发一样，servlet处理完之后调用了sendRedirect()这个方法，这个方法是response的方法，所以，当这个servlet处理完之后，看到response.senRedirect()方法，立即向客户端返回这个响应，响应行告诉客户端你必须要再发送一个请求，去访问test.jsp，紧接着客户端受到这个请求后，立刻发出一个新的请求，去请求test.jsp,这里两个请求互不干扰，相互独立，在前面request里面setAttribute()的任何东西，在后面的request里面都获得不了。可见，在sendRedirect()里面是两个请求，两个响应。');
INSERT INTO `t_article` VALUES ('11', '4', '4', 'CSS 学习笔记', '2019-06-19 10:30:34', '0', '0', '类的衍生\r\n\r\n.fancy td 对应的结构是这样的:\r\n<table class=\"fancy\">\r\n    <tr>\r\n       <td>测试文字</td>\r\n    </tr>\r\n</table>\r\n\r\ntd.fancy 对应的结构是这样的:\r\n<table>\r\n    <tr>\r\n       <td class=\"fancy\">测试文字</td>\r\n    </tr>\r\n</table>\r\n\r\n\r\n--------------------- \r\n作者：shane_7 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/u013412165/article/details/25429475 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！');
INSERT INTO `t_article` VALUES ('12', '6', '1', 'javaweb 博客系统总结', '2015-06-20 11:31:04', '0', '0', '										博客系统使用jsp+servlet+mybatis写成\r\n\r\n１．关于表单验证\r\n\r\n自己对于js的使用特别不熟悉．所以现学了一点注册时候的简单验证\r\n\r\nonchange事件：实时监听文本框的输入，当用户离开文本框的时候就进行验证　onchange=\"函数调用\"\r\n\r\njs代码：\r\n\r\n     <script type=\"text/javascript\">\r\n            function checkpwd() {\r\n                var check = false;\r\n                var password = document.getElementById(\"password\").value;\r\n                if (password.length < 6) {\r\n                   alert(\"密码不能少于六位\")\r\n                    check = false;\r\n                } else {\r\n                    check = true;\r\n                }\r\n                return check;\r\n            }\r\n            function checkName() {\r\n                var check=false;\r\n                var name=document.getElementById(\"name\").value;\r\n                if(name.length<3){\r\n                    alert(\"用户名大\r\n--------------------- \r\n作者：温景 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/hewenjing8168/article/details/80377126 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！\r\n				\r\n				');
INSERT INTO `t_article` VALUES ('13', '5', '11', 'SSM项目中存入数据库中文乱码的问题', '2019-09-28 21:58:48', '0', '0', '存入数据库中文乱码的问题\r\n① 连接数据库的配置语句\r\nSSM框架中使用C3P0连接数据库语句\r\n\r\njdbc:mysql://localhost:3306/dbname\r\n1\r\n改为\r\n\r\njdbc:mysql://localhost:3306/dbname?useUnicode=true&characterEncoding=UTF-8\r\n1\r\n② 设置过滤器(Filter)文件\r\n设置EocdingFilter.java文件:\r\n\r\npackage cn.com.cxsw.ssm.filter;\r\n\r\nimport java.io.IOException;\r\nimport javax.servlet.Filter;\r\nimport javax.servlet.FilterChain;\r\nimport javax.servlet.FilterConfig;\r\nimport javax.servlet.ServletException;\r\nimport javax.servlet.ServletRequest;\r\nimport javax.servlet.ServletResponse;\r\nimport javax.servlet.annotation.WebFilter;\r\n\r\n/**\r\n * Servlet Filter implementation class EocdingFilter\r\n */\r\n@WebFilter(\"/EocdingFilter\")\r\npublic class EocdingFilter implements Filter {\r\n\r\n    public EocdingFilter() {\r\n        // TODO Auto-generated constructor stub\r\n    }\r\n\r\n    public void destroy() {\r\n    }\r\n\r\n    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)\r\n            throws IOException, ServletException {\r\n        request.setCharacterEncoding(\"UTF-8\");\r\n        response.setCharacterEncoding(\"UTF-8\");\r\n        chain.doFilter(request, response);\r\n    }\r\n\r\n    public void init(FilterConfig fConfig) throws ServletException {\r\n    }\r\n\r\n}\r\n————————————————\r\n版权声明：本文为CSDN博主「寻殇触觞」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/u011360242/article/details/78509027');
INSERT INTO `t_article` VALUES ('14', '5', '4', 'Web问题快速定位简单技巧', '2019-09-28 22:01:05', '0', '0', '在系统开发完成后就是系统维护了，系统中打印的日志是我们定位问题的关键。但是在真正问题来临时，经常会遇到同一时间日志庞大，不知道何去何从，尤其是并发用户庞大的系统，仅仅告知问题发生时间点，也很难一眼看出系统日志确切的位置。\r\n\r\n    那何如来解决这个问题呢？使得能够一眼找到用户发生错误的日志。\r\n\r\n    有一个比较好的技巧，也在一些比较好的应用系统中使用过，就是通过设置请求所在的线程名称，使得线程名称可读，而在日志中通常也会将线程名称打印出来，这样在遇到系统异常时，将线程名称提示给用户，让用户系统异常反馈时能够将这些信息反馈回来，这样能根据用户反馈，快速找到系统异常日志，快速解决问题提供帮助。\r\n\r\n    在Spring boot构建的Web系统中，可以通过增加Filter过滤器来实现，具体实现如下：\r\n\r\n    在Application.java入口类中，增加@ServletComponentScan声明，如下：  \r\n\r\n@Configuration\r\n@EnableAutoConfiguration\r\n@SpringBootApplication\r\n@EnableDiscoveryClient\r\n@ServletComponentScan\r\n@EnableRedisHttpSession(redisFlushMode = RedisFlushMode.IMMEDIATE)\r\npublic class Application \r\n{\r\n    public static void main( String[] args )\r\n    {\r\n    	new SpringApplicationBuilder(Application.class).run(args);\r\n    }\r\n}\r\n    实现UserLogFilter过滤器，声明为@WebFilter(\"/*\")，在doFilter()中通过Thread.currentThread()获取当前请求的线程，并根据SESSION中存放的用户信息，来设置线程名称从而达到问题快速定位，如下所示：    \r\n\r\npackage com.king.business.custom;\r\n \r\nimport java.io.IOException;\r\nimport java.util.UUID;\r\n \r\nimport javax.servlet.Filter;\r\nimport javax.servlet.FilterChain;\r\nimport javax.servlet.FilterConfig;\r\nimport javax.servlet.ServletException;\r\nimport javax.servlet.ServletRequest;\r\nimport javax.servlet.ServletResponse;\r\nimport javax.servlet.annotation.WebFilter;\r\nimport javax.servlet.http.HttpServletRequest;\r\nimport javax.servlet.http.HttpSession;\r\n \r\nimport com.alibaba.fastjson.JSON;\r\nimport com.king.business.bean.User;\r\n \r\n \r\n@WebFilter(\"/*\")\r\npublic class UserLogFilter implements Filter {\r\n \r\n	@Override\r\n	public void init(FilterConfig filterConfig) throws ServletException {\r\n \r\n	}\r\n \r\n	@Override\r\n	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)\r\n			throws IOException, ServletException {\r\n		\r\n	    HttpServletRequest httpReq = (HttpServletRequest)request;\r\n	    HttpSession session = httpReq.getSession();\r\n	    Object userStr = session.getAttribute(\"user\");\r\n	    if(null != userStr)\r\n	    {\r\n	    	User user = JSON.parseObject((String)userStr,User.class);\r\n	    	Thread current = Thread.currentThread();\r\n		    current.setName(user.getAccount()+\"-\"+UUID.randomUUID());\r\n	    }\r\n	    chain.doFilter(request, response);\r\n	}\r\n \r\n	@Override\r\n	public void destroy() {\r\n		// TODO Auto-generated method stub\r\n \r\n	}\r\n \r\n}\r\n  \r\n————————————————\r\n版权声明：本文为CSDN博主「InitCoder」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/weixin_36171229/article/details/81813285');
INSERT INTO `t_article` VALUES ('15', '6', '1', 'springboot笔记1——spring相关入门', '2019-10-16 10:54:27', '0', '0', '										spring\r\n随着我们开发，发现了一个问题：\r\n                       A---->B---->C---->D\r\n                       在A中创建B的对象调用B的资源\r\n                       在B中创建C的对象调用C的资源\r\n                       在C中创建D的对象调用D的资源\r\n                       这样的开发模式中，对象与对象之间的耦合性太高\r\n                       造成对象的替换非常的麻烦。\r\n                       A--->B2--->C--->D\r\n\r\n解决：\r\n               我们创建一个对象E，将B、C、D的示例化对象存储到E中。然后\r\n               在A中获取E，然后通过E获取B对象。E中存储的对象需要动态的创建\r\n               ,给E配置一个文件，用该文件配置所有需要存储在E的对的全限定路径。\r\n               然后E的底层根据配置文件中的配置信息一次性创建好存储起来。\r\n\r\nSpring boot\r\n特点\r\n\r\n1. 创建独立的Spring应用程序\r\n2. 嵌入的Tomcat，无需部署WAR文件\r\n3. 简化Maven配置\r\n4. 自动配置Spring\r\n5. 提供生产就绪型功能，如指标，健康检查和外部配置\r\n6. 绝对没有代码生成和对XML没有要求配置\r\n\r\n优点\r\n\r\nspring boot 可以支持你快速的开发出 restful 风格的微服务架构\r\n\r\n自动化确实方便，做微服务再合适不过了，单一jar包部署和管理都非常方便。只要系统架构设计合理，大型项目也能用，加上nginx负载均衡，轻松实现横向扩展\r\n\r\nspring boot 要解决的问题, 精简配置是一方面, 另外一方面是如何方便的让spring生态圈和其他工具链整合(比如redis, email, elasticsearch)\r\n————————————————\r\n版权声明：本文为CSDN博主「hebtu666」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/hebtu666/article/details/102555534\r\n				\r\n				');
INSERT INTO `t_article` VALUES ('16', '4', '4', 'localStorage判断用户是否登录', '2019-10-16 17:01:53', '0', '0', '版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。\r\n本文链接：https://blog.csdn.net/coco1118/article/details/84564776\r\nlocalStorage类似于cookie,解决了cookie存储空间不足的问题,存储在本地。\r\n以下例子为判断用户是否登录，未登录则跳转到登录界面\r\nadmin.js:\r\n\r\n   *@todo 模拟登录\r\n     * 判断初次登录时，跳转到登录页\r\n     */\r\n    var login = localStorage.getItem(\'login\');\r\n    $(\'.loginout\').click(function () {\r\n        login = 0;\r\n        localStorage.setItem(\'login\', login);\r\n    });\r\n    $(\'.loginin\').click(function () {\r\n        login = 1;\r\n        localStorage.setItem(\'login\', login);\r\n    });\r\n\r\n系统的其他页面：\r\n\r\n    // 验证是否登录\r\n        $(function () {\r\n        //JavaScript JSON.parse()方法用于将一个 JSON 字符串转换为对象。\r\n            var login = JSON.parse(localStorage.getItem(\"login\"));\r\n            if (login) {\r\n                if (login == 0) {\r\n                    layer.msg(\'请先登录！\', {icon: 4, time: 500}, function () {\r\n                        window.location.href = \'index\';\r\n                        return false;\r\n                    });\r\n\r\n                } else {\r\n                    return false;\r\n                }\r\n            } else {\r\n                layer.msg(\'请先登录！\', {icon: 4, time: 500}, function () {\r\n                    window.location.href = \'index\';\r\n                    return false;\r\n                });\r\n\r\n                return false;\r\n            }\r\n        });\r\n\r\n————————————————\r\n版权声明：本文为CSDN博主「Karagrade」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/coco1118/article/details/84564776');
INSERT INTO `t_article` VALUES ('18', '4', '4', '变量声明在循环体内还是循环体外的争论', '2019-10-16 17:57:36', '0', '0', '版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。\r\n本文链接：https://blog.csdn.net/langtaosha8888/article/details/54346151\r\n（1）\r\nfor (int i = 0; i < 10000; ++i) {\r\n  Object obj = new Object();\r\n  System.out.println(\"obj= \"+ obj);\r\n} \r\n应改成\r\n（2）\r\nObject obj = null;\r\n \r\nfor (int i = 0; i < 10000; ++i) {\r\n  obj = new Object();\r\n  System.out.println(\"obj= \"+ obj);\r\n}\r\n\r\n\r\n今天想对“变量声明在循环体外合适还是循环体内合适？”这个命题吐槽一番，并且我有两个前提：1、变量的生命周期仅限于循环体。2、仅限于Java语言。 从我迄今为止待过的两家公司来说，他们的答案都是“变量要声明在循环体外部”。why？我猜想制定这个规矩的人也许是个C/C++程序员。众所周知，C/C++是手工管理内存的语言。这些程序员通常站在机器的角度考虑，视效率为生命。固有的思维决定了，即使他们清楚明白地知道，Java是具有垃圾回收功能的语言，也不惜一切将变量声明在循环体外。看到别人将声明写在了循环体内部，他们会特别变扭，吃不下睡不着。 看了上面的文字，我的观点不言而喻，我赞成将变量声明在循环体内部。why？ 1、Java是一种具有垃圾回收功能的语言，并且随着版本的提高，如今的GC已经变得越来越smart。每次循环声明创建的变量，在本次循环结束之后即会被标记为“可以被GC回收了”。即使我知道Java的垃圾回收线程优先级相当低，也许在被标记为“可以被回收”后，这些内存空间并不能马上被真正的释放。\r\n————————————————\r\n版权声明：本文为CSDN博主「后知后觉的人」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\r\n原文链接：https://blog.csdn.net/langtaosha8888/article/details/54346151');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `content` text,
  `comment_time` datetime DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `diss` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '1', '写得不错', '2019-08-14 09:20:15', '12', null);
INSERT INTO `t_comment` VALUES ('2', '1', '2', '写得不错', '2019-08-15 20:46:16', '0', null);
INSERT INTO `t_comment` VALUES ('3', '1', '3', '写得不错啊', '2019-08-15 23:03:34', '0', null);
INSERT INTO `t_comment` VALUES ('4', '1', '4', '写得不错啊', '2019-08-15 23:41:35', '0', null);
INSERT INTO `t_comment` VALUES ('5', '1', '5', '写得不错啊', '2019-08-16 00:06:45', '0', null);
INSERT INTO `t_comment` VALUES ('6', '1', '6', '写得不错哈', '2019-08-16 11:58:15', '0', null);
INSERT INTO `t_comment` VALUES ('7', '1', '7', '写得不错啊', '2019-08-16 12:04:14', '0', null);
INSERT INTO `t_comment` VALUES ('8', '1', '0', '666', '2019-08-16 12:35:39', '0', null);
INSERT INTO `t_comment` VALUES ('9', '1', '0', '厉害', '2019-08-16 15:19:20', '0', null);
INSERT INTO `t_comment` VALUES ('10', '1', '0', '厉害哦', '2019-08-16 15:24:27', '0', null);
INSERT INTO `t_comment` VALUES ('11', '1', '0', '233', '2019-08-16 15:30:18', '0', null);
INSERT INTO `t_comment` VALUES ('12', '1', '0', 'ok', '2019-08-16 15:49:51', '0', null);
INSERT INTO `t_comment` VALUES ('13', '1', '0', '厉害厉害', '2019-08-16 15:52:50', '0', null);
INSERT INTO `t_comment` VALUES ('14', '1', '14', 'good', null, null, null);
INSERT INTO `t_comment` VALUES ('15', '1', '1', '完美！', '2019-08-17 17:18:20', '1', null);
INSERT INTO `t_comment` VALUES ('16', '1', '1', 'good', '2019-08-18 11:35:53', '1', null);
INSERT INTO `t_comment` VALUES ('17', '1', '1', '完美', '2019-08-18 11:43:08', '1', null);
INSERT INTO `t_comment` VALUES ('18', '1', '12', '', '2019-09-24 11:42:10', '0', null);
INSERT INTO `t_comment` VALUES ('19', '1', '12', '', '2019-09-24 11:42:13', '0', null);
INSERT INTO `t_comment` VALUES ('20', '1', '12', '', '2019-09-24 11:42:15', '0', null);
INSERT INTO `t_comment` VALUES ('21', '1', '10', '', '2019-09-24 20:38:21', '0', null);
INSERT INTO `t_comment` VALUES ('22', '1', '4', 'ok', '2019-09-28 21:15:40', '0', null);
INSERT INTO `t_comment` VALUES ('23', '1', '4', 'ok', '2019-09-28 21:16:54', '0', null);
INSERT INTO `t_comment` VALUES ('24', '1', '4', 'ok', '2019-09-28 21:17:43', '0', null);
INSERT INTO `t_comment` VALUES ('25', '1', '4', 'ok', '2019-09-28 21:18:16', '0', null);
INSERT INTO `t_comment` VALUES ('26', '1', '5', 'ok', '2019-09-28 21:21:32', '0', null);
INSERT INTO `t_comment` VALUES ('27', '6', '15', 'ok', '2019-10-16 12:32:19', null, null);
INSERT INTO `t_comment` VALUES ('28', '4', '18', '写得还可以吧！', '2019-10-16 18:04:19', null, null);
INSERT INTO `t_comment` VALUES ('29', '4', '18', '还好吧', '2019-10-16 18:10:52', null, null);
INSERT INTO `t_comment` VALUES ('30', '4', '18', '哦\r\n', '2019-10-16 18:11:06', null, null);
INSERT INTO `t_comment` VALUES ('31', '4', '18', '666', '2019-10-16 18:13:07', null, null);
INSERT INTO `t_comment` VALUES ('32', '4', '18', '666', '2019-10-16 18:13:28', null, null);
INSERT INTO `t_comment` VALUES ('33', '6', '18', '233', '2019-10-16 18:18:01', null, null);
INSERT INTO `t_comment` VALUES ('34', '9', '18', '不错，继续加油！', '2019-10-16 18:21:23', null, null);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', '111', '普通用户');
INSERT INTO `t_permission` VALUES ('2', '10101', '管理员');

-- ----------------------------
-- Table structure for t_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_sort`;
CREATE TABLE `t_sort` (
  `sort_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` varchar(30) NOT NULL,
  PRIMARY KEY (`sort_id`,`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sort
-- ----------------------------
INSERT INTO `t_sort` VALUES ('1', '程序人生');
INSERT INTO `t_sort` VALUES ('2', 'Python');
INSERT INTO `t_sort` VALUES ('3', 'Java');
INSERT INTO `t_sort` VALUES ('4', '前端');
INSERT INTO `t_sort` VALUES ('5', '架构');
INSERT INTO `t_sort` VALUES ('6', '数据库');
INSERT INTO `t_sort` VALUES ('7', '游戏开发');
INSERT INTO `t_sort` VALUES ('8', '安全');
INSERT INTO `t_sort` VALUES ('9', '计算机基础');
INSERT INTO `t_sort` VALUES ('10', '移动开发');
INSERT INTO `t_sort` VALUES ('11', '框架');
INSERT INTO `t_sort` VALUES ('12', '其他');
INSERT INTO `t_sort` VALUES ('13', '后端');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `tag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES ('2', '2', 'web问题');
INSERT INTO `t_tag` VALUES ('3', '3', '后端');
INSERT INTO `t_tag` VALUES ('4', '4', '后端');
INSERT INTO `t_tag` VALUES ('5', '5', '后端');
INSERT INTO `t_tag` VALUES ('6', '6', '后端');
INSERT INTO `t_tag` VALUES ('7', '7', '后端');
INSERT INTO `t_tag` VALUES ('8', '8', '后端');
INSERT INTO `t_tag` VALUES ('9', '9', '后端');
INSERT INTO `t_tag` VALUES ('10', '10', '后端');
INSERT INTO `t_tag` VALUES ('11', '11', '前端');
INSERT INTO `t_tag` VALUES ('12', '12', null);
INSERT INTO `t_tag` VALUES ('13', '13', 'SSM项目');
INSERT INTO `t_tag` VALUES ('14', '14', 'web问题');
INSERT INTO `t_tag` VALUES ('15', '15', '前端');
INSERT INTO `t_tag` VALUES ('16', '16', '前端');
INSERT INTO `t_tag` VALUES ('17', '18', '前端');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'primary_key',
  `permission_id` int(11) DEFAULT NULL,
  `username` varchar(20) NOT NULL COMMENT 'username',
  `password` varchar(255) NOT NULL COMMENT 'password',
  `registerdate` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', '1', '李刚', 'I8ev74siLkz0l5zG/6d/IA==', null, null);
INSERT INTO `t_user` VALUES ('3', '1', '悟空', 'AZICOnu9cyUFFvBp3xi1AA==', null, null);
INSERT INTO `t_user` VALUES ('4', '2', '忘了爱', 'Y6nw6nu5gFB5a2SehUgYRQ==', null, 'root');
INSERT INTO `t_user` VALUES ('5', '1', '抓不住的梦', 'Y6nw6nu5gFB5a2SehUgYRQ==', null, 'root：不过密码好像失效了');
INSERT INTO `t_user` VALUES ('6', '1', 'just', 'ICy5YqxZB1uWSwcVLSNLcA==', null, null);
INSERT INTO `t_user` VALUES ('7', '2', 'Admin', 'Y6nw6nu5gFB5a2SehUgYRQ==', null, '管理员');
INSERT INTO `t_user` VALUES ('8', null, '01', 'lqO+PPJy4BcEbRsmdKUr0w==', null, null);
INSERT INTO `t_user` VALUES ('9', null, '02', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '123');
