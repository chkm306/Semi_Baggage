<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	
	/* 메뉴영역 관련 스타일*/
	.navWrap>.nav{width:100%;margin:auto;}
	.menu{text-align:center;color:white;font-weight:bold;width:150px;height:50px;display:table-cell;font-size:20px;vertical-align:middle;}
	.menu:hover{color:rgb(12,101,166);}
	
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

</script>
<body>
	<br clear="both">
		<div class="navWrap">
			<div class="nav">
				<div class="menu" onclick="goMain();">로고들어갈자리</div>
				<div class="menu" onclick="goInfo();">이용안내</div>
				<div class="menu" onclick="goReserve();">예약하기</div>
				<div class="menu" onclick="goStorage();">보관소</div>
				<div class="menu" onclick="goBoard();">여행게시판</div>
				<div class="menu" onclick="goReview();">이용후기</div>
				<div class="menu" onclick="goNotice();">공지사항</div>
				<div class="menu" onclick="goFAQ();">FAQ</div>
				<div class="menu" onclick="goLogin();">로그인</div>
			</div>
		</div>
	<script>
			// 로고 - 메인 화면
		function goMain(){
			location.href="<%= request.getContextPath()%>";
		}
			// 이용안내
		function goInfo(){
			location.href="<%= request.getContextPath()%>/listInfo.do";
		}
			// 예약하기
		function goReserve(){
			location.href="<%= request.getContextPath()%>/listReserve.do";
		}
			// 보관소
		function goStorage(){
			location.href="<%=request.getContextPath()%>/listStorage.do";
		}
			// 여행 게시판
		function goBoard(){
			location.href="<%=request.getContextPath()%>/listBoard.do";
		}
			// 이용 후기
		function goReview(){
			location.href="<%=request.getContextPath()%>/listReview.do";
		}
			// 공지사항
		function goNotice(){
			location.href="<%=request.getContextPath()%>/listNotice.do";
		}
			// FAQ
		function goFAQ(){
			location.href="<%=request.getContextPath()%>/listFAQ.do";
		}
			// Login
		function goLogin(){
			location.href="<%=request.getContextPath()%>/listLogin.do";
		}		
		</script>
</body>
</html>