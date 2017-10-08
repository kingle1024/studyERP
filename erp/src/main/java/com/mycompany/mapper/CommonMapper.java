package com.mycompany.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CommonMapper {
	@Select("select name from users where email = #{email}")
	public String getEmailFromUsers(@Param("email") String email);
	
	@Insert("INSERT INTO visit (V_DATE) VALUES (now())")
	public boolean insertToday();
	
	@Select("SELECT COUNT(*) FROM visit WHERE V_DATE = #{V_DATE}")
	public int getTodayCount(@Param("V_DATE") String V_DATE);
	
}
