<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic:wght@700&display=swap');
	/* 주아폰트, 나눔고딕폰트 */
	button{
		background-color: #324001;
		color: white;
	}
</style>
<script>
		function closePopup() {
			self.close();
		}
		function findMemberId() {
			if($("#userName").val().trim().length === 0) {
				alert("이름을 입력해 주세요");
				#("#username").focus();
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
		<form class="findIdForm" action="<%=request.getContextPath() %>/findMemberId.do" method="post" onsubmit="return findMemberId();">
			<h2>아이디 찾기</h2>
			<input id="userName" type="text" name="userName" placeholder="이름 입력"><br>
			<input id="userPhone" type="text" name="userPhone" placeholder="휴대폰 번호 입력"><br>
			<button type="submit" id="findIdBtn" style="margin-top: 10px; margin-right: 10px;">확인</button>
			<button type="button" id="backBtn" onclick="closePopup()">취소</button>
		</form>
	</div>
	

</body>
</html>