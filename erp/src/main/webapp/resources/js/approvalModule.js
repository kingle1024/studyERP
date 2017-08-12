$(document).ready(function() {
	$("#ReadingInfoSelectBtn").click(function(){
		var formData = $("#formname1").serialize();
		$.ajax({
			type : "POST",
			url : "atypicalDoc",
			cache : false,
			data : formData,
			success : function(json, status){
				alert("결재 되었습니다");					
				window.close();
			},
			error : function(data, status){
				alert("error");
			}
		});
	});
});