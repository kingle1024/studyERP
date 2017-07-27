package com.mycompany.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mycompany.vo.Approval;
import com.mycompany.vo.ApprovalSub;
public interface SignMapper {
	@Select("select * from approvals where state = 'processing' and recv_id = #{recv_id} order by no desc") 	// 대기
	public List<Approval> getApprovalWaiting(@Param("recv_id")String recv_id);
	
	// select * from approvals where state = 'processing' and recv_id != 'teran1024@naver.com' and exists (select * from approvals_sub where doc_no = 36 and recv_id='teran1024@naver.com');
	@Select(""
			+ "select * "
			+ "from approvals "
			+ "where state = 'processing' and recv_id != #{recv_id} "
			+ "and exists ("
			+ "	select * "
			+ "	from approvals_sub "
			+ "	where recv_id= #{recv_id} "
			+ ") order by no desc") // 대기 . 근장장 대기 - 근장장이 승인을 하여 관리자에게 간 경우 
	public List<Approval> getApprovalIng(@Param("recv_id") String recv_id); // 진행
	
	@Select("select * from approvals where no = #{Doc}")
	public Approval getApprovalAll(@Param("Doc")String Doc);
	
	@Select("select * from approvals where state = 'approval' and recv_id = #{recv_id} order by no desc") // 승인
	public List<Approval> getApprovalFinal(@Param("recv_id")String recv_id);
	
	@Select("select * from approvals where state = 'reject' and recv_id = #{recv_id} order by no desc") // 반려
	public List<Approval> getApprovalReject(@Param("recv_id")String recv_id);
	
	@Select("select * from authorities where email = #{email} ") // 아이디로 권한 찾기
	public Object getAuthorityCheck(@Param("email") String email);
	
	@Insert("insert into approvals (title, content, etc, state, stepIng, stepFinal, send_id, recv_id, type_code, register_date) "+
			" values ( #{title}, #{content}, #{etc}, 'processing', 1, 1, #{send_id}, #{recv_id}, 1200, now() )")
	public boolean atypicalDoc(Approval approval);

	@Insert("insert into approvals (title, content, etc, state, stepIng, stepFinal, send_id, recv_id, type_code, register_date) "+
			" values ( #{title}, #{content}, #{etc}, 'processing', 1, 2, #{send_id}, #{recv_id}, 1300, now() )")
	public boolean testDoc(Approval approval);
	
	@Insert("insert into approvals_sub (doc_no, recv_id, update_date) values ( #{doc_no}, #{recv_id}, now() )")
	public boolean approvalSub(@Param("doc_no") String doc_no, @Param("recv_id") String recv_id);
	
	@Update("update approvals set state = 'reject' where no = #{Doc} ")
	public boolean rejectDoc(@Param("Doc") String Doc);
	
	@Update("update approvals set stepIng = stepIng + 1, recv_id = #{recv_id} where no = #{Doc}")
	public boolean plusStateIng(@Param("Doc") String Doc,@Param("recv_id") String recv_id);
	
	@Update("update approvals set state = 'approval' where no = #{Doc} ")
	public boolean approvalState(@Param("Doc") String Doc);
	
}
