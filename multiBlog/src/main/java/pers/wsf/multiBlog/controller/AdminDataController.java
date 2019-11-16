package pers.wsf.multiBlog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pers.wsf.multiBlog.mapper.ArticleMapper;
import pers.wsf.multiBlog.pojo.Article;



/**
 * 项目名称：multiBlog
 * 类名称：AdminDataController
 * 类描述：给管理员来管理数据
 * @author 32373
 */
@Controller
public class AdminDataController {

	@Autowired
	ArticleMapper articleMapper;
	
	Logger log=Logger.getLogger(AdminDataController.class.getName());
					 
	@RequestMapping("AdminData.action")
	public ModelAndView adminData(HttpServletRequest request,HttpServletResponse response,Integer article_id) {
		ModelAndView mav=new ModelAndView();
		Article article;
		article=articleMapper.getOneArticleById(article_id);
		log.debug("UserDataController的article："+article);
		request.setAttribute("editArticle", article);		
		mav.setViewName("editArticle");
		return mav;
	}
	
}
