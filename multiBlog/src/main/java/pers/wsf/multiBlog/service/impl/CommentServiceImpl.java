package pers.wsf.multiBlog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.wsf.multiBlog.mapper.CommentMapper;
import pers.wsf.multiBlog.mapper.UserMapper;
import pers.wsf.multiBlog.pojo.Comment;
import pers.wsf.multiBlog.service.CommentService;
@Service("CommentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper commentMapper;
	@Autowired	
	UserMapper userMapper;
	
		
	@Override
	public void addComment(int userId, int article_id, String content, String commentTime) {
		commentMapper.addComment(userId, article_id, content, commentTime);
	}
	
	@Override
	public void deleteComment(int id) {
		commentMapper.deleteComment(id);
	}

	@Override
	public List<Comment> getCommentById(int article_id) {
		return commentMapper.getCommentById(article_id);
	}

	@Override
	public Map<List<String>,List<String>> getAllComment(int article_id) {
		Map commentMap;
		List<Comment> comment=commentMapper.getAllComment(article_id);
		//根据用户id获取用户名，使用Map，多组 一对多关系（用户-评论）的数据
		//文章-用户：一对多
		
		return getUserAndComment(article_id);
				
	}

	
	Map getUserAndComment(int article_id) {
		Map user_comment_map=new HashMap();
		List<Integer> userIds;
		List<Comment> comments;
		int userId;
		String username;
		
		//获取用户名：用户-评论
		userIds=commentMapper.getUserIdByArticleId(article_id);
		for(int i=0;i<userIds.size();i++) {		
			userId=userIds.get(i);
			username=userMapper.getUsernameById(userId);
			comments=commentMapper.getCommentByUserArticleId(userIds.get(i),article_id);
			user_comment_map.put(username, comments);
		}
		
		
		return user_comment_map;
	}
	

}
