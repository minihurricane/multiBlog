package pers.wsf.multiBlog.mapper;

import org.apache.ibatis.annotations.Param;

import pers.wsf.multiBlog.pojo.Tag;

public interface TagMapper {

	void addTag(@Param("article_id") int article_id,@Param("tag") String tag);
	
	Tag getTagById(Integer article_id);
	
	void updateTag(@Param("article_id") Integer article_id,@Param("tag") String tag);
}
