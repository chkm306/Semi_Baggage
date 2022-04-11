<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Baggage</title>
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
        .board_wrap {
            margin: 0px auto;
            position: relative;
        }
        .board_wrap img {
            width: 100%;
            vertical-align: middle;
        }
        .title {
            position: absolute;
            top: 0px;
            width: 100%;
            height: 100%;
        }
        .title-table {
            display: table;
            width: 100%;
            height: 100%;
        }
        .title-table-row {
            display: table-row;
        }
        .title-table-cell {
            display: table-cell;
            vertical-align: middle;
        }
        .title p {
            margin: 0px 40px;
            color: white;
            padding: 10px;
            text-align: center;
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
                <th>
                <div class="board_wrap" onclick="goColumm()">
    			<div id="thumbnail" ><img src="resources/images/board/colummImg.jpg"></div>
		        <div class="title">
		            <div class="title-table">
		                <div class="title-table-row">
		                    <div class="title-table-cell">
		                        <p>여행칼럼</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    </th>
		    <th>
		    <div class="board_wrap" onclick="goTip()">
                <div id="thumbnail" ><img src="resources/images/board/tipImg.jpg"></div>
		        <div class="title">
		            <div class="title-table">
		                <div class="title-table-row">
		                    <div class="title-table-cell">
		                        <p>여행 Tip</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    </th>
            </tr>
        </table>
            
    </div>
    <script>
        function goColumm(){
            location.href="<%=request.getContextPath()%>/colummList.do";
        }
        function goTip(){
            location.href="<%=request.getContextPath()%>/tipList.do";
        }
    </script>
   	<%@ include file="../common/footer.jsp" %> 
    
</body>
</html>