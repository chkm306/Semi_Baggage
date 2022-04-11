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
		width:70%;
		height:auto;
		margin-left:auto;
		margin-right:auto;
		margin-top: 50px ;
		color:white;
	}
	.wrapper{
		position: relative;
		margin: 0;
		width: 900px;
	}
	
	.joinGroup{
		text-align: center;
		width: 900px;
		height: 490px; /* 삭제 시 footer 겹침 */
	}
	
	.joinGroup .member-item{
		border: 1px solid gray;
		width: 430px;
		height: 490px;
		float: left; 
		position: relative;
	}
	
	.joinGroup .member-item:last-child{
		margin-left: 40px;
		
	}
	
	.member-item button {
		width: 280px;
		height: 52px;
		background-color: black;
		color: white;
		font-size: 20px;
		position: absolute;
		bottom: 20px;
		left: 79px;
	}
</style>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="outer">
		<div class="wrapper">
			<div class="joinGroup">
				<div class="member-item">
					<div class="personalMember">
						<button type="button" id="memEnroll" onclick="location.href='memberEnrollForm.jsp'">개인회원가입</button>
					</div>
				</div>
				<div class="member-item">
					<div class="companyMember">
						<button type="button" id="comEnroll" onclick="location.href='companyEnrollForm.jsp'">기업회원가입</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %> 
</body>
</html>