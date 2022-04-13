<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<script>
		function closePopup() {
			self.close();
		}
</script>
</head>
<body>
	<h2 align="center"><%= message %></h2>
	<div align = "center">
	<button onclick = "closePopup()" style ="width:50%">취소하기</button>
	</div>
</body>
</html>