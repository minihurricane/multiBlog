package pers.wsf.multiBlog.service;

import pers.wsf.multiBlog.pojo.Tag;

public interface TagService {

	void addTag(int article_id,String tag);
	
	Tag getTagById(int id);
	
	void updateTag(int article_id,String tag);
}
