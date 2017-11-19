<%@page import="com.mycompany.vo.Message"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
#jumbo {
	padding-top: 20px;
	padding-bottom: 20px;
}
#custom-search-input{
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#custom-search-input input{
    border: 0;
    box-shadow: none;
}

#custom-search-input button{
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{
    font-size: 23px;
}
</style>
<title>공지사항</title>
</head>
<body>
<div id="page-wrapper">
	  <div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-table"></i>  <strong>공지사항</strong> 
               </div>
           </div>
       </div>      	
       <form action="<c:url value="/notices"/>" method="GET" id="exploreForm">
	       <div class="col-lg-6" style="float:right;">
	       		<div id="custom-search-input">
	                <div class="input-group col-md-12">
	                    <input type="text" name="word" class="form-control input-lg" placeholder="검색" />
	                    <span class="input-group-btn">
	                        <button type="submit" class="btn btn-info btn-lg" form="exploreForm">
	                            <i class="glyphicon glyphicon-search"></i>
	                        </button>
	                    </span>
	                </div>
	            </div>
	        </div>
       </form>
       <br/><br/><br/>
		<table class="table table-striped">
			<tr>
				<th width="5%" nowrap>번호</th>
				<th>제목</th>
				<th width="1%" nowrap>작성자</th>
				<th width="9%" nowrap>날짜</th>
				<th width="1%" nowrap>조회수</th>
			</tr>
			<tbody>
				<c:forEach var="board" items="${boardList}" varStatus="status">
					<tr>
						<th>${ board.id }</th>
						<th><a href="<c:url value="/notice/view/${ board.id }/?page=${page }&lastPage=${lastPage }&word=${word }" /> ">
								${ board.title } </a>
								  &nbsp;&nbsp;<span class="badge badge-pill badge-info">${ commentCount[status.count-1] }</span>
								</th>
						<th>${ board.author }</th>
						<th><fmt:formatDate value="${ board.register_date }"
								pattern="MM-dd HH:mm" /></th>
						<th>${ board.hit }</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">
			<!-- http://coderbycode.tistory.com/111  -->
			<!-- 페이징 처리 -->
			<ul class="pagination">
				<c:if test="${page>1}"> <!-- 2페이지 이후일 때 부터 출력 -->
					<c:forEach var="previous" begin="1" end="${page-1}" step="1">
						<li><a href="<c:url value="/notices?page=${previous }&lastPage=${lastPage }&word=${word }" /> ">${previous}</a></li>					
					</c:forEach>
				</c:if>				
				<li class="active"><a href="#">${page}</a></li> <!-- 현재 페이지 -->
				<c:forEach var="next" begin="${page+1}" end="${lastPage}" step="1">
					<li><a href="<c:url value="/notices?page=${next }&lastPage=${lastPage }&word=${word }" /> ">${next }</a></li>
				</c:forEach>
			</ul>
		</div>
		<sec:authorize access="hasRole('ADMIN')">
			<a href="<c:url value="/notice/new" />"
				class="btn btn-lg btn-primary" style="width: 100%;"> 글쓰기</a>
		</sec:authorize>
	</div>
</body>
</html>