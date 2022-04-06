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
	    /* 기본적으로 들어간 마진과 패딩을 없애겠다 */
	    box-sizing: border-box;
	    /* 박스의 사이즈는 컨텐츠박스가 아닌 테두리를 기준으로 하겠다. */
	}
	
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
	
	footer{
	    font-family: 'Nanum Gothic', sans-serif;
	    background: rgb(242, 242, 242);
	    /* height: 100vw; */
	    /* ? */
	    padding-top: 20px;
	    color: rgb(118, 113, 113);
	    margin: 0 auto;
	    /* color: rgb(64, 64, 64); */
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
	.footer a:hover{
	    color: rgb(58, 58, 58);
	}
	
	/* 푸터 마지막 */
	.footer_bottom{
	    background-color: rgb(236, 236, 236);
	    width: 100vw;
	    padding: 20px 0;
	    text-align: center;
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