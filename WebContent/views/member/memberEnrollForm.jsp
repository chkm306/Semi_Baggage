<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원 가입</title>
<style>
	.outer{
		background-color: white;
		width:70%;
		height:auto;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
		margin-bottom: 100px;
		color:black;
	}
	#enrollForm table{
		margin-top: 20px;
		margin-left: auto;
		margin-right: auto;
	}
	.enrollBtns{
		margin-left: auto;
		margin-right: auto;
	}
	.enrollBtns button {
		margin-top: 10px;
		margin-bottom: 20px;
	}
	h1{
		text-align: center;
	}
	button{
		background-color: #324001;
		color: white;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="banner_img">
		<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<h1>일반 회원 가입</h1>
        <form id="enrollForm" action="<%=request.getContextPath()%>/insertMember.do" method="post" onsubmit="return joinValidate();">
        	<input type="hidden" name="userType" value="1">
            <table>
                <tr>
                    <td><input type="text" name="userName" placeholder="이름" required></td>
                </tr>
                <tr>
                    <td><input type="text" name="userId" placeholder="아이디" required>
                    <button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button></td>
                </tr>
                <tr>
                    <td><input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" required></td>
                </tr>
                <tr>
                    <td><input type="password" id="checkPwd" name="userPwd" placeholder="비밀번호 확인" required></td>
                </tr>
                <tr>
                    <td><input type="tel" name="userPhone" placeholder="휴대폰 번호" required></td>
                </tr>
                <tr>
                    <td><input type="email" name="userEmail" placeholder="이메일" required></td>
                </tr>
            </table>
            <div class="enrollBtns" align="center">
                <button type="submit" id="joinBtn" disabled>가입하기</button>
                <button type="button" id="goLogin" onclick="location.href='<%=request.getContextPath() %>/'">메인으로</button>
            </div>
        </form>
        <script>
	    	function checkId(){
	    		var userId = $("#enrollForm input[name=userId]");
	    		if(userId.val() == "") {
	    			alert("아이디를 입력해 주세요")
	    			return false;
	    		}
	    		
	    		$.ajax({
	    			url:"<%= request.getContextPath()%>/userIdCheck.do",
	    			type: "post",
	    			data:{userId:userId.val()},
	    			success: function(result){
	    				if(result == "fail") {
	    					alert("사용할 수 없는 아이디입니다");
	    					userId.focus();
	    				} else {
	    					if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")) {
	    						$("#joinBtn").removeAttr("disabled");
	    					} else {
	    						userId.focus();
	    					}
	    				}
	    			},
	    			error: function(){
	    				console.log("서버 통신 실패")
	    			}
	    		})
	    	}
	    	
	    	function joinValidate() {
	    		var userPwd = $("#userPwd");
	    		var checkPwd = $("#checkPwd");
	    		
	    		if(userPwd.val().trim() !== checkPwd.val().trim()) {
	    			alert("비밀번호가 다릅니다")
	    			return false;
	    		}
	    		return true;
	    	}
    	</script>
    </div>
    <%@ include file="../common/footer.jsp" %> 
</body>
</html>