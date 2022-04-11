<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보관소 회원 가입</title>
<style>
	.outer{
		width:70%;
		height:auto;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
	}
	#enrollForm table{
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
	h2{
		text-align: center;
	}
	
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="banner_img">
		<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<h2>보관소 회원 가입</h2>
        <form id="enrollForm" action="" method="post" onsubmit="">
            <table>
                <tr>
                    <td colspan="2"><input type="text" name="storageName" placeholder="이름" required></td>
                </tr>
                <tr>
                    <td><input type="text" name="storageId" placeholder="아이디" required></td>
                    <td><button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button></td>
                </tr>
                <tr>
                    <td><input type="password" name="storagePwd" placeholder="비밀번호" required></td>
                </tr>
                <tr>
                    <td><input type="password" name="storagePwd" placeholder="비밀번호 확인" required></td>
                </tr>
                <tr>
                    <td><input type="tel" name="storagePhone" placeholder="휴대폰 번호" required></td>
                </tr>
            </table>
            <div class="enrollBtns" align="center">
                <button type="submit" id="joinBtn" disabled>가입하기</button>
                <button type="button" id="goMain" onclick="location.href='/'">메인으로</button>
            </div>
        </form>
    </div>
    <script>
    	function checkId(){
    		var storageId = $("#enrollForm input[name=storageId]");
    		if(storageId.val() == "") {
    			alert("아이디를 입력해 주세요")
    			return false;
    		}
    		
    		$.ajax({
    			url:"companyIdCheck.do",
    			type: "post",
    			data:{storageId:storageId.val()},
    			success: function(result){
    				if(result == "fail") {
    					alert("사용할 수 없는 아이디입니다");
    					storageId.focus();
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
    <%@ include file="../common/footer.jsp" %> 
</body>
</html>