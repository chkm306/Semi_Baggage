<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.faq.model.dto.FAQ"%>
<%

	ArrayList<FAQ> list = (ArrayList<FAQ>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>