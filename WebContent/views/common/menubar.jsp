<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	
	String msg = (String)session.getAttribute("msg");
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	body{
		background:url('<%=request.getContextPath() %>/resources/images/main.jpg') no-repeat; 
		background-size:cover;
	}
	/* 로그인 폼 관련 스타일*/
	#loginForm, #userInfo{float:right;}
	.btns button{border-radius:5px;}
	#enrollBtn, #mypageBtn{background-color:yellowgreen;}
	#loginBtn, #logoutBtn{background-color:orangered;}
	#userInfo a{text-decoration:none;color:white;}
	
	/* 메뉴영역 관련 스타일*/
	.navWrap{background-color:black; width:100%; height:50px}
	.navWrap>.nav{width:600px;margin:auto;}
	.menu{text-align:center;color:white;font-weight:bold;width:150px;height:50px;display:table-cell;font-size:20px;vertical-align:middle;}
	.menu:hover{background-color:darkgray;}
	
</style>
</head>
<script type="text/javascript">
	
	$(function(){
		let msg = "<%=msg%>";
		if(msg !="null"){ 
			alert(msg);
			<%session.removeAttribute("msg");%>
		}
	});

	function loginValidate(){
		// 아이디와 비밀번호가 제대로 입력이 되었는지 확인하는 함수
		if($("#userId").val().trim().length === 0 ){
			alert("아이디를 입력하세요 ");
			$("#userId").focus(); // 포커스
			return false;
		}
		
		if($("#userPwd").val().trim().length === 0 ){
			alert("비밀번호를 입력하세요 ");
			$("#userPwd").focus(); // 포커스
			return false;
		}
		return true;
	}
</script>
<body>
	<h1 align = "center" style="color:white;">Welcome JSP World!</h1>
	<div class="loginArea">
	
	<form id = "loginForm" action="<%=request.getContextPath()%>/loginMember.do" method="post" onsubmit="return loginValidate();">
			<table>
				<tr>
					<th><label for = "userId" style="color:white;">아이디</label></th>
					<td><input id="userId" type="text" name="userId"></td>
				</tr>
				<tr>
					<th><label for = "userPwd" style="color:white;">비밀번호</label></th>
					<td><input id="userPwd" type="text" name="userPwd"></td>
				</tr>
			</table>
			<div class ="btns" align="center">
				
				<button id = "loginBtn" type="submit">로그인</button>
			    <button id = "enrollBtn" type="button" onclick="enrollPage();">회원가입</button>
			</div>
		</form>
	
	<br clear="both">
		
		<div class="navWrap">
			<div class="nav">
				<div class="menu" onclick="goMain();">HOME</div>
				<div class="menu" onclick="goNotice();">공지사항</div>
				<div class="menu" onclick="goBoard();">게시판</div>
				<div class="menu" onclick="goThumbnail();">사진게시판</div>
				
			</div>
		</div>
	<script>
			// 메인 페이지
		function goMain(){
			location.href="<%= request.getContextPath()%>";
		}
			// 공지사항
		function goNotice(){
			location.href="<%= request.getContextPath()%>/listNotice.do";
		}
			// 게시판
		function goBoard(){
			location.href="<%= request.getContextPath()%>/listBoard.do";
		}
		function goThumbnail(){
			location.href="<%=request.getContextPath()%>/listThumb.do";
		}
		</script>
</body>
</html>