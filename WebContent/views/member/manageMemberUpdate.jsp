<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.member.model.dto.Member"%>
<!DOCTYPE html>
<%
	Member m = (Member)request.getAttribute("member");
	
	String userId = m.getUserId();
	String userName = m.getUserName();
	String userPhone = m.getPhone();
	String userEmail = m.getEmail();
%>
<html>
<head>
<meta charset="UTF-8">
<title>BAGGAGE 관리자</title>
<style>
	.outer{
		width: 100%;
		height: 100%;
		text-align: center;
		margin-top: 40px;
		margin-bottom: 100px;
	}
	.userUpdate{
		width: 70%;
		height: 70%;
		margin: 0 auto;
	}
	table{
		margin-top: 20px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 20px;
	}
	
	table th{
		text-align: left;
		width: 100px;
	}
	button{
		background-color: #324001;
		margin-top: 10px;
		color: white;
		width: 230px;
		height: 30px;
	}
</style>
</head>
<body>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="banner_img">
			<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img2.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<h1 style="color: #0367a6;">마이페이지 수정</h1>
		<div class="userUpdate">
			<form id = "updateMemberForm" action="<%= request.getContextPath() %>/updateMemberForm.do" method="post">
				<input type="hidden" name="userId" value="<%= userId %>">
				<table>
					<tr>
						<th>아이디</th>
						<td><%= userId %></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="userName" id="userName" value="<%= userName %>"></td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td><input type="tel" name="userPhone" id="userPhone" value="<%= userPhone %>"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="userEmail" id="userEmail" value="<%= userEmail %>"></td>
					</tr>
				</table>
				<div class="updateBtn">
					<button type="submit">수정 완료</button>
					<br>
					<button type="button" onclick="history.go(-1)">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>