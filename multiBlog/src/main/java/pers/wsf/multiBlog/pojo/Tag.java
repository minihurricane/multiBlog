package pers.wsf.multiBlog.pojo;

import java.util.List;

public class Tag {
	
	private int tag_id;
	private int article_id;
	private String tag;
	List<Article> article;
	
	
	public List<Article> getArticle() {
		return article;
	}
	public void setArticle(List<Article> article) {
		this.article = article;
	}
	public int getTag_id() {
		return tag_id;
	}
	public void setTag_id(int tag_id) {
		this.tag_id = tag_id;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Override
	public String toString() {
		return "Tag [tag_id=" + tag_id + ", article_id=" + article_id + ", tag=" + tag + "]";
	}
	
	
	
	
}
