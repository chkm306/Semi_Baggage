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
<title>Baggage</title>

    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

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
        table{
            width: 100%;
        }
        #title{
            color:  rgb(13, 101, 166);
            font-size: 40px;
        }
        button {
            background-color: rgb(50, 65, 1);
            color: white;
		}
    </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<img class="mainImg" alt="img" src="resources/images/noticeMain.jpg">
	
	<div class="outer">
	
			<br>
	        <h2 align="center">공지사항</h2>
	        <br>
	        <br>
	        <br>
	
	            <table>
	                <tr>
	                    <th id="title" colspan="2" align="left"><%=b.getbTitle() %></th>
	                </tr>
	                <tr>
	                    <th align="left"><%=b.getbDate() %></th>
	                    <th align="right">조회수 : <%=b.getbCount() %></th>
	                </tr>
	            </table>
	        <hr>
	            <h4><%=b.getbContent() %></h4>
	            <div class="pagingArea" align="center">
	            <button onclick="goList()">목록으로</button>
	            </div>
	
	        
	    </div>
	    
	    <script>
	    	function goList(){
	            location.href = "<%=contextPath%>/listNotice.do";
	    	}
	    </script>
	    
	    <%@ include file="../common/footer.jsp" %> 
</body>
</html>