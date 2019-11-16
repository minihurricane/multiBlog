package pers.wsf.multiBlog.mapper;

import java.sql.Timestamp;
import java.util.List;

import javax.ws.rs.PathParam;

import org.apache.ibatis.annotations.Param;

import pers.wsf.multiBlog.pojo.Article;
import pers.wsf.multiBlog.pojo.Tag;
import pers.wsf.multiBlog.pojo.User;


public interface ArticleMapper {

	void addArticle(Article article);

	void createArticle(@Param("user_id") Integer user_id,@Param("sort_id") Integer sort_id,@Param("title") String title,@Param("time") String time,@Param("content") String content);

	void deleteArticle(int article_id);
	
	void updateArticle(@Param("article_id") Integer article_id,@Param("sortId") Integer sortId,@Param("title") String title,@Param("content") String content);
	
	List<Article> listAllArticle();
	
	List<Article> getAllArticle();
	
	List<Article> getUserArticle(int user_id);
	
	/* ͨ���β�column����ȡ��������--sort ;����ΪgetArticleByColumn��Ϊ�˷��������ֶε���*/
	List<Article> getArticleBySort(@Param("value") String value);
	
	List<Article> getArticleByTag(@Param("tag") String tag);
//	List<Article> getArticleByTagId(@Param("article_id") int article_id);	
	
	List<Article> getArticleByUser(int user_id);
	
	Article getOneArticle(int article_id);
	
	Article getOneArticleById(int article_id);
	
	Article getArticleAndSort(int article_id);
	
	/* getCreateedArticle()���ײ������һ���ļ�¼ ������*/
	Article getCreatedArticle(String title);

	Article getUpdatedArticle(@Param("userId") int userId,@Param("title") String title);
	
	Article getCreateArticleByUser(@Param("userId") int userId,@Param("time") String time);
	
	/* ͨ�����ߡ���������ѯ��Ӧ����id */
	/* ӳ���ļ���,���������@Paramע��ʱ �ͻᱨ�������;�ж��������ʱ���Ҫ�� */
	int getCreatedArticleByAuthor_Title(@Param("author") String author,@Param("title") String title);

	List<String> getAllSort();
	
	List<String> getAllTag();
	
	Article getLastArticle();
	
	Article getArticleByPreviousTime(String time);
	
	Article getArticleByNextTime(String time);
	
	List<Tag> getTagByArticle(String tag_name);
	
	User getUserByArticleId(int article_id);
	
	 List<Article> searchArticle(@Param("title") String title); 
	
}
