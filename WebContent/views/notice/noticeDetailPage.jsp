<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.notice.model.dto.*, java.util.ArrayList"%>

<%
	//ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList"); 
	Notice b = (Notice)request.getAttribute("notice");
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
	
	<img class="mainImg" alt="img" src="resources/images/noticeMain.jpg">
	
	<div class="outer">
	
			<br>
        <h1 align="center">공지사항</h1>     
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
	        <br>
	        <hr>
	        <br>
	            <h4><%=b.getbContent() %></h4>
	            
	        
	        <br>
	        <hr>
	        <br>
	        
            <div align="center">
	            <button onclick="goList()">목록으로</button>
                
                <%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
	            
	            	<button onclick="goUpdate()">수정하기</button>
	            	<button onclick="goDelete()">삭제하기</button>
	            	<%} %>
	   		 </div>
	   		 
	   		 <br>
	   		 <br>
	    
	    
	    <script>
	    	function goList(){
	            location.href = "<%=contextPath%>/listNotice.do";
	    	}
	    	function goUpdate(){
	            location.href = "<%=contextPath%>/updateFormNotice.do?bno=<%=b.getbNo()%>";
	    	}
	    	function goDelete(){
	            location.href = "<%=contextPath%>/deleteNotice.do?bno=<%=b.getbNo()%>";
	            console.log(bno);
	    	}
	    </script>
	    
	    <%@ include file="../common/footer.jsp" %> 
</body>
</html>