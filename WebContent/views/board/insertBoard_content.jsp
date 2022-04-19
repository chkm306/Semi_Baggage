<%@page import="com.uni.board.model.dto.Board_content"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    int b_no = (int)request.getAttribute("b_no"); 
    Board_content b = (Board_content)request.getAttribute("b");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Baggage</title>
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
    .contentTable{
      	width:100%;
     }
     .fileTable{
       	width: 70%
        }
	textarea{
		width : 100%;
		height : 400px;
		font-size: 20px;
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
	<br>
	<br>
	        <h1 align="center">게시판</h1>
    <br>
	
	<div class="outer">
				<form id="insertForm" action="<%= request.getContextPath() %>/insertBoard_content.do" method="post" enctype="multipart/form-data">
			<table align="center" class="contentTable">
				<tr >
					<td colspan="2">
					<textarea name="content" placeholder="내용을 입력하세요."></textarea>
				</tr>
			</table>
			<br>
			<br>
			<div align="center">
				<table class="fileTable">
					<tr>
					<div align="center">
						<td><input type="file" name="upfile"></td>
					</div>
					</tr>
				</table>
			</div>
			<input type="hidden" name="b_no" value="<%=b_no%>"> 
			<br>
			<br>
			<div class="btns" align="center">
				<button class="btn" type="submit">다음으로</button>
				
				<br>
			</div>
		</form>
		<br>
		
		<div align="center">
				<hr width="100%">
		<br>
			<button class="btn" onclick="location.href='<%=request.getContextPath()%>/listBoard.do'">작성 완료</button>
		</div>
		
	</div>
	
	<br>
	<br>
	
	<%@ include file="../common/footer.jsp" %> 	    

</body>
</html>