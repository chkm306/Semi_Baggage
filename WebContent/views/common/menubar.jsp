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
	.nav_menu>li>a{
		color: #0367a6;
	}
	
	/* 네비바 */
	.nav {
	    display: flex;
	    justify-content: space-evenly;
	    align-items: center;
	    height: 68px;
	    
	    font-size: 22px;
	    background-color: white;
	    flex-wrap: nowrap;
	}
	
	/* 로고 */
	.nav_logo img{
	    padding: 0 20px;
	    width: 150px;
	    color: #000000;
	    font-size: 1rem;
	    cursor: pointer;
	}
	
	/* 메뉴 텍스트바 */
	.nav_menu{
	    display: flex;
	    list-style: none;
	    padding-left: 0;
	}
	
	/* 메뉴바 텍스트 */
	.nav_menu li{
	    display: inline-block;
	    /* padding: 15px; */
	}

	/* 메뉴바 텍스트 링크 */
	.nav_menu li a{
	    padding: 20px;
	    display: block;
	    padding-top: 40px;
	
	}
	
	.nav_menu>li:hover,.nav_login>a:hover{
	    color: #a2cdf2;
	}
	
	.nav_login{
	    padding: 0px 30px;
	    text-align: right;
	}
	.nav_login a{
	    color: #000000;
	}
	
	.nav_toggle{
	    display: none;
	    position: absolute;
	    right: 30px;
	    padding-top: 10px;
	    font-size: 25px;
	    color: #0367a6;
	}

	
	/*@media screen and (max-width:1100px) {
	    .nav_logo{
	        align-items: center;
	    }
	    .nav{
	        flex-direction: column;
	        align-items: flex-start;
	         padding: 8px 24px; xxxxxxxxxx
	    }
	
	    .nav_menu{
	        display: none;
	        flex-direction: column;
	        align-items: center;
	        width: 100%;
	    }
	    .nav_menu li{
	        padding: 8px 24px;
	        text-align: center;
	        width: 100%;
	    }
	    .nav_login{
	        display: none;
	         justify-content: center; xxxxxxxxxx
	        text-align: center;
	        width: 100%;
	    }
	    .nav_toggle{
	        display: block;
	    }
	    .nav_menu:active,
	    .nav_login:active{
	        display: flex;
	    }
	}*/

	</style>
    <title>Document</title>
</head>
<body>
    <nav class="nav">
        <div class="nav_logo">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="백있지 로고" onclick="goMain()">
        </div>
        <ul class="nav_menu" style="color: #0367a6;">
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