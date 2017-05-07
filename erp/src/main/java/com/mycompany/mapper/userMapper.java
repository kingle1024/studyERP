package com.mycompany.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.mycompany.vo.User;

public interface userMapper { // HEX(AES_ENCRYPT(#{password},'db'))
//	@Insert("INSERT INTO users (email, password, enabled) " + "VALUES (#{email}, HEX(AES_ENCRYPT(#{password},'db')), true)")
	@Insert("INSERT INTO users (email, password, enabled) " + "VALUES (#{email}, #{password}, true)")
	public boolean insertUser(User user);
	
	@Insert("INSERT INTO authorities (email, authority) " + "VALUES (#{email}, #{authority} )")
	public boolean insertAuthority(@Param("email") String email, @Param("authority") String authority);
	
}
