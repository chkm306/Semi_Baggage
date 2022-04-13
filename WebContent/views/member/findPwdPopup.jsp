<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	button{
		background-color: #324001;
		color: white;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
		function closePopup() {
			self.close();
		}
		function findMemberId() {
			if($("#userId").val().trim().length === 0) {
				alert("아이디를 입력해 주세요");
				#("#userId").focus();
				return false;
			}
			
			if($("#userPhone").val().trim().length === 0) {
				alert("번호를 입력해 주세요");
				#("#userPhone").focus();
				return false;
			}
		}
</script>
</head>
<body>
	<div style="text-align:center">
		<form class="findPwd" action="<%=request.getContextPath() %>/findMemberPwd.do" method="post" onsubmit="return findMemberPwd();">
			<h2>비밀번호 찾기</h2>
			<input id="userId" type="text" name="userId" placeholder="아이디 입력"><br>
			<input id="userPhone" type="text" name="userPhone" placeholder="휴대폰 번호 입력"><br>
			<button type="submit" id="findIdBtn" style="margin-top: 10px; margin-right: 10px;">확인</button>
			<button type="button" id="backBtn" onclick="closePopup()">취소</button>
		</form>
	</div>
	<script>
		function closePopup() {
			self.close();
		}
	</script>
</body>
</html>