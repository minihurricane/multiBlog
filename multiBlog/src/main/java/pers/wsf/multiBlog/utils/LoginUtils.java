package pers.wsf.multiBlog.utils;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import pers.wsf.multiBlog.pojo.User;
import pers.wsf.multiBlog.service.impl.UserServiceImpl;

public class LoginUtils {

	/**
	 * 成功
	 */
	public static final int SUCCESS = 1;
	/**
	 * 密码错误
	 */
	public static final int PWDERROR = 2;
	/**
	 * 用户不存在
	 */
	public static final int NONEXIST = 3;
	/**
	 * 用户已注册
	 */
	public static final int REGISTERED = 4;
	/**
	 * 信息不匹配
	 */
	public static final int UNMISMATCH = 5;
	static Logger log = Logger.getLogger(LoginUtils.class.getName());
	@Autowired
	static UserServiceImpl userService;

	
	public static int login(User user, HttpSession session) {

		String username = user.getUsername();
		String password = user.getPassword();
		log.debug("request.getParameter().username: " + user.getUsername());
		log.debug("password：" + user.getPassword());
	    log.debug("user.username: "+user.getUsername());

		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			System.out.println("此处为在未登录之前，user本身就为null");
			return NONEXIST;
		}
		int result=userService.loginUser(username, password);
		if(result==UserServiceImpl.SUCCESS) {					
			session.setAttribute("USER_SESSION",user); //user包含密码，但密码不逆解			
			session.setMaxInactiveInterval(60 * 60);
			return SUCCESS;
		}
		return 	UNMISMATCH;

	}
}
