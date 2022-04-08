<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<div style="text-align:center">
		<form class="findIdForm" action="<%=request.getContextPath() %>/findMemberId.do" method="post" onsubmit="return findMemberId();">
			<h2>아이디 찾기</h2>
			<input id="userName" type="text" name="userName" placeholder="이름 입력"><br>
			<input id="userPhone" type="text" name="userPhone" placeholder="휴대폰 번호 입력"><br>
			<button type="submit" id="findIdBtn" style="margin-top: 10px; margin-right: 10px;">확인</button>
			<input type="button" value="취소" onclick="closePopup()">
		</form>
	</div>
	<script>
		function closePopup() {
			self.close();
		}
	</script>

</body>
</html>