<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.board.model.dto.*, java.util.ArrayList"%>

<%
	//ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	Board b = new Board(1, "title", "category", "content", "2012-02-03", 1);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<img class="mainImg" alt="img" src="resources/images/noticeMain.jpg">
	
    <div class="outer">
    
    <br>

        <h2 align="center">공지사항</h2>
        
         <br>
        	<form class="search" align="center">
        		<input type="search" id="search">
        		<button type="submit">검색하기</button>
        	</form>
        <br>

        <table align="center">
            <thead>
            <tr>
                <th width="100">번호</th>
                <th width="100">카테고리</th>
                <th width="500">제목</th>
                <th width="100">작성일</th>
                <th width="100">조회수</th>
            </tr>
        </thead>
	        <tbody>
	        
	        <!-- \
	            <% // if(bList.isEmpty()){ %>
	            
	            	<tr>
	            		<td colspan="5">등록된 공지사항이 없습니다.</td>
	            	</tr>
	            	
	            <% // else { %>
	            	<%//for(Board b : bList){  %>
	            	-->
	            	
	            		<tr>
		            		<td><%=b.getbNo() %></td>
		            		<td><%=b.getbCategory() %></td>
		            		<td><%=b.getbTitle() %></td>
		            		<td><%=b.getbDate() %></td>
		            		<td><%=b.getbCount() %></td>
	            		</tr>
	            	<%// } %>
	            <% //} %>
	            
	        </tbody>
        </table>

        <br><br>



        <div class="pagingArea" align="center">
            <button onclick="">&lt;&lt;</button>

            <button onclick="">&gt;&gt;</button>
        </div>
        	
        
        
    </div>
    
    <!-- 
    <script>
    
    	$(function(){
    		$("tbody>tr>td").click(function(){
    			var bno = $(this).children().eq(0).text();
    			// location.href = "<%//contextPath%>/detailNotice.do";
    		})
    	})
    	*/
    </script>
    -->
    
    <script>
    $(function(){
		$(".listArea>tbody>tr>td").click(function(){
			console.log()
		})
	})
    </script>
</body>
</html>