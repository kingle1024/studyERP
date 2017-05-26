package com.mycompany.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.mycompany.vo.User;

public interface userMapper { // HEX(AES_ENCRYPT(#{password},'db'))
//	@Insert("INSERT INTO users (email, password, enabled) " + "VALUES (#{email}, HEX(AES_ENCRYPT(#{password},'db')), true)")
	@Insert("INSERT INTO users (email, password, name, enabled) " + "VALUES (#{email}, #{password}, #{name}, true)")
	public boolean insertUser(User user);
	// insert ubti users (e,p,n,e) values( 'uid', 'sdfjksdfhkdjsfhjksdfksdjfsdfsdf'
	@Insert("INSERT INTO authorities (email, authority) " + "VALUES (#{email}, #{authority} )")
	public boolean insertAuthority(@Param("email") String email, @Param("authority") String authority);
	
}
