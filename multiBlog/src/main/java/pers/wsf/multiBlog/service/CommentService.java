package pers.wsf.multiBlog.service;

import java.util.List;
import java.util.Map;

import pers.wsf.multiBlog.pojo.Comment;

public interface CommentService {

	void addComment(int userId,int article_id,String content,String commentTime);	//ȥ����int diss

	void deleteComment(int comment_id);
	
	List<Comment> getCommentById(int article_id);
	
	Map<List<String>,List<String>> getAllComment(int article_id);
}
