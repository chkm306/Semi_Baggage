<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.board.model.dto.*, java.util.ArrayList"%>

<%
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	//Board b = new Board(1, "title", "category", "content", "2012-02-03", 1); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        thead{
            background-color: rgb(13, 101, 166);
            border: 0px;
            color: white;
            text-align: center;
            
        }
        tbody{
            text-align: center;
        }
        #search{
        	width : 60%
        }
        button{
            background-color: rgb(50, 65, 1);
            color: white;
        }
       	table{
            width: 100%;
            border-top: 1px solid rgb(13, 101, 166);
            border-collapse: collapse;
       	}
        tr, td{
            border-bottom: 1px solid darkgray;
            padding: 10px;
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
        
		<form class="seach" align="center">
			<input type="search" id="search" placeholder="검색어를 입력하세요.">
			<button type="submit">검색하기</button>
		</form>
		
		<br>
		
		<table class="listArea">
		<thead>
			<tr>
			
				<td width="70%" colspan="2">제목</td>
				<td width="30%">작성일</td>
			</tr> 
		</thead>
		<tbody>
		<%if(bList.isEmpty()){ %>
			<td>등록된 공지사항이 없습니다.</td>
		<%} else {%> 
			<%for(Board b : bList){ %>
				<td><%=b.getbNo()%></td>
				<td><%=b.getbTitle()%></td>
				<td><%=b.getbDate()%></td>
			<%} %>
		<%} %>
			
		</tbody> 
        </table>

        <br><br>

        <div class="pagingArea" align="center">
            <button onclick="">&lt;&lt;</button>
            <button onclick="">&gt;&gt;</button>
        </div>
        	
        
        
    </div>
    
    <script>
    $(function(){
        $(".listArea>tbody>tr").click(function(){
           var bno = $(this).children().eq(0).text();
           location.href = "<%=contextPath%>/detailNotice.do?bno="+bno;
        })
     })    </script>

    <%@ include file="../common/footer.jsp" %> 
</body>
</html>