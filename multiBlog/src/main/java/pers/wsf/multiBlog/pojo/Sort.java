package pers.wsf.multiBlog.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 项目名称：multiBlog
 * 类名称：Sort
 * 类描述：
 * @author 32373
 */
public class Sort implements Serializable{

	private int sort_id;
	private String sort;
	private List<Article> articles;
	
	public Sort() {}
	public List<Article> getArticle() {
		return articles;
	}	

	public int getSort_id() {
		return sort_id;
	}

	public void setSort_id(int sort_id) {
		this.sort_id = sort_id;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "Sort [sort_id=" + sort_id + ", sort=" + sort + "]";
	}
	
	
}
