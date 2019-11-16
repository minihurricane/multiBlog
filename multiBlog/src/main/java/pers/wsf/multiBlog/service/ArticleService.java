package pers.wsf.multiBlog.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import pers.wsf.multiBlog.pojo.Article;

public interface ArticleService {

	void addArticle(Article article);
	
	void deleteArticle(int id);

	Article updateArticle(Integer article_id,String author,String title,String sort,String time,String content,String tag);

	List<Article> listAllArticle();
	
	List<Article> getUserArticle(int user_id);
	
	Article getOneArticle(int id);
	
	Article getArticleAndSort(int article_id);

	Article createArticle(String title, String author, String sort, String time, String content);
	
	Article getCreatedArticle(String title);
	/* ͨ�����ߡ���������ѯ��Ӧ����id */
	int getCreatedArticleByAuthor_Title(String author,String title);
	
	List getAllSort(String sort_name);
	
	Map getSortAndAirticle(String sort_name);
	
	Map getTagAndArticle(String tag_name);
	
	Map getUserAndArticle();
	
	Article getPreviousArticle(String time);
	
	Article getNextArticle(String time);
	
	List<Article> searchArticle(String title);

}
