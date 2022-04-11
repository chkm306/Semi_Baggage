<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원 가입</title>
<style>
	.outer{
		width:70%;
		height:auto;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
		text-align: center;
	}
	#enrollForm table{
		margin-left: auto;
		margin-right: auto;
		text-align: left;
	}
	.enrollBtns{
		margin-left: auto;
		margin-right: auto;
	}
	.enrollBtns button {
		margin-top: 10px;
		margin-bottom: 20px;
	}
	h2{
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
        <form id="enrollForm" action="" method="post" onsubmit="">
            <table>
                <tr>
                    <td><input type="text" name="userName" placeholder="이름" style="width: 250px;" required></td>
                </tr>
                <tr>
                    <td><input type="text" name="userId" placeholder="아이디" style="width: 150px;" required>
                    <button type="button" id="idCheckBtn" onclick="checkId();" style="width: 95px;">중복확인</button></td>
                </tr>
                <tr>
                    <td><input type="password" name="userPwd" placeholder="비밀번호" style="width: 250px;" required></td>
                </tr>
                <tr>
                    <td><input type="password" name="userPwd" placeholder="비밀번호 확인" style="width: 250px;" required></td>
                </tr>
                <tr>
                    <td><input type="tel" name="userPhone" placeholder="휴대폰 번호" style="width: 250px;" required></td>
                </tr>
                <tr>
                    <td><input type="email" name="userEmail" placeholder="이메일" style="width: 250px;" required></td>
                </tr>
            </table>
            <div class="enrollBtns" align="center">
                <button type="submit" id="joinBtn" disabled>가입하기</button>
                <button type="button" id="goLogin" onclick="location.href='/'">메인으로</button>
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
	    			url:"userIdCheck.do",
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
	    						storageId.focus();
	    					}
	    				}
	    			},
	    			error: function(){
	    				console.log("서버 통신 실패")
	    			}
	    		})
	    	}
    	</script>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>