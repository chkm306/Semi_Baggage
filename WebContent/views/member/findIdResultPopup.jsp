<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.member.model.dto.Member"%>
<%
	String userId = (String)request.getAttribute("userId");
	String userName = (String)request.getAttribute("userName");
	String idCode = userId.substring(0, 3) + "***";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	button{
		background-color: #324001;
		color: white;
		margin-top: 10px; 
	}
	.wrapper{
		display: flex;
		align-items: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
		function closePopup() {
			self.close();
		}
</script>
</head>
<body>
	<div class="wrapper">
		<div class="idResult" style="text-align:center">
			<form id = "findIdResultForm" action="<%=request.getContextPath()%>/updatePwdMemberPage.do" method="post">
				<input type="hidden" name="userId" value="<%= userId%>">
				<%= userName %> 님이 가입한 아이디는 <%= idCode%>입니다.
				<button type="submit" id="findPwdBtn" style="margin-right: 10px;">비밀번호 재설정</button>
				<br>
				<button type="button" id="backBtn" onclick="closePopup()">로그인 화면으로 이동</button>
			</form>
		</div>
		
	</div>
</body>
</html>