package pers.wsf.multiBlog.utils;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import pers.wsf.multiBlog.mapper.ArticleMapper;
import pers.wsf.multiBlog.pojo.Article;
import pers.wsf.multiBlog.pojo.AxisArticle;
import pers.wsf.multiBlog.pojo.User;



/**
 * 文章处理工具
 * 
 */
public  class ArticleUtils {

	static Logger log=Logger.getLogger(ArticleUtils.class.getName());
	/**
	 * 处理下时�?
	 * 
	 * @param list
	 * @return
	 */
	@Autowired
	ArticleMapper articleMapper;

	public static List cutTime(List<Article> list) { 
		for (Article a :list) {
			a.setTime(a.getTime().substring(0, 11)); 
		}


		return list; 
	}


	/**
	 * 处理下时�?
	 * 
	 * @param Article
	 * @return
	 */

	public static Article cutTime(Article a) { 
		a.setTime(a.getTime().substring(0,11)); 
		return a; 
	}

	/**
	 * 处理下文章内�?
	 * 
	 * @param list
	 * @return
	 */
	public static List cutContent(List<Article> list) {

		for (Article a : list) {
			if (a.getContent() != null && a.getContent().length() > 351) {
				a.setContent(a.getContent().substring(0, 349) + "...");
			}
		}
		return list;
	}

	/**
	 * 获取时间轴文章类�? Article的一个简化版�?
	 * 
	 * @param article
	 * @return
	 */

	public  AxisArticle getAxisArticle(Article article) {		

		AxisArticle axisArticle = new AxisArticle();
		
		log.debug("getAxisArticle的article.getArticle_id："+article.getArticle_id());
		//User username=articleMapper.getUserByArticleId(article.getArticle_id());//根据文章id获取相应的username
		//log.debug("username: "+username);		
		axisArticle.setTitle(article.getTitle()); 
		axisArticle.setId(article.getArticle_id());
		axisArticle.setArticle_id(article.getArticle_id());
		//axisArticle.setUser(username);
		// 2017-09-20 21:27:14 
		String year = StringUtils.cutString(article.getTime(),0, 4); String month = StringUtils.cutString(article.getTime(), 5, 7); String
		day = StringUtils.cutString(article.getTime(), 8, 10);

		axisArticle.setYear(Integer.valueOf(year));
		axisArticle.setMonth(Integer.valueOf(month));
		axisArticle.setDay(Integer.valueOf(day));

		return axisArticle; 
	}

}
