<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic:wght@700&display=swap');
	/* 주아폰트, 나눔고딕폰트 */
	
	*{
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	
	body{
	    font-family: jua, serif;
	}
		/* 링크 */
	a{
	    cursor:pointer;
	    text-decoration: none;
	    /* 밑줄 없애기 */
	}
	
	/* 푸터 css */
	
	footer{
	    font-family: 'Nanum Gothic', sans-serif;
	    background: rgb(242, 242, 242);
	    padding-top: 20px;
	    color: rgb(118, 113, 113);
	    margin: 0 auto;
	}
	
	.footer{
	    display: flex;
	    align-items: center;
	    flex-direction: column;
	    text-align: center;
	}
	
	/* 푸터 로고 */
	.footer h3{
	    font-family: 'Jua', sans-serif;
	    font-size: 2rem;
	    font-weight: 400;
	    margin-bottom: 20px;
	}
	
	/* 푸터 팀원 */
	.footer>p{
	    font-size: 16px;
	    margin-bottom: 20px;
	}
	
	/* 푸터 링크 */
	.footer a{
	    color: rgb(118, 113, 113);
	    font-size: 1rem;
	}
	.footer_menu>a:hover{
	    color: rgb(58, 58, 58);
	}
	
	/* 푸터 마지막 */
	.footer_bottom{
	    background-color: rgb(236, 236, 236);
	    width: 100vw;
	    padding: 20px 0;
	    text-align: center;
	}
	
	.main_slide input[id*="slide"] {
	    display: none;
	}
	
	.silde_area{
	    width: 100%;
	    margin: 0 auto;
	}
    </style>
</head>
<body>
    <footer>
        <div class="footer">

            <h3>BAGGAGE</h3>

            <div class="footer_menu">
                <a href="">이용약관</a> | 
                <a href="">개인정보취급방침</a>
            </div>
            <br>
            <p>최경민 신현지 송한우리 구승환</p>

        </div>

        <div class="footer_bottom">
            <p>©BAGGAGE. All rights reserved. designed by <span>최신공구</span>.</p>
        </div>
        
    </footer>
</body>
</html>