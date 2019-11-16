package pers.wsf.multiBlog.pojo;

/*
 * AxisArticle����Axisʱ���� ����������õ� һ��Article��ļ򻯰�
 * */

public class AxisArticle {

	private String title;
	private User user;	
	private int article_id;
	private int id;
	private int year;
	private int month;
	private int day;
		
	@Override
	public String toString() {
		return "AxisArticle [title=" + title + ", user=" + user + ", article_id=" + article_id + ", id=" + id
				+ ", year=" + year + ", month=" + month + ", day=" + day + "]";
	}

	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
		
}
