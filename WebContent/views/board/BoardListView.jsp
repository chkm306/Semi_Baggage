<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.board.model.dto.*, java.util.ArrayList"%>

<%
	ArrayList<Board_Info> bList = (ArrayList<Board_Info>)request.getAttribute("bList"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int category = (int)request.getAttribute("category");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
	        margin: 10px ;
	        position: relative;
	        width: 45%;
	        float: 
	    }
	    .test-wrap img {
	        width: 100%;
	        height: 300px;
	        
	    }
	    .text {
	        width: 100%;
	        height: 30%;
	
	        background-color: rgba(13, 101, 166, 0.8);
	        color: white;
	        position: absolute;
	        top: 50%;
	        left: 50%;
	        transform: translate(-50%, 65%);
	    }
	    .text1{
	        margin-top: 5%;
	    }
        button{
            background-color: rgb(50, 65, 1);
            color: white;
            font-size: 15px
        }	   
	</style>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<img class="mainImg" alt="img" src="resources/images/boardMain.png">	
	
			<br>
			<br>
	        <h1 align="center">게시판</h1>
	    <div class="outer">
	    <br>
	    	
	        <br>
	        <% if(bList.isEmpty()){ %>
	        	<h1 align="center">등록된 게시글이 없습니다.</h1>
	        <%} else { %>
	        
	        
	        	<% for(Board_Info b : bList){ %>
	        	
			        <div class="test-wrap">
   			        	<input type="hidden" value="<%=b.getB_No()%>">
			        
			        
			        	<div class="text">
			           		<h2><%=b.getB_Title()%></h2>
			           		<br>
			            	<h4><%=b.getT_Date()%></h4>
			        	</div>
			        	
			        	<div class="test-img"><img src="<%=request.getContextPath()%>/resources/board_Uploard/<%=b.getB_Change()%>"></div>
			        	
			        	
			    	</div>
			    	
    		<%} %>
    	<%} %>
    
    
	    </div>	  
	    
	    <br>

        <%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
    	<div align="center">
    		<button class="btn" onclick="location.href='<%=request.getContextPath()%>/insertBoardForm.do'">작성하기</button>
    	</div>
    	<%} %>
    
	    
	    <br>
	    <br>
	    
        <!-- 페이징바 영역 -->
		<div class="pagingArea" align="center">
		<!-- 맨 처음 페이지 -->
			<button onclick="location.href='<%=contextPath%>/listBoard.do?currentPage=1'"> &lt;&lt; </button>
		
		
		<!-- 이전 페이지 -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= contextPath %>/listBoard.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
		<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button disabled> <%= p %> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath %>/listBoard.do?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
		<!-- 다음 페이지 -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else { %>
			<button onclick="location.href='<%= contextPath %>/listBoard.do?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
		<!-- 맨끝 페이지 -->
			<button onclick="location.href='<%=contextPath%>/listBoard.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div>
		
		<br>
		<br>
		<footer>
	<%@ include file="../common/footer.jsp" %> 
	</footer>
	<script>
    $(function(){
        $(".test-wrap").click(function(){
           var bno = $(this).children().eq(0).val();
           location.href = "<%=contextPath%>/detailBoard.do?bno="+bno;
        })
     })    
	</script>	    
</body>
</html>