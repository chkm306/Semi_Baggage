<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userId = (String)request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 {
		text-align: center;
	}
	
	#updatePwdForm table{
		text-align: right;
		margin-left: auto;
		margin-right: auto;
	}
	button{
		background-color: #324001;
		margin-top: 10px;
		color: white;
		width: 230px;
		height: 30px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<h2>비밀번호 재설정</h2>
	<form id="updatePwdForm" action="<%= request.getContextPath() %>/updatePwdMember.do" method="post">
		<input type="hidden" name="userId" value="<%= userId%>">
		<table>
			<tr>
				<td><label>새 비밀번호</label></td>
				<td><input type="password" name="newPwd"></td>
			</tr>
			<tr>
				<td><label>비밀번호 확인</label></td>
				<td><input type="password" name="checkPwd"></td>
			</tr>
		</table>
		
		<br>
		
		<div class="btns" align="center">
			<button  type="button" onclick="fnCheckPwd()">변경하기</button>
		</div>
	</form>
	<script>
		function fnCheckPwd(){
			var userPwd = $("#userPwd");
			var newPwd = $("input[name='newPwd']");
			var checkPwd = $("input[name='checkPwd']");
			
			if(userPwd.val().trim() === "" || newPwd.val().trim() === "" || checkPwd.val().trim() === ""){
				alert("비밀번호를 입력하세요")
				return false;
			}
			
			if(newPwd.val() != checkPwd.val()){
				alert("비밀번호 확인이 다릅니다.")
				checkPwd.val('');
				checkPwd.focus();
				return false;
				
			}
			
			$("#updatePwdForm").submit();
		}
	</script>
</body>
</html>