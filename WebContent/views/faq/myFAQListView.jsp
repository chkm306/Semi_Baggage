<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.ArrayList, com.uni.faq.model.dto.*"%>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Baggage - 문의 내역</title>
<style>
	*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;
	}
	
	.container{
		padding: 20px 60px 100px 60px;
	    position: relative;
	    width: 70%;
	    margin: auto;
	    
	    background: white;
	    font-size: 20px;
	}
	
	.listArea{
		width:100%;
	}
	
	thead{
	   background-color: rgb(13, 101, 166);
	   border: 0px;
	   color: white;
	   text-align: center;
	   font-size:16px;
	}
	
	tbody{
		padding : 10px 10px 10px 10px;
		text-align: center;
	}
	
	th, tr, td{
        border-bottom: 1px solid darkgray;
        padding: 10px;
    }
    
	.listArea>tbody>tr:hover{
		background:lightgray;
		cursor:pointer
	}
	
	.faqimg{
	    width: 100%;
	    height: 30%;
	}
	
	button{
	    background-color: rgb(50, 65, 1);
	    color: white;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<img src="resources/images/faqMain.jpg" alt="" class="faqimg">
	
	<div class="container">
		<h2 align="center">내 문의 내역</h2><br>
		
		<table class="listArea" align="center">
			<thead>
				<tr>
					<th width="10%">문의 번호</th>
					<th width="10%">카테고리</th>
					<th width="45%">문의 제목</th>
					<th width="10%">작성자</th>
					<th width="15%">작성일</th>
					<th width="10%">상태</th>
				</tr>
			<thead>
			
			<tbody>
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(FAQ f : list){ %>
					<tr>
						<td><%= f.getFaqNo() %></td>
						<td><%= f.getFaqCategory() %></td>
						<td><%= f.getFaqTitle() %></td>
						<td><%= f.getMemNo() %></td>
						<td><%= f.getFaqDate() %></td>
						<%if(f.getStatus().equals("Y")){%>
						<td><%= "답변 완료" %></td>
						<%}else if(f.getStatus().equals("N")){%>
						<td><%= "답변 대기" %></td>
						<%}%>
					</tr>
					<%} %>
				<%} %>
			</tbody>
		</table>

		<br><br>
		
		<!-- 페이징바 만들기 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=contextPath%>/listMyFAQ.do?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= contextPath %>/listMyFAQ.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button disabled> <%= p %> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath %>/listMyFAQ.do?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else { %>
			<button onclick="location.href='<%= contextPath %>/listMyFAQ.do?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
			<button onclick="location.href='<%=contextPath%>/listMyFAQ.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div> 
		<br><br>
		<div align="center">
		<% if(loginUser != null){ %>
		<button onclick="location.href='enrollFormFAQ.do'">작성하기</button>
		<% } %>
		</div>
	</div>
	<script>
		<%if(!list.isEmpty()){%>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				var fno = $(this).children().eq(0).text();
				location.href = "<%=contextPath%>/detailFAQ.do?fno="+fno;
			})
		})
		<%}%>
	</script>
</body>
</html>