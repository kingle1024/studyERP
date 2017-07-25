<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>결재 하기</title>
<script>
	var loadCheckBoolean = 0;
</script>
<script>
// $(document).ready(function(){
//     $("#a").click(function(){
//     	if(loadCheckBoolean){
//     		if (confirm('현재 작성중인 내용이 있습니다 \n이동하시겠습니까?')) {
// 	    		var url = $(this).attr('href');
// 	    		$("#div1").load("signs/stockDoc");
// 	    	}
//     	}else{
//     		$("#div1").load("signs/stockDoc");
//     		loadCheckBoolean = 1; // true 값으로 변환
//     	}
//     });
// });
// $(document).ready(function(){
//     $("#b").click(function(){
//     	if(loadCheckBoolean){
// 	    	if (confirm('현재 작성중인 내용이 있습니다 \n이동하시겠습니까?')) {
// 	    		var url = $(this).attr('href');
// 		        $("#div1").load("signs/test");
// 	    	}
//     	}else{
//     		$("#div1").load("signs/test");
//     		loadCheckBoolean = 1; // true 값으로 변환
//     	}
//     });
// });
</script>
<script>
// 좀 더 효율적으로 할 수 있는 방법이 없을까??
function display(num){ 
	if(loadCheckBoolean){ // 이동한 적이 있으면
		if (confirm('현재 작성중인 내용이 있습니다 \n이동하시겠습니까?')) {
			if(num == 1){
				$("#div1").load("atypicalDoc");
			}else if(num ==2){
				$("#div1").load("test");
			}else{
				alert('왔긴한데..11');
			}
		}
	}else{ // 아니면 바로 이동
		if(num == 1){
			$("#div1").load("atypicalDoc");
			loadCheckBoolean = 1; // true 값으로 변환
		}else if(num ==2){
			$("#div1").load("test");
			loadCheckBoolean = 1; // true 값으로 변환
		}else{
			alert('왔긴한데..22');
		}
	}
}
</script>
</head>
<body>
<script>
// window.onbeforeunload = function(e) {
// 	  var dialogText = 'Dialog text here';
// 	  e.returnValue = dialogText;
// 	  return dialogText;
// 	};
</script>
<script>
</script>
	<div class="jumbotron" id="subNav">
		<font size="6">결재하기</font>-결재 기능을 수행할 수 있습니다.
	</div>
	<div class="container">
<!-- 		<a href="#" class="btn btn-lg btn-primary" style="width: 33%;" -->
<%-- 			onclick="window.open('<c:url value="signs/stockDoc"/>', '_blank', 'width=1300 height=750')"> --%>
<!-- 			재고신청</a> -->
		<button id="a" class="btn btn btn-primary" onclick="display(1)">재고신청</button>	
		<button id="b" class="btn btn btn-primary" onclick="display(2)">테스트신청</button>
		<div id="div1"></div>
		
	</div>
</body>
</html>