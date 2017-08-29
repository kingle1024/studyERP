<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>파일 업로드</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
<script type="text/javascript">

function reviewUploadImg(fileObj)
{
 var filePath = fileObj.value;
 var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
 var fileKind = fileName.split(".")[1];
 if(fileKind != "jpg" && fileKind != "gif" && fileKind != "png" && fileKind !="xlsx")
 {
  alert("jpg, gif, png 확장자를 가진 이미지 파일만 올려주세요.");
  document.getElementById("image_file").value = "";
  document.getElementById("image_file").select();
  document.selection.clear();
 }
}

</script>


	<form action="<c:url value="/workspaces/upload" />" enctype="multipart/form-data" >
		파일업로드<input type="file" id="fileup" onchange="this.select(); document.getElementById('filetext').value=document.body.createTextRange().text.toString();" />
실제 값<input type="text" id="filetext" />

		<input type="submit" value="확인"> 
	</form>
</body>
</html>