<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.uni.board.model.dto.*, java.util.ArrayList"%>
    <%
    int b_no = (int)request.getAttribute("b_no");
    Board_Info b = (Board_Info)request.getAttribute("b");
	ArrayList<Board_content> bList = (ArrayList<Board_content>)request.getAttribute("bList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        .info{
            float: center;
            width: 70%; 
            margin: auto;
        }
        .content{
        	float: center;
            width: 70%; 
            margin: auto;
        }
        input[name=title]{
        	width: 100%;
        	font-size: 20px
        }
        textarea {
			width: 100%;
			font-size: 15px;
		}
        button{
            background-color: rgb(50, 65, 1);
            color: white;
            font-size: 15px
        }       </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<img class="mainImg" alt="img" src="resources/images/boardMain.png">	
	
		<br>
		<br>
	        <h1 align="center">게시판</h1>
        <br>
        <br>
        <br>
		<form id="insertForm" action="<%= request.getContextPath() %>/boardUpdateInfo.do?b_no=<%=b_no %>" method="post" enctype="multipart/form-data">
	    	<input type="hidden" name="b_no" value="<%=b_no%>">
	    	
	    	<input type="hidden" value="<%=b.getB_Category()%>" name="category">
	
	        <table class="info">
		        <tr>
		            <td colspan="3"><img src="<%=contextPath%>/resources/board_Uploard/<%=b.getB_Change()%>" style="width: 100%"></td>
		        </tr>
		        <tr>
		            <td colspan="3"><input type="text" name="title" placeholder="<%=b.getB_Title()%>"></td>
		        </tr>
		        <tr>
		            <td><h2 align="center">썸네일 업로드</h2></td>
		            <td><input type="file" name="upfile"></td>
		            <td><button type="submit" class="btn">수정하기</button></td>
		        </tr>		
		    </table>
        </form>
        
        <br><br>
    	
    	<%for(Board_content c : bList){ %>
    	<form id="insertForm" action="<%= request.getContextPath() %>/boardUpdateContent.do?b_no=<%=b_no %>" method="post" enctype="multipart/form-data">
	    	<input type="hidden" value="<%=b.getB_No()%>">
	    	<input type="hidden" value="<%=c.getB_Order() %>" name="order">
		
    		<table class="content">
		        <tr>
		            <td colspan="3"><img src="<%=contextPath%>/resources/board_Uploard/<%=c.getB_Change()%>" style="width: 100%"></td>
		        </tr>
		        <tr>
		            <td colspan="3"><textarea name="content" placeholder="<%=c.getB_Contents()%>"></textarea></td>
		        </tr>
		        <tr>
		            <td><h2 align="center">썸네일 업로드</h2></td>
		            <td><input type="file" name="upfile"></td>
		            <td><button class="btn" type="submit" class="btn">수정하기</button></td>
		        </tr>		
		    </table>
			    
			    <br><br>
       	</form>
			    
    	<%} %>
    	

    <%@ include file="../common/footer.jsp" %> 
	

</body>
</html>