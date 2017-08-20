package com.mycompany.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.mycompany.vo.Authority;
import com.mycompany.vo.User;

public interface userMapper { // HEX(AES_ENCRYPT(#{password},'db'))
//	@Insert("INSERT INTO users (email, password, enabled) " + "VALUES (#{email}, HEX(AES_ENCRYPT(#{password},'db')), true)")
	@Insert("INSERT INTO users (email, password, name, socialNumFront, enabled) " + "VALUES (#{email}, #{password}, #{name}, #{socialNumFront}, true)")
	public boolean insertUser(User user);
	// insert ubti users (e,p,n,e) values( 'uid', 'sdfjksdfhkdjsfhjksdfksdjfsdfsdf'
	@Insert("INSERT INTO authorities (email, authority) " + "VALUES (#{email}, #{authority} )")
	public boolean insertAuthority(@Param("email") String email, @Param("authority") String authority);
	
	////////////////////추가부분
	@Select("SELECT id, email, name FROM users")
	@Results(value = {
	        @Result(property = "id", column = "id"),
	        @Result(property = "email", column = "email"),
	        @Result(property = "name", column ="name"),
	        @Result(property = "authorities", column = "email", javaType = List.class, many = @Many(select = "selectAuthority"))
	})
	public List<User> selectUsers();
	
	@Select("SELECT id, email FROM users WHERE id = #{userId}")
	@Results(value = {
	        @Result(property = "id", column = "id"),
	        @Result(property = "email", column = "email"),
	        @Result(property = "authorities", column = "email", javaType = List.class, many = @Many(select = "selectAuthority"))
	})
	public User selectUserById(int userId);
	
	@Select("select * from users where email=#{email}")
	public User getUserList(String email);
	
	@Select("select email from users where email=#{email}")
	public String getUserEmail(@Param("email") String email);
	
	@Select(" SELECT id as userNo, email as userId, password as userPw FROM users ")
	List<User> selectUserList(Map<String, Object> map);

	@Select(" SELECT id as userNo, email as userId, password as userPw FROM users ")
	List<User> selectUserList2(Map<String, Object> map);
	
	@Select("select count(*) from users")
	public int getLastPage();
	
	@Select("SELECT email, authority "
            + "FROM authorities "
            + "WHERE email = #{email}")
    public List<Authority> selectAuthority(String email);
	
	@Delete("DELETE FROM authorities WHERE email = #{email} AND authority = #{role}")
	public void deleteAuthority(@Param("email") String email, @Param("role") String role);

	@Delete("delete from users where id = #{userId}")
	public void deleteUser(@Param("userId") int userId);	
}
