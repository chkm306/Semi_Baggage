<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.outer{
		width:70%;
		height:auto;
		margin-top: 40px;
		margin-left:auto;
		margin-right:auto;
		margin-bottom: 100px;
		text-align: center;
	}
	
	.loginbox{
		margin: auto;
	}
	
	.content{
		display: flex;
	}
	
	.loginImage{
		position: relative;
	}

	
	#img1{
		margin: 10px;
	}
	
	#loginForm{
		/* border:1px solid white; */
		width:500px;
		margin: auto;
		align: center;
	}
	
	#loginForm table{
		margin-top: 20px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.etc table{
		margin-top: 20px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#NMemberReservationForm{
		/* border:1px solid white; */
		width:500px;
		margin: auto;
		align: center;
	}
	
	#NMemberReservationForm{
		margin-top: 20px;
		text-align: center;
	}
	
	#loginBtn{
		width: 100px; height: 50px;
	}
	
	.etc a{
		text-decoration: none;
	}
	
	button{
		background-color: #324001;
		color: white;
	}
	
</style>
<script type="text/javascript">
	function findIdPopup() {
		/* 팝업창 가운데 띄우기*/
		var popupX = (document.body.offsetWidth / 2) - 200;
		var popupY = (window.screen.height / 2) - 150;
		/* 절대 경로로 설정해 줌 */
		window.open("${pageContext.request.contextPath}/views/member/findIdPopup.jsp", "findId", "width=400, height=300, left= "+ popupX + ", top=" + popupY);
	}
	
	function nmemberReserveCheck() {
		location.href="<%= request.getContextPath()%>/listReserve.do";
	}
	
	function findPwdPopup() {
		/* 팝업창 가운데 띄우기*/
		var popupX = (document.body.offsetWidth / 2) - 200;
		var popupY = (window.screen.height / 2) - 150;
		/* 절대 경로로 설정해 줌 */
		window.open("${pageContext.request.contextPath}/views/member/findPwdPopup.jsp", "findPwd", "width=400, height=300, left="+ popupX + ", top=" + popupY);
	}
	
	function nmemberReserveCheck() {
		location.href="<%= request.getContextPath()%>/listReserve.do";
	}
	
	function loginValidate(){
		if($("#userId").val().trim().length === 0) {
			alert("아이디를 입력하세요 ");
			$("#userId").focus();
			return false;
		}
		
		if($("#userPwd").val().trim().length === 0) {
			alert("비밀번호를 입력하세요 ");
			$("#userPwd").focus();
			return false;
		}
		return true;
	}
	function errorFind(){
		alert($("#userId").val().trim().length);
	}
	
</script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="banner_img">
		<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<div class="content">
			<!-- 이미지 
				<img id="img1" src="${pageContext.request.contextPath}/resources/images/loginImage.jpg" alt="img" width="40%">
			-->
			
			<!-- loginForm -->
			<div class="loginbox">
				<h1>로그인</h1>
				<div class="login">
					<form id="loginForm" action="<%=request.getContextPath()%>/loginMember.do" method="post" onsubmit="return loginValidate();">	
						<table>
							<tr>
								<td><input id="userId" type="text" name="userId" placeholder="아이디"></td>
								<td rowspan="2">
									<button type="submit" id="loginBtn">로그인</button>
								</td>				
							</tr>				
							<tr>
								<td><input id="userPwd" type="password" name="userPwd" placeholder="비밀번호"></td>
							</tr>
						</table>
					</form>				
				</div>
				<div class="etc">
					<!-- id, pw, 회원가입 -->
					<table style="text-align: center">
						<tr>
							<td width="33%"><a onclick="findIdPopup();">아이디 찾기</a></td>
							<td width="33%"><a onclick="findPwdPopup();">비밀번호 찾기</a></td>
							<!-- 위치 변경 시 링크 변경해야 됨 -->
							<td width="33%"><a href="${pageContext.request.contextPath}/views/member/selectMember.jsp">회원가입</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %> 
</html>