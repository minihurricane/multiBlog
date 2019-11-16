package pers.wsf.multiBlog.service.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.wsf.multiBlog.mapper.UserMapper;
import pers.wsf.multiBlog.pojo.User;
import pers.wsf.multiBlog.service.UserService;
import sun.misc.BASE64Encoder;

@Service("UserService")
public class UserServiceImpl implements UserService {

	/**
	 * �ɹ�
	 */
	public static final int SUCCESS = 1;
	/**
	 * �������
	 */
	public static final int PWDERROR = 2;
	/**
	 * �û�������
	 */
	public static final int NONEXIST = 3;
	/**
	 * �û���ע��
	 */
	public static final int REGISTERED = 4;
	/**
	 * ��Ϣ��ƥ��
	 */
	public static final int UNMISMATCH = 5;
	@Autowired
	UserMapper userMapper;
	
	static Logger log=Logger.getLogger(UserServiceImpl.class.getName());
	@Override
	public int registerUser(User user) {
		if(userMapper.getOneUserByName(user.getUsername())!=null) {
			return REGISTERED;
		}
		user.setPassword(EncoderByMd5(user.getPassword()));
		userMapper.registUser(user.getUsername(),user.getPassword());
		log.debug("UserServiceImpl���userName��"+user.getUsername()+" password:"+user.getPassword());
		return SUCCESS;
	}

	@Override
	public void deleteUser(int id) {
		userMapper.deleteUser(id);
	}

	@Override
	public List<User> listUser() {
		return userMapper.listUser();
	}

	@Override
	public User getOneUser(int id) {
		
		return userMapper.getOneUser(id);
	}

	/*���������Ĵ�����<bean�㡢serviceImpl�㡢mapper��ע����ò����� �����ò���Ҫһ����User.xml���õĲ�����Ҫ��UserMapper��Ĳ���һ��>
	 * ��ʾjava.lang.NullPointerException
	 * pers.wsf.multiBlog.service.impl.UserServiceImpl.loginUser��UserServiceImpl.java:40��
	 * pers.wsf.multiBlog.controller.LoginController.Login��LoginController.java:47��
	 */
	@Override
	public int loginUser(String username, String password) {
		User user=userMapper.getOneUserByName(username);
		if(user!=null) {
			if(user.getPassword().equals(EncoderByMd5(password))) {
				return SUCCESS;
			}
			return PWDERROR;
		}
//		return userMapper.loginUser(userName, password);
		return NONEXIST;
	}

	/**����MD5����
	 *@param str
	 *@return encoderStr
	 */
	//EncoderByMd5干嘛要设为private？ 怕泄露？
	public String EncoderByMd5(String str) {
		MessageDigest md5;
		try {
			md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base64Encoder=new BASE64Encoder();
			String encoderStr=base64Encoder.encode(md5.digest(str.getBytes()));
			return encoderStr;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
		
	}

	@Override
	public User getOneUserByName(String username) {
		return userMapper.getOneUserByName(username);
	}

	@Override
	public Integer getUserIdByName(String username) {
		return userMapper.getUserIdByName(username);
	}
	
	

}
