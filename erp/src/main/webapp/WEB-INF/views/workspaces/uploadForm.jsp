<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>파일 업로드</title>

</head>
<body>
	<script type="text/javascript">
		function reviewUploadImg(fileObj) {
			var filePath = fileObj.value;
			var fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
			var fileKind = fileName.split(".")[1];
			if (fileKind != "xlsx") {
				alert("xlsx 확장자를 가진 이미지 파일만 올려주세요.");
				document.getElementById("files[0]").value = "";
				document.getElementById("files[0]").select();
				document.selection.clear();
			}
		}
	</script>
	<script>
		function test() {
			if (document.selection) { //IE
				var range = document.body.createTextRange();
				range.moveToElementText(document.getElementById("fileup"));
				range.select();
			} else if (window.getSelection) { //others
				var range = document.createRange();
				range.selectNode(document.getElementById("fileup"));
				window.getSelection().addRange(range);
			}
		}
	</script>
	<form action="<c:url value="/workspaces/uploadForm" />"
		name="inputForm" enctype="multipart/form-data" method="POST">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-folder-open fa-fw"></i> 엑셀 업로드
				</h3>
			</div>
			<div class="panel-body">
				<input type="file" id="fileup" name="files[0]" />
			<input type="submit" value="확인" class="btn btn-primary">
			</div>
		</div>
	</form>
</body>
</html>