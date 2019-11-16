package pers.wsf.multiBlog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pers.wsf.multiBlog.pojo.User;

public interface UserMapper {
	/* loginUser��Ĳ�����Ū�ø�User������û�������һ�������ֲ�����ͳһ*/
	/* UserMapper��Ĳ�����ӳ���User.xml��ȥ����User.xml���õĲ���Ҫ��ӳ��Ĳ���һ��*/

	User loginUser(@Param("username") String username,@Param("password") String
			password);

	/* User loginUser(String username,String password); �˴��벻����ssm��· */

	void registUser(@Param("username") String username,@Param("password") String password);

	User getOneUserByName(String username);

	Integer getUserIdByName(String username);
	
	void deleteUser(int id);

	List<User> listUser();

	User getOneUser(int id);

	Integer getUserId(String username);

	String getUsernameById(int article_id);
	
	User findUser(String username,String password);


}
