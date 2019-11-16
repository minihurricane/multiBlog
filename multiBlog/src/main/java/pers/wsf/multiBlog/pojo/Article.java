package pers.wsf.multiBlog.pojo;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import pers.wsf.multiBlog.utils.DateUtils;

public class Article implements Comparable,Serializable{

	private int article_id;
	private int user_id;
	private String title;			
	private String time; //ʱ��ΪString���ͷ���ʹ��cutString����ȡ������
	private int star;
	private int comment;
	private int visit;
	private String content;
	List<Tag> tag;	//不需要给tag setter、getter方法:错，需要getter方法，不需要setter方法
	User user;
	Sort sort;
	
	public Article() {}
	
	public List<Tag> getTag() {
		return tag;
	}	

	public User getUser() {
		return user;
	}

	public Sort getSort() {
		return sort;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public int compareTo(Object o) {
		if (o instanceof Article) {
			Article article = (Article) o;

			Date this_date = null;
			Date other_date = null;
			try {
				this_date = DateUtils.getDate(this.time);
				other_date = DateUtils.getDate(article.getTime());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return -this_date.compareTo(other_date);
		}
		return 0;
	}

	@Override
	public String toString() {
		return "Article [article_id=" + article_id + ", user_id=" + user_id + ", title=" + title + ", time=" + time
				+ ", star=" + star + ", comment=" + comment + ", visit=" + visit + ", content=" + content + ", tag="
				+ tag + ", user=" + user + ", sort=" + sort + "]";
	}

	

}
