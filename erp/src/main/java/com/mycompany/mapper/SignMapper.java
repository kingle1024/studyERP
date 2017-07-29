package com.mycompany.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mycompany.vo.Approval;
import com.mycompany.vo.ApprovalSub;
public interface SignMapper {
	@Select("select * from approvals where recv_id = #{recv_id} and state = 0 ")
	public List<Approval> showRecvWaitingList(@Param("recv_id")String recv_id); // 자신이 받는 상태에서 대기인 것 모두
	
	@Select(""
			+ "select * "
			+ "from approvals "
			+ "where state = 0 and (recv_id) "
			+ "not in ("
			+ "	select recv_id "
			+ "	from approvals_system "
			+ "	where recv_id=#{recv_id})")
	public List<Approval> showRecvIngList(@Param("recv_id")String recv_id ); // 상태가 0인것 중에서 approval_system에 자신의 아이디가 포함되어 있는 것, 진행
	
	@Select("select * from approvals where recv_id = #{recv_id} and state = 1 ") 
	public List<Approval> showRecvApprovalList(@Param("recv_id")String recv_id); // 자신이 받는 상태에서 승인인 것 모두
	
	@Select("select * from approvals where recv_id = #{recv_id} and state = 2 ")
	public List<Approval> showRecvRejectList(@Param("recv_id")String recv_id ); // 자신이 받는 상태에서 반려인 것 모두

	@Select("select * from approvals where send_id = #{send_id} and state = 0 ")
	public List<Approval> showSendIng(@Param("send_id")String send_id);
	
	@Select("select * from approvals where send_id = #{send_id} and state = 1")
	public List<Approval> showSendApprovalList(@Param("send_id")String send_id);
	
	@Select("select * from approvals where send_id = #{send_id} and state = 2")
	public List<Approval> showSendReject(@Param("send_id")String send_id);
	
	@Update("update approvals set state = 2 where no=#{no}")
	public boolean reject(@Param("no")int no);
}
