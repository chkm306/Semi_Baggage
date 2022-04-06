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
	    /* 밑줄 없애기 */
	    color: #0367a6;
	}
	
	/* 네비바 */
	.nav {
	    display: flex;
	    justify-content: space-evenly;
	    /* 사이를 균등하게, 양옆을 넒게 띄움 */
	    align-items: center;
	    height: 68px;
	    /* 박스를 일자로, 양옆은 균등하게, 가운데 정렬. 길이 지정 */
	
	    font-size: 22px;
	    background-color: white;
	    /* 폰트 스타일 */
	}
	
	/* 로고 */
	.nav_logo img{
	    padding: 0 20px;
	    width: 150px;
	    color: #000000;
	    font-size: 1rem;
	}
	
	/* 메뉴 텍스트바 */
	.nav_menu{
	    display: flex;
	    list-style: none;
	    padding-left: 0;
	    /* 일렬로, 동그라미없애고, 왼쪽 공간 없애기 */
	}
	
	/* 메뉴바 텍스트 */
	.nav_menu li{
	    display: inline-block;
	    padding: 15px;
	}
	/* 메뉴바 텍스트 링크 */
	.nav_menu li a{
	    /* background-color: #000000; */
	    padding: 20px;
	    /* 링크 크기를 버튼에 맞게 키우기 */
	    display: block;
	    /* 최대한으로 넓어짐. 꽉 채워짐 */
	}
	
	/* 메뉴바 내의 텍스트를 마우스오버 했을때 */
	.nav_menu li:hover a, :active, .nav_login a:hover{
	    color: #a2cdf2;
	}
	
	.nav_login{
	    /* padding-left: 0; */
	    /* padding-right: 40px; */
	    padding: 20px 30px;
	    width: 150px;
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