package pers.wsf.multiBlog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pers.wsf.multiBlog.pojo.User;
import pers.wsf.multiBlog.service.UserService;
import pers.wsf.multiBlog.service.impl.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	static Logger log=Logger.getLogger(UserController.class.getName());
	
	/* ���ܺ�˸ĳ�String�������ͣ�Ҫ�Ͳ���ǰ����ͼ�� �������ں�˴��������������ص�ǰ�ˣ��Ͳ�����ͼ����Ҫ���@Response��*/
	@RequestMapping(value = "/register.action", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String register(String username,String password) {
		User user=new User(username,password);
		log.debug("UserController里的user值："+user);
		
		int result=userService.registerUser(user);
		if(result==UserServiceImpl.SUCCESS) {
			return "success";
		}
		return "用户名已被注册！";
	}
	
	
	
	  @RequestMapping(value="/register.action",method=RequestMethod.GET,produces = "text/html;charset=UTF-8") 
	  public String  registUser_GET(String username,String password){
		  return "redirect:/register.action";
	  }
	 
	 
	@RequestMapping(value = "/userLogin.action", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String userLogin(String username, String password, HttpSession session) {
		int result=userService.loginUser(username, password);
		if(result==UserServiceImpl.SUCCESS) {
			//session�ź�ˣ�
			session.setAttribute("USER_SESSION", userService.getOneUserByName(username));
			session.setMaxInactiveInterval(60 * 60);
			return "success";
		}else if (result == UserServiceImpl.PWDERROR) {
			return "密码错误！";
		} else if (result == UserServiceImpl.NONEXIST) {
			return "用户不存在！";
		}
		return "";
	}
	
	@RequestMapping("deleteUser.action")
	public ModelAndView deleteUser(int id) {
		userService.deleteUser(id);
		ModelAndView mav=new ModelAndView();
		mav.addObject("");
		return mav;		
	}
	@RequestMapping("listUser.action")
	public ModelAndView listUser() {
		ModelAndView mav=new ModelAndView();
		List<User> cs=userService.listUser();
		mav.addObject("cs",cs);
        
		mav.addObject("");
		return mav;		
	}
	@RequestMapping("getOneUser.action")
	public ModelAndView getOneUser(int id) {
		ModelAndView mav=new ModelAndView();
		User user=userService.getOneUser(id);
		mav.addObject("user",user);
        
		return mav;		
	}
	
}
