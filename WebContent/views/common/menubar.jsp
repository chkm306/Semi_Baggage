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
	    /* 기본적으로 들어간 마진과 패딩을 없애겠다 */
	    box-sizing: border-box;
	    /* 박스의 사이즈는 컨텐츠박스가 아닌 테두리를 기준으로 하겠다. */
	}
	
	
	/* 메뉴바 기본 세팅2 */
	body{
	    font-family: jua, serif;
	    /* 주아 폰트 적용 */
	}
	
	/* 링크 */
	a{
	    cursor:pointer;
	    /* 커서를 올렸을때 포인터로 설정 */
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
        <div class="nav_logo" style="width:150px; height:33.08px">
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