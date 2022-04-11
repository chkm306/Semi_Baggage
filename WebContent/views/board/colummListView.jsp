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
    #thumbnail{
        width: 300px;
        height: 200px;
        display: inline-block;
        margin-left: 25px;
    }
    #bar{
        position: absolute;
        width: 300px;
        height: 80px;
        background-color: rgba(13, 101, 166, 0.4);
        color: white;
        margin-top: 120px;
        
    }
    .title{
        margin-left: 10px;
        margin-top: 5px;
        font-size: 23px;
    }
    .date{
        margin-left: 10px;
        margin-top: 10px;
        font-size: 15px;
    }
   
</style>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<img class="mainImg" alt="img" src="resources/images/boardMain.png">	
	
	    <div class="outer">
	    <br>
	    
	        <h2 align="center">여행 칼럼</h2>
	
	        <br>
	        <div class="listArea">
	            <div id="thumbnail">
	            	<img src="/resources/images/boardMain.png">
	                <div id="bar">
	                    <div class="title"><%=b.getbTitle() %></div>
	                    <div class="date"><%=b.getbDate() %></div>
	                </div>
	            </div>
	            <div id="thumbnail">
	                <div id="bar">
	                    <div class="title"><%=b.getbTitle() %></div>
	                    <div class="date"><%=b.getbDate() %></div>
	                </div>
	            </div><div id="thumbnail">
	                <div id="bar">
	                    <div class="title"><%=b.getbTitle() %></div>
	                    <div class="date"><%=b.getbDate() %></div>
	                </div>
	            </div><div id="thumbnail">
	                <div id="bar">
	                    <div class="title"><%=b.getbTitle() %></div>
	                    <div class="date"><%=b.getbDate() %></div>
	                </div>
	            </div>
	        </div>
	    </div>
	<%@ include file="../common/footer.jsp" %> 	    
</body>
</html>