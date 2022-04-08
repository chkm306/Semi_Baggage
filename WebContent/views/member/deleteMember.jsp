<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.uni.member.model.dto.Member"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	String originPwd = (String)session.getAttribute("originPwd");
	String userName = m.getUserName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style>
	.outer{
		margin-top: 40px;
	    width: 100%;
	    height: 100%;
	    text-align: center;
	}
	button{
	    background-color: #324001;
	    margin-top: 10px;
		color: white;
	    width: 230px;
	    height: 30px;
	}
	input{
		margin-bottom: 10px;
		width: 230px;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="banner_img">
		<img id="banner_img"
			src="${pageContext.request.contextPath}/resources/images/banner_img2.jpg"
			alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<form id="deleteMemberForm" action="<%=request.getContextPath()%>/deleteMember.do" method="post">
			<%= userName %> 님, 탈퇴 확인을 위해 비밀번호를 재입력해 주십시오. <br><br> 
			<input type="password" name="userPwd" placeholder="비밀번호 입력">
		</form>
		<div class="deleteBtns">
			<button type="button" id="deleteChkBtn" onclick="deleteChk()">확인</button>
			<br>
			<button type="button" onclick="history.go(-1)">취소</button>
		</div>
		<script>
			function deleteChk() {
				var userPwd = $("input[name='userPwd']");

				if (userPwd.val() != originPwd) {
					alert("비밀번호가 다릅니다")
					userPwd.val('');
					checkPwd.focus();
					return false;
				} else {
					$("#deleteMemberForm").submit();
				}

			}
		</script>
	</div>
</body>
</html>