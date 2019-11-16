package pers.wsf.multiBlog.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import pers.wsf.multiBlog.pojo.Comment;



public interface CommentMapper {
	
	void addComment(@Param("userId") int userId,@Param("article_id") int article_id,@Param("content") String content,@Param("commentTime") String commentTime);	//�����벩�����¡��û�����
	
	void deleteComment(int comment_id);
	
	List<Comment> getCommentById(int article_id);
	
	List<Integer> getUserIdByArticleId(int article_id);
	
	List<Comment> getAllComment(int article_id);
	
	List<Comment> getCommentByUserArticleId(@Param("user_id") int user_id,@Param("article_id") int article_id);
}
