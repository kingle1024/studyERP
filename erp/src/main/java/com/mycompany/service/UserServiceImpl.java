//package com.mycompany.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.mycompany.exception.EmailExistsException;
//import com.mycompany.mapper.UserMapper;
//import com.mycompany.resource.User;
//
//@Service
//public class UserServiceImpl implements UserService {
//
//	@Autowired
//	private UserMapper userMapper;
//
//	@Override
//	@Transactional
//	public void create(User user) throws EmailExistsException {
//		if (emailExisted(user.getEmail()))
//			throw new EmailExistsException("email already existed..");
//
//		userMapper.insertUser(user);
//		userMapper.insertAuthority(user.getEmail(), "USER");
//	}
//
//	private boolean emailExisted(String email) {
//		User user = userMapper.findByEmail(email);
//		if (user != null)
//			return true;
//
//		return false;
//	}
//
//	@Override
//	public void addAuthority(String email, String authority) {
//		userMapper.insertAuthority(email, authority);
//	}
//
//}
