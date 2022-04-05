<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* div{border:1px solid red;} */
	#footer {
		width: 80%;
		height: 200px;
		margin: auto;
		margin-top: 50px;
		background-color: rgb(242, 242, 242);
	}
	/* 푸터 로고 */
	#footer>div {
		width: 100%;
		padding-left: 10%;
	}
	/* 푸터 영역 1 */
	#footer-2 {
		height: 20%;
        text-align: center;
	}

	/* 푸터 영역 2 */
	#footer-3 {
		height: 80%;
        text-align: center;
	}

	/* 푸터 영역 1 텍스트 */
	#footer-2>a {
		text-decoration: none;
		font-weight: 600;
		margin: 10px;
		line-height: 40px;
		color: black;
        font-family: "NanumSqR";
	}
	
	#footer-3>p {
		margin: 0;
		padding: 10px;
		font-size: 13px;
        font-family: "NanumSqR";
	}
	
	#p2 {
		text-align: center;
	}
	
	@font-face {
		src: url("/resources/fonts/NanumSquareR.ttf");
		font-family: "NanumSqR";
	}
	
	#NanumSqR_font {
		font-family: "NanumSqR";
	}
</style>
</head>
<body>
	<div id="footer">
		<div id="footer-1">
            <img src="Logo_bk.png" alt="">
        </div>
	
        <div id="footer-2">
            <a href="#">이용약관</a> | 
            <a href="#">개인정보취급방침</a>
        </div>

        <div id="footer-3">
            <p id="p1">
                KH정보교육원 오후반 2팀 최신공구<br>
                최경민 신현지 송한우리 구승환<br>
            </p>
            <p id="p2">© BAGGAGE. All rights reserved.</p>     
        </div>
    </div>
</body>
</html>