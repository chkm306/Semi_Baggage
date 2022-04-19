<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.uni.board.model.dto.*, java.util.ArrayList"%>
    <%
    Board_Info b = (Board_Info)request.getAttribute("b");
	ArrayList<Board_content> bList = (ArrayList<Board_content>)request.getAttribute("bList");
	
    
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
        button{
            background-color: rgb(50, 65, 1);
            color: white;
            font-size: 15px
        }

    </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<img class="mainImg" alt="img" src="resources/images/boardMain.png">	
	
	<div class="outer">
	
			<br>
			<br>
	        <h1 align="center">게시판</h1>
	        <br>
	        <br>
	        <br>
	
	            <table>
	                <tr>
	                    <th id="title" colspan="2" align="left"><%=b.getB_Title()%></th>
	                </tr>
	                <tr>
	                    <th align="left"><%=b.getT_Date()%></th>
	                    <th align="right">조회수 : <%=b.getT_Count()%></th>
	                </tr>
	            </table>
	        <br>
	        <hr>
	        <br>
	            <%for(Board_content c : bList){ %>
	            	<div class="content" align="center" style="width:100%">
	            		<img src="<%=contextPath%>/resources/board_Uploard/<%=c.getB_Change()%>" style="width: 100%"><br>
	            		<h4><%=c.getB_Contents() %></h4>
	            	</div>
	            <%} %>
	            
	        
	        <br>
	        <hr>
	        <br>
	        
            <div align="center">
	            <button class="btn" onclick="goList()">목록으로</button>
                
                <%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
	            
	            	<button onclick="goUpdate()">수정하기</button>
	            	<button onclick="goDelete()">삭제하기</button>
	            	<%} %>
	   		 </div>
	   		 
	   		 <br>
	   		 <br>
	    
	    
	    <script>
	    	function goList(){
	            location.href = "<%=contextPath%>/listBoard.do";
	    	}
	    	function goUpdate(){
	            location.href = "<%=contextPath%>/updateFormBoardform.do?b_no=<%=b.getB_No()%>";
	    	}
	    	function goDelete(){
	            location.href = "<%=contextPath%>/deleteBoard.do?b_no=<%=b.getB_No()%>";
	    	}
	    </script>
	    
	    <%@ include file="../common/footer.jsp" %> 
</body>
</html>