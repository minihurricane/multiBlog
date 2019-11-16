package pers.wsf.multiBlog.pojo;

public class Comment {	

	private int comment_id;
	private int user_id;	//Ϊ����ʾ���ĸ��û�д������
	private int article_id;	
	private String content;
	private String comment_time;
	private int star;
	private int diss;	
	
	private Article article;
	


	public int getComment_id() {
		return comment_id;
	}


	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}


	public Comment() {}
	
	
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getComment_time() {
		return comment_time;
	}

	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}

	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getDiss() {
		return diss;
	}
	public void setDiss(int diss) {
		this.diss = diss;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}


	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", user_id=" + user_id + ", article_id=" + article_id
				 + ", content=" + content + ", comment_time=" + comment_time + ", star="
				+ star + ", diss=" + diss + ", article=" + article + "]";
	}



	
	
	
	
	
}
