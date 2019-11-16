package pers.wsf.multiBlog.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pers.wsf.multiBlog.service.ArticleService;
import pers.wsf.multiBlog.utils.StringUtils;



@Controller
public class SortController {
	
	@Autowired
	ArticleService articleService;

	@RequestMapping("listSort.action")
	public ModelAndView listSort(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		String get=StringUtils.parseCode(request.getParameter("get"));
		request.setAttribute("sort_article_map", articleService.getSortAndAirticle(get));

		ModelAndView mav=new ModelAndView();
		mav.setViewName("sort");
		return mav;
	}
}
