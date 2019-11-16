package pers.wsf.multiBlog.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.wsf.multiBlog.mapper.ArticleMapper;
import pers.wsf.multiBlog.mapper.SortMapper;
import pers.wsf.multiBlog.mapper.UserMapper;
import pers.wsf.multiBlog.pojo.Article;
import pers.wsf.multiBlog.pojo.Tag;
import pers.wsf.multiBlog.pojo.User;
import pers.wsf.multiBlog.service.ArticleService;
import pers.wsf.multiBlog.utils.ArticleUtils;
import pers.wsf.multiBlog.utils.StringUtils;
@Service("ArticleService")
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleMapper articleMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	SortMapper sortMapper;	
	
	final int LESS=1;	//Ϊʲô����ҪΪstatic������  ������Ҫע�⣿����

	final int MORE=2;

	static Logger log=Logger.getLogger(ArticleServiceImpl.class.getName());

	@Override
	public void addArticle(Article article) {
		articleMapper.addArticle(article);
	}

	//1.������� 2.�ٷ��� ����ʱ���ѯ��������ӵ�����
	@Override
	public Article createArticle(String author,String title,String sort,String time,String content) {
		/* 因为sql语句要插入的是user_id、sort_id，所以根据传过来的user、sort来获取其id，再将id传给sql语句 */
		/* user_id,sort_id,title,time,content */
		int userId=userMapper.getUserIdByName(author);
		log.debug("createArticle的sort："+sort);
		log.debug("createArticle的title："+title);
		int sortId=sortMapper.getSortId(sort);
		articleMapper.createArticle(userId,sortId,title,time,content);
		//如何返回自己刚创建的博客？？？  根据用户名、时间
		//return articleMapper.getLastArticle();//因为该系统为多人博客系统，故添加文章后，不能以最后一篇文章来作为自己刚创建的博客
		return articleMapper.getCreateArticleByUser(userId,time);
	}
	
	@Override
	public void deleteArticle(int id) {
		long startTime=System.currentTimeMillis();
		articleMapper.deleteArticle(id);
		long endTime=System.currentTimeMillis();
		long allTime=endTime-startTime;
		log.debug("ArticleServiceImpl的delteArticle总共耗时为："+allTime);
	}

	@Override
	public Article updateArticle(Integer article_id,String author,String title,String sort,String time,String content,String tag) {
		int userId=userMapper.getUserIdByName(author);
		int sortId=sortMapper.getSortId(sort);
		//更改文章
		articleMapper.updateArticle(article_id,sortId,title,content);
		//更改标签,每篇文章一个标签
		
		return articleMapper.getUpdatedArticle(userId,title);
	}

	@Override
	public List<Article> listAllArticle() {

		return articleMapper.listAllArticle();
	}
	@Override
	public List<Article> getUserArticle(int user_id) {
		
		return articleMapper.getUserArticle(user_id);
	}

	@Override
	public Article getOneArticle(int id) {
		return articleMapper.getOneArticle(id);
	}
	
	@Override
	public Article getArticleAndSort(int article_id) {
		return articleMapper.getArticleAndSort(article_id);
	}
	@Override
	public Article getCreatedArticle(String title) {

		return articleMapper.getCreatedArticle(title);
	}

	@Override
	public int getCreatedArticleByAuthor_Title(String author, String title) {
		return  articleMapper.getCreatedArticleByAuthor_Title(author, title);
	}

	@Override
	public List getAllSort(String sort_name) {
		return articleMapper.getAllSort();
	}

	@Override
	public Map getSortAndAirticle(String sort_name) {
		Map map = new HashMap();
		List<Article> articleBySort = null;

		// ��ȡ���з���
		if (sort_name.equals("all") || StringUtils.isEmpty(sort_name)) {
			List<String> sorts = articleMapper.getAllSort();

			for (int i = 0; i < sorts.size(); i++) {
				String sort = sorts.get(i);
				log.debug("sort: "+sort);
				articleBySort = articleMapper.getArticleBySort(sort);	//���ݷ����ȡ����
				log.debug("articleBySort: "+articleBySort);
				ArticleUtils.cutTime(articleBySort);	//cutTime����List
				map.put(sort, articleBySort);
			}
		} 
		else { 
			// ��ȡ�������� //��Ϊsort_name��ֵΪall�����Բ�ѯ���Ϊselect *from t_article where sort=all -->���󣡣��� 
			articleBySort = articleMapper.getArticleBySort(sort_name); 
			ArticleUtils.cutTime(articleBySort); 
			map.put(sort_name,articleBySort); }
		return map;
	}

	@Override
	public Map getTagAndArticle(String tag_name) {
		Map map = new HashMap();
		List<Integer> article_id;
		List<Tag> tag_list = null;	//��ΪgetAllTag()���ص���Tag���͡�getArticleByTag()���ص���Article���ͣ���tag_list���÷��ͣ����ⱨ��
		
		List<Article> articleByTag=null;
		String tag1=null;
		//��if�ж� ���ݿͻ��˴�����ֵ �ж��� ��ȡ���б�ǩ ���� ���ݲ����еı�ǩ��ȡ��Ӧ������
		if (tag_name.equals("all") || StringUtils.isEmpty(tag_name)) {
			List<String> tags = articleMapper.getAllTag();

			for (int i = 0; i < tags.size(); i++) {
				String tag = tags.get(i);
				log.debug("tag: "+tag);
				articleByTag = articleMapper.getArticleByTag(tag);	//���ݷ����ȡ����
				log.debug("articleByTag: "+articleByTag);
				ArticleUtils.cutTime(articleByTag);	//cutTime����List
				map.put(tag, articleByTag);
			}
		} 
		else {  
				articleByTag = articleMapper.getArticleByTag(tag_name); 
				ArticleUtils.cutTime(articleByTag); 
				map.put(tag_name,articleByTag);
			}
			
			return map;
	}						
	@Override
	public Map getUserAndArticle() {
		Map map=new HashMap();
		List<User> users;
		List<Article> articles;
		User user;
		
		users=userMapper.listUser();
		for(int i=0;i<users.size();i++) {
			user=users.get(i);
			articles=articleMapper.getArticleByUser(user.getUser_id());
			map.put(user, articles);		
		}
		return map;
	}
	@Override
	public Article getPreviousArticle(String time) {
		return this.getANearArticle(time, LESS);	//ʹ��this��ʾ�÷����Ǹ����е�
	}

	@Override
	public Article getNextArticle(String time) {
		return this.getANearArticle(time, MORE);
	}

	public Article getANearArticle(String time,int less_or_more){
		if (less_or_more == this.LESS) {
			return articleMapper.getArticleByPreviousTime(time);
		} 
		else if (less_or_more == this.MORE) {
			return articleMapper.getArticleByNextTime(time);
		}

		return null;	//Ϊʲôif��return��if�⻹Ҫ��return�أ� -->���ⲻ��������ʱ��û��return


	}

	@Override
	public List<Article> searchArticle(String title) {
		List<Article> articles=null;
		
		articles=articleMapper.searchArticle(title);
		
		return articles;
	}

	


}
