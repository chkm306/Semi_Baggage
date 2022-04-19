<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BAGGAGE</title>
<style>
	body {
		text-align: center;
	}
	.deleteYBtn, .deleteNBtn{
		background-color: #324001;
		color: white;
	}
</style>
<script>
	var temp = location.href.split("?");
	var sr_no = temp[1];
	
	function deleteY() {
		location.href="<%=request.getContextPath()%>/srDeletePopup.do?sr_no=" + sr_no;
	}
	function deleteN() {
		window.close();
	}
</script>
</head>
<body>
	<br>
	정말로 삭제하시겠습니까?<br><br>
	<input type="button" class="deleteYBtn" onclick="deleteY()" value="네" />
    <input type="button" class="deleteNBtn" onclick="deleteN()" value="아니오" />
</body>
</html>