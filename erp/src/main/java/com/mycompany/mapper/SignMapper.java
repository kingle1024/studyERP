package com.mycompany.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mycompany.vo.Approval;
import com.mycompany.vo.ApprovalSub;
import com.mycompany.vo.ApprovalSystem;
import com.mycompany.vo.BreakDownDocument;
public interface SignMapper {
	@Select("select * from approvals where recv_id = #{recv_id} and state = 0 order by no desc ")
	public List<Approval> showRecvWaitingList(@Param("recv_id")String recv_id); // 자신이 받는 상태에서 대기인 것 모두
	
	/*
	 * select * 
	 * from approvals 
	 * where recv_id != 'admin' and state = 0 and (type_code) 
	 * in (
	 * 	select type_code 
	 * 	from approvals_system 
	 * 	where recv_id='admin'
	 * ) order by no desc 
	 */
	@Select(""
			+ "select * "
			+ "from approvals "
			+ "where recv_id != #{recv_id} and state = 0 and (type_code) "
			+ "in ("
			+ "	select type_code "
			+ "	from approvals_system "
			+ "	where recv_id=#{recv_id} "
			+ ") order by no desc ")
	public List<Approval> showRecvIngList(@Param("recv_id")String recv_id ); // 상태가 0인것 중에서 approval_system에 자신의 아이디가 포함되어 있는 것, 진행
	
	@Select("select * from approvals where recv_id = #{recv_id} and state = 1 order by no desc") 
	public List<Approval> showRecvApprovalList(@Param("recv_id")String recv_id); // 자신이 받는 상태에서 승인인 것 모두
	
	@Select("select * from approvals where recv_id = #{recv_id} and state = 2 order by no desc")
	public List<Approval> showRecvRejectList(@Param("recv_id")String recv_id ); // 자신이 받는 상태에서 반려인 것 모두

	@Select("select * from approvals where send_id = #{send_id} and state = 0 order by no desc")
	public List<Approval> showSendIng(@Param("send_id")String send_id);
	
	@Select("select * from approvals where send_id = #{send_id} and state = 1 order by no desc")
	public List<Approval> showSendApprovalList(@Param("send_id")String send_id);
	
	@Select("select * from approvals where send_id = #{send_id} and state = 2 order by no desc")
	public List<Approval> showSendReject(@Param("send_id")String send_id);

	@Select("select * from approvals where no = #{doc} ")
	public Approval getApproval(@Param("doc")String doc);
	
	
	@Select("select * from approvals_sub where doc = #{doc} and send_id = #{send_id}")
	public ApprovalSub getApprovalSub(@Param("doc")String doc, @Param("send_id")String send_id);
	
	@Select("select * from approvals_sub where doc = #{Doc} order by step asc") // 해당하는 문서의 모든 정보를 가져온다 step의 값이 낮은게 0번 인덱스에 가도록 하기 위해 asc.
	public List<ApprovalSub> getApprovalSubList(@Param("Doc")String Doc);
	
	@Select("select * from approvals_sub where doc = #{Doc}")
	public ApprovalSub checkEmptyApprovalSubList(@Param("Doc")String Doc);
	
	@Select("select count(no) from approvals_sub where doc = #{Doc} order by step asc")
	public int cntApprovalSub(@Param("Doc")String Doc);
	
	@Select("select recv_id from approvals_system where type_code = #{type_code} and step=1") // 처음 문서를 보낼 때 받을 사람의 아이디를 가져온다 그래서 step = 1이다.
	public String ListgetApprovalSystem(@Param("type_code")String type_code);
	
	@Select("select recv_id from approvals_system where type_code = #{type_code} and step = #{step} +1")
	public String getNextApprovalUser(@Param("type_code")String type_code, @Param("step")int step);
	
	@Select("select * from approvals_system where type_code = #{type_code} and recv_id = #{recv_id}")
	public ApprovalSystem getApprovalSystem(@Param("type_code")String type_code, @Param("recv_id")String recv_id);
	
	@Select("select * from approvals_system where type_code = #{type_code}") // /signs/docAtypicalView에서 사용함
	public List<ApprovalSystem> getApprovalSystemList(@Param("type_code")String type_code);
	
	@Select("select * from approvals_system where type_code = #{type_code} and recv_id = #{recv_id}")
	public ApprovalSystem getCurrent(@Param("type_code")String type_code, @Param("recv_id")String recv_id);
	
	@Select("select no from approvals order by no desc limit 1")
	public int recentLimitOne();
	
	@Select("select * from breakdown_document where no = #{Doc} ")
	public BreakDownDocument showBreakDownDocument(@Param("Doc")String Doc);
	
	@Update("update approvals set state = 1 where no=#{Doc}")
	public boolean approvalEnd(@Param("Doc")String Doc);
	
	@Update("update approvals set state = 2 where no=#{Doc}")
	public boolean reject(@Param("Doc")String Doc);
	
	@Update("update approvals set recv_id = #{recv_id} where no = #{Doc}")
	public boolean changeApprovalRecvId(@Param("recv_id")String recv_id, @Param("Doc")String Doc);
	
	@Insert("insert into approvals_sub (doc, step, lastStep, state, update_date, send_id, type_code) values (#{doc}, #{step}, #{lastStep}, #{state}, now(), #{send_id}, #{type_code }) ")
	public boolean approvals_sub(@Param("doc")String doc, @Param("step")int step, @Param("lastStep")int lastStep, @Param("state")int state, @Param("send_id")String send_id, @Param("type_code")String type_code);
	
	@Insert("insert into approvals (title, content, etc, state, send_id, recv_id, type_code, register_date) values( #{title}, #{content}, #{etc}, 0, #{send_id}, #{recv_id}, #{type_code}, now() ) ")
	public boolean insertApproval(Approval approval);
	
	@Insert("insert into breakdown_document (no, distinguish, item, room_num) values (#{no}, #{distinguish}, #{item}, #{room_num})")
	public boolean insertBreakDownDocument(BreakDownDocument breakDownDocument);
	
}
