<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
	        float: center;
	        width: 70%;
	        margin: auto;
        }
        .mainImg{
            width: 100%;
            height: 30%;
        }
        #thumbnail{
            width: 100%;
        }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<img class="mainImg" alt="img" src="resources/images/boardMain.png">

    <div class="outer">
    <br>

        <h2 align="center">게시판</h2>
        
        <br>

        <table>
            <tr>
                <th><img id="thumbnail" src="resources/images/board/colummImg.jpg"><div id="text">여행칼럼</div></th>
                <th><img id="thumbnail" src="resources/images/board/tipImg.jpg"><div id="text">여행Tip</div></th>
            </tr>
        </table>
            
    </div>
</body>
</html>