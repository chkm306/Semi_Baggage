<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	
	String msg = (String)session.getAttribute("msg");
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- <link rel="stylesheet" href="style.css"> -->
   <link href="${pageContext.request.contextPath}/resources/css/menubar.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/2bf1fadc44.js" crossorigin="anonymous"></script>
    <!-- 폰트어썸 -->

    <title>Document</title>
</head>
<body>
    <nav class="nav">
        <div class="nav_logo">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="백있지 로고" onclick="goMain()">
        </div>
        <ul class="nav_menu">
            <li><a target="_self" onclick="goInfo()">이용안내</a></li>
            <li><a target="_self" onclick="goReserve()">예약하기</a></li>
            <li><a target="_self" onclick="goStorage()">보관소</a></li>
            <li><a target="_self" onclick="goBoard()">게시판</a></li>
            <li><a target="_self" onclick="goReview()">이용후기</a></li>
            <li><a target="_self" onclick="goNotice()">공지사항</a></li>
            <li><a target="_self" onclick="goFAQ()">FAQ</a></li>
        </ul>
        
        <div class="nav_login"><a onclick="goLogin()">로그인</a></div>
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
		
		<!-- 화면이 작아지면 변하는 부분. 수정이 필요함. -->
        <div class="nav_toggle">
            <i class="fa-solid fa-bars" onclick="goMenubar()"></i>
        </div>
        <script>
            function goMenubar(){
                const toggle = document.querySelector('.nav_toggle');
                const menu = document.querySelector('.nav_menu');
                const login = document.querySelector('.nav_login');

                toggle.addEventListener('click',()=>{
                    menu.classList.toggle('active');
                    login.classList.toggle('active');
                });
            }
        </script>

    </nav>
</body>
</html>