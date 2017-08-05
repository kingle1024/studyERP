package com.mycompany.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.mycompany.vo.Files;

public interface FileMapper {
	@Insert("insert into files (board_no, save_name, real_name, path) values (#{no}, #{save_name}, #{real_name}, #{path} )")
	public void insertFiles(@Param("no") int no, @Param("save_name") String save_name,
			@Param("real_name") String real_name, @Param("path") String path);

	@Select("select * from files where no= #{no}")
	public List<Files> getFileEditUpLoadList(int no);

	@Select("select * from files where board_no= #{board_no}") // 파일 가져오기
	public List<Files> getFileList(int board_no);

	// 컨트롤러에서 @RequestParam으로 가져온다.
	@Select("select real_name from files where save_name = #{save_name}")
	public String getRealName(@Param("save_name") String save_name);

	@Delete("delete from files where no = #{no}")
	public boolean deleteFileInEdit(@Param("no") int no);
}
