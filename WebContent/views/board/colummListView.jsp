<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.board.model.dto.*, java.util.ArrayList"%>

<%
	//ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	Board b = new Board(1, "title", "category", "content", "2012-02-03", 1);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baggage</title>

</head>
<style>
    .outer{
        float: center;
        width: 80%;
        margin: auto;
    }
    .mainImg{
        width: 100%;
        height: 30%;
        margin: 0%;
        padding: 0%;
    }
    .test-wrap {
        width: 30%;
        margin: 10px auto;
        position: relative;
    }
    .test-wrap img {
        width: 100%;
        height: 200px;
        vertical-align: middle;
    }
    .text {
        width: 100%;
        height: 30%;
        /*padding: 10px 20px;*/
        /*border-radius: 10px;*/
        background-color: rgba(13, 101, 166, 0.8);
        color: white;
        /*text-align: left;*/
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, 65%);
    }
    .text1{
           margin: 2%;
    }
   
</style>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<img class="mainImg" alt="img" src="resources/images/boardMain.png">	
	
	    <div class="outer">
	    <br>
	    
	        <h2 align="center">여행 칼럼</h2>
	
	        <br>
	        
        <div class="test-wrap">
        	<div class="text">

           		<h2><%=b.getbTitle() %></h2>
            	<h4><%=b.getbDate() %></h4>
        	</div>
        	<div class="test-img"><img src="resources/images/board/colummImg.jpg">
        	</div>
    	</div>
    
    
	    </div>
	<%@ include file="../common/footer.jsp" %> 	    
</body>
</html>