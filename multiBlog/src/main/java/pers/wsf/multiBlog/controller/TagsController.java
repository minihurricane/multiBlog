package pers.wsf.multiBlog.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pers.wsf.multiBlog.service.ArticleService;
import pers.wsf.multiBlog.utils.StringUtils;

@Controller
public class TagsController {
	
	@Autowired
	ArticleService articleService;
	
	static Logger log=Logger.getLogger(TagsController.class.getName());
	
	@RequestMapping("listTags.action")
	public ModelAndView listTags(HttpServletRequest request,HttpServletResponse reponse) throws UnsupportedEncodingException {
		String get=StringUtils.parseCode(request.getParameter("get"));
		log.debug("TagsController里的get: "+get);
		request.setAttribute("id_tag_map", articleService.getTagAndArticle(get));
		ModelAndView mav=new ModelAndView();
		mav.setViewName("tags");
		return mav;
			
	}

}
