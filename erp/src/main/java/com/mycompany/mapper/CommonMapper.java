package com.mycompany.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CommonMapper {
	@Select("select name from users where email = #{email}")
	public String getEmailFromUsers(@Param("email") String email);
}
