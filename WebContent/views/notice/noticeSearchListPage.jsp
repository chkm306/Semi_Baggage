<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.notice.model.dto.*, java.util.ArrayList"%>

<%
	ArrayList<Notice> nList = (ArrayList<Notice>)request.getAttribute("nList");
	//Board b = new Board(1, "title", "category", "content", "2012-02-03", 1); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
            font-size: 15px
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

	<!-- 메뉴바 -->
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 메인 이미지 -->
	<img class="mainImg" alt="img" src="resources/images/noticeMain.jpg">
	
	<!-- 전체 outer -->
    <div class="outer">
    
    	<br>
        <h1 align="center">공지사항</h1>     
        <br>
        
     <!-- 검색창 -->
		<form class="seach" align="center" action="<%=request.getContextPath()%>/searchNotice.do" method="post">
			<input type="search" id="search" placeholder="검색어를 입력하세요.">
			<button class="btn" type="submit">검색하기</button>
		</form>
		
		<br>
		
	<!-- 공지사항 리스트 -->
		<table class="listArea">
		<thead>
			<tr>
				<td width="70%" colspan="2">제목</td>
				<td width="30%">작성일</td>
			</tr> 
		</thead>
		<tbody>
		<%if(nList.isEmpty()){ %>
			<td colspan=2>등록된 공지사항이 없습니다.</td>
		<%} else {%> 
			<%for(Notice b : nList){ %>
			<tr>
				<td><%=b.getbNo()%></td>
				<td><%=b.getbTitle()%></td>
				<td><%=b.getbDate()%></td>
			<tr>
			<%} %>
		<%} %>
			
		</tbody> 
        </table>

        <br><br>
        <%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
        <div class="insertButton" align="center">
        <button class="btn" onclick="location.href='enrollFormNotice.do'">작성하기</button>
        </div>
        <br><br>
        <%} %>
        
        
        
        
        <!-- 페이징바 영역 -->
		<div class="pagingArea" align="center">
		<!-- 맨 처음 페이지 -->
			<button onclick="location.href='<%=contextPath%>/listNotice.do?currentPage=1'"> &lt;&lt; </button>
		
		
		<!-- 이전 페이지 -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= contextPath %>/listNotice.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
		<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button disabled> <%= p %> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath %>/listNotice.do?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
		<!-- 다음 페이지 -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else { %>
			<button onclick="location.href='<%= contextPath %>/listNotice.do?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
		<!-- 맨끝 페이지 -->
			<button onclick="location.href='<%=contextPath%>/listNotice.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div>
        	
        
        
    </div>
    
    <script>
    $(function(){
        $("tbody>tr").click(function(){
           var bno = $(this).children().eq(0).text();
           location.href = "<%=contextPath%>/detailNotice.do?bno="+bno;
        })
     })    </script>

    <%@ include file="../common/footer.jsp" %> 
</body>
</html>