package pers.wsf.multiBlog.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pers.wsf.multiBlog.pojo.Article;
import pers.wsf.multiBlog.pojo.Comment;
import pers.wsf.multiBlog.pojo.User;
import pers.wsf.multiBlog.service.ArticleService;
import pers.wsf.multiBlog.service.CommentService;
import pers.wsf.multiBlog.service.UserService;
import pers.wsf.multiBlog.utils.DateUtils;

@Controller
public class CommentController {
	

	static Logger log=Logger.getLogger(CommentController.class.getName());
	@Autowired
	CommentService commentService;
	@Autowired
	ArticleService articleService;
	@Autowired
	UserService userService;
	
	List<Comment> comment;

	/*
	 * int article_id, String nickname, String content, Timestamp time, int star,
	 * int diss,
	 */
	@RequestMapping(value="addComment.action",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
	public ModelAndView addComment_POST(Integer article_id,String username,String content,HttpServletRequest request) {
		log.debug("CommentController的article_id："+article_id+" username:"+username+" content:"+content);
		
		Article t_article;
		Integer userId=userService.getUserIdByName(username);
		String currentTime=DateUtils.getFormatDate(new Date());
		commentService.addComment(userId,article_id,content, currentTime);
		
		
		ModelAndView mav=new ModelAndView("redirect:/Article.action");  //�ض���Article��ˣ����ô��룬�����ٻ�ȡarticle��comment������ͼarticle.jsp
		mav.addObject("id",article_id);  //�ض���Article���ʱ���Ĳ���
		return mav;
	}
	@RequestMapping(value="addComment.action",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	public ModelAndView addComment_GET(int article_id, String nickname, String content, Timestamp time, int star, int diss,HttpServletRequest request) {
		return null;		
	}
	@RequestMapping("deleteComment.action")
	public ModelAndView deleteComment(int id) {
		commentService.deleteComment(id);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("");
		return mav;
	}
	
}
