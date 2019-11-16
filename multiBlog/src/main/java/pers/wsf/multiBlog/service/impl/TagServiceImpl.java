package pers.wsf.multiBlog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.wsf.multiBlog.mapper.TagMapper;
import pers.wsf.multiBlog.pojo.Tag;
import pers.wsf.multiBlog.service.TagService;
@Service
public class TagServiceImpl implements TagService {

	@Autowired
	TagMapper tagMapper;

	@Override	
	public void addTag(int article_id, String tag) {
		tagMapper.addTag(article_id, tag);
	}

	@Override
	public Tag getTagById(int id) {
		return tagMapper.getTagById(id);
	}

	@Override
	public void updateTag(int article_id, String tag) {	
		 tagMapper.updateTag(article_id, tag);		
	}
	
	

}
