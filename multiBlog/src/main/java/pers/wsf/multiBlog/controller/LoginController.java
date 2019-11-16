package pers.wsf.multiBlog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pers.wsf.multiBlog.pojo.Article;
import pers.wsf.multiBlog.pojo.User;
import pers.wsf.multiBlog.service.ArticleService;
import pers.wsf.multiBlog.service.impl.UserServiceImpl;

@Controller
public class LoginController {

	@Autowired
	ArticleService articleService;	//Ϊʲô��Щ��Ŀע�����ServiceImpl��
	/* ȱ��UserServiceע�� ,Service */
	@Autowired
	UserServiceImpl userService;
	static Logger log=Logger.getLogger(LoginController.class.getName());
	
	@RequestMapping(value ="/login.action",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	public ModelAndView Login_POST(String username,String password, HttpSession session,HttpServletRequest request) {
		
		log.debug("request���ֵ: "+request.getAttribute(username));
		log.debug("�û�����"+username+" ���룺"+password); 
		ModelAndView mav=new ModelAndView(); 
		
		List<Article> article_list=articleService.listAllArticle();		
		log.debug("LoginController的login.action："+article_list);
		mav.addObject("article_list", article_list);	
		mav.setViewName("main");
		return mav;
	}


	@RequestMapping(value="/login.action",method=RequestMethod.GET,produces = "text/html;charset=UTF-8")
	public ModelAndView Login_GET(HttpServletRequest request, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		List<Article> article_list=articleService.listAllArticle();
		mav.addObject("article_list", article_list);
		mav.setViewName("main");
		return mav;
	}

	/**
	 * 方法描述：不能String 与ModelAndView套嵌使用
	 * @param username
	 * @param password
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/getSession.action",produces = "text/html;charset=UTF-8")
	//	@ResponseBody
	public ModelAndView getSession(String username,String password, HttpSession session) {
		//Model 和ModelAndView的关联
		// 通过账号和密码查询用户
		User user = userService.getOneUserByName(username);
		log.debug("用户信息："+user);
		ModelAndView mav=new ModelAndView();
		if(user != null){		
			if(userService.EncoderByMd5(password).equals(user.getPassword())) {
				List<Article> article_list=articleService.listAllArticle();
				
				mav.addObject("article_list", article_list);	
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			//使当前会话时间维持1小时；setMaxInactiveInterval设置的是当前会话的失效时间，不是整个web的时间，单位为以秒计算
			session.setMaxInactiveInterval(36000);
			// 跳转到主页面
			//return "main";
			mav.setViewName("main");
			return mav;
			}			
//			return "redirect:customer/list.action";
//			break;
		}
		mav.addObject("msg", "账号或密码错误，请重新输入！");
//		model.addAttribute("msg", "账号或密码错误，请重新输入！");
        // 返回到登录页面
		mav.setViewName("login");
		return mav;
				
	}

	@RequestMapping(value = "/logoutSession.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法;重定向到geSession控制器，这里是借力打力，不需要特意指向前端视图
	    return "redirect:getSession.action";
	}


	@RequestMapping(value="/regist.action",method=RequestMethod.POST )
	public ModelAndView Regist_POST(String username,String password) {
		ModelAndView mav=new ModelAndView();

		User user = new User(username, password);
		int result = userService.registerUser(user);
		if (result == UserServiceImpl.SUCCESS) {
			mav.setViewName("success");
		}
		mav.setViewName("");
		return mav;
	}

	@RequestMapping(value="/regist.action",method=RequestMethod.GET )
	public ModelAndView Regist_GET() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("");
		return mav;
	}
	/** loginUser��������
	 *  Ϊ��ʵ��ҳ��-->��˿�����-->ҳ��  (main.jsp--> loginUser --> login.jsp)
	 * 
	 */
	@RequestMapping("/userLogin.action")
	public ModelAndView loginUserJump() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/adminLogin.action")
	public ModelAndView adminLoginJump() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("adminLogin");
		return mav;
	}
	
}
