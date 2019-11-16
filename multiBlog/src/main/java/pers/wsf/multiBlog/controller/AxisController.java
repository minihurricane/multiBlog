package pers.wsf.multiBlog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pers.wsf.multiBlog.service.AxisArticleService;

@Controller
public class AxisController {

	@Autowired
	AxisArticleService axisArticleService;
	
	@RequestMapping("listAxis.action")
	public ModelAndView listAxis(HttpServletRequest request, HttpServletResponse response) {
		// ��ȡʱ�����������͵����� 
		request.setAttribute("axis_list", axisArticleService.getAxisList());
		ModelAndView mav=new ModelAndView();
		mav.setViewName("axis");
		return mav;
	}
	
}
