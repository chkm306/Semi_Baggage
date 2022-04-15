<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.uni.board.model.dto.Board" %>
<%
	Board n = (Board)request.getAttribute("notice");
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Baggage</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


  <style>
        .outer{
            float: center;
            width: 70%;
            margin: auto;
        }
        .mainImg{
	        width: 100%;
	        height: 30%;
	        margin: 0%;
	        padding: 0%;
   	 	}
        table{
            width: 100%;
            float: center;
            margin: auto;
        }
        input[name=title] {
			width: 100%;
			font-size: 20px;
		}
		textarea{
			width : 100%;
			height : 400px;
			font-size: 20px;
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
          
          <form id="enrollForm" action="<%= request.getContextPath()%>/updateNotice.do?bno=<%=n.getbNo() %>" method="post">
          <table>
             <tr>
                <td><input type="text" name="title" value="<%=n.getbTitle()%>"></td>
             </tr>
        </table>
        <br>
             <textarea name="content" value="<%=n.getbContent()%>"></textarea>  
             
             <br>
          
			<div class="btns" align="center">
				<button type="submit" >등록하기</button> 
			
			</div>        
          </form>

   </div>
   
   <br>
   
<script>

	
</script>

	    <%@ include file="../common/footer.jsp" %> 

</body>
</html>