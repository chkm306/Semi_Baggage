<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<style>
	.content{
			width:70%;
			height:800px;
		}
		<%--.topList {
			width: 1000px;
			height: 400px;
			background: black;
			color: white;
			margin: auto;
		}
		
		.thumb {
			display: inline-block;
			width: 250px;
			height: 250px;
			margin: 10px;
			border: 1px solid white;
		}
		
		.thumb:hover {
			cursor: pointer;
		}--%>
		.banner{
		background:url('<%=request.getContextPath() %>/resources/images/main.jpg') no-repeat;
		background-size:cover;
		}
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>
	<div class="main-reservation">
	
	</div>
	
	<div class="content">
	
	
	</div>
	
	<%@ include file="views/common/footer.jsp" %> 
</body>
</html>