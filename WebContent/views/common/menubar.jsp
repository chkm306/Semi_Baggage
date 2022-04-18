<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="com.uni.member.model.dto.Member"%>
<%
	String msg = (String)session.getAttribute("msg");
//20220406 login을 위한 객체 생성 
	Member loginUser = (Member)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/2bf1fadc44.js" crossorigin="anonymous"></script>
<!-- 폰트어썸 -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic:wght@700&display=swap');
/* 주아폰트, 나눔고딕폰트 */

/* 전체 세팅 */
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 메뉴바 기본 세팅2 */
body{
    font-family: jua, serif;
}

/* 링크 */
a{
    cursor:pointer;
    text-decoration: none;
}

.nav{
	display: flex;
	line-height: 1;
	font-size: 22px;
	height: 68px;
	
	justify-content: space-evenly;
	align-items: center;
}

.nav_logo img{
    padding: 0 20px;
    width: 150px;
    cursor: pointer;
    color: #000000;
    font-size: 1rem;
}

.nav_menu{
   	list-style: none;
   	padding : 0;
   	margin : 0;
}

.nav_menu li{
	display: inline-block;
	padding: 15px;
}

.nav_toggle{
    display: none;
    position: absolute;
    right: 30px;
    padding-top: 10px;
    font-size: 25px;
    color: #0367a6;
}

.nav_logout{
	display: flex;
}
.nav_logout li{
	padding: 8px;
	list-style: none;
	display: flex;
}
.nav_logout a{
	color: #000000;
}
.nav_menu>li:hover{
    color: #A2CDF2;
}
</style>
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<!-- 20220417 메세지 뿌려주는 스크립트 추가 { -->
<script type="text/javascript">
	$(function(){
		let msg = "<%= msg %>";
		if(msg !="null"){ 
			alert(msg);
			<%session.removeAttribute("msg");%>
		}
	});
</script>
<!-- } 20220417 메세지 뿌려주는 스크립트 추가 끝 -->
    <nav class="nav">
        <div class="nav_logo" style="width:150px; height:33.08px">
             <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="백있지 로고" onclick="goMain()"> 
        </div>
        <ul class="nav_menu" style="color: #0367a6;">
            <li><a target="_self" onclick="goReserve()">예약하기</a></li>
            <li><a target="_self" onclick="goStorage()">보관소</a></li>
            <li><a target="_self" onclick="goBoard()">게시판</a></li>
            <li><a target="_self" onclick="goNotice()">공지사항</a></li>
            <li><a target="_self" onclick="goFAQ()">FAQ</a></li>
        </ul>
        
        <!-- 20220406 login 유무에 따른 list 변경 -->
        	<%if(loginUser == null) {%>
       		<div class="nav_login">
        		<a onclick="goLogin()">로그인</a>
       		</div>
       		<%} else { %>
       		<div class="nav_logout">
       			<li><a onclick="goMyPage()">마이페이지</a></li>
            	<li><a onclick="goLogout()">로그아웃</a></li>
   			</div>
       		<%} %>
       		<!-- 20220406 login 유무에 따른 list 변경 끝 -->
        <script>
                // 로고 - 메인 화면
            function goMain(){
                location.href="<%= request.getContextPath()%>";
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
	        	// goMyPage(), goLogout() 추가
	        	// 마이페이지
	        function goMyPage(){
	            location.href="<%=request.getContextPath()%>/listMyPage.do";
	        }
	        
	        function goLogout(){
	            location.href="<%=request.getContextPath()%>/logoutMember.do";
	        }
		</script>
    </nav>
</body>
</html>