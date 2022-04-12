<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.outer{
		background:black;
		width: 920px;
		height:auto;
		margin-left:auto;
		margin-right:auto;
		margin-top: 40px;
		color:white;
	}
	.wrapper{
		position: relative;
		margin: 0;
		width: 960px;
	}
	
	.joinGroup{
		text-align: center;
		width: 920px;
	}
	
	.joinGroup .member-item{
		width: 438px;
		height: 490px;
		float: left; 
		position: relative;
	}
	
	.joinGroup .member-item:last-child{
		margin-left: 40px;
		
	}
</style>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="banner_img">
		<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<div class="wrapper">
			<div class="joinGroup">
				<div class="member-item">
					<div class="personalMember" >
						<img alt="개인회원가입" onclick="location.href='memberEnrollForm.jsp'" src="${pageContext.request.contextPath}/resources/images/member_img.png">
						<!--  <button type="button" id="memEnroll" onclick="location.href='memberEnrollForm.jsp'">개인회원가입</button>-->
					</div>
				</div>
				<div class="member-item">
					<div class="companyMember">
						<img alt="기업회원가입" onclick="location.href='companyEnrollForm.jsp'" src="${pageContext.request.contextPath}/resources/images/company_member.png">
						<!--<button type="button" id="comEnroll" onclick="location.href='companyEnrollForm.jsp'">기업회원가입</button>-->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>