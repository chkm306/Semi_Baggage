<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Baggage</title>
    <style>
        .outer{
            width: 70%;
            margin: auto;
            float: center;
        }
         .mainImg{
	        width: 100%;
	        height: 30%;
	        margin: 0%;
	        padding: 0%;
	    }
        input[name=title]{
        	width: 100%;
        	font-size: 30px
        }
        .searchTable{
        	width:100%;
        }
        .fileTable{
        	width: 70%
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

		<form id="insertForm" action="<%= request.getContextPath() %>/insertBoard.do" method="post" enctype="multipart/form-data">
			<table align="center" class="searchTable">
				<tr >
					<td colspan="2"><input type="text" name="title" placeholder="제목을 입력하세요."></td>
					<br>
					<br>
				</tr>
			</table>
			<br>
			<br>
			<div align="center">
				<table class="fileTable">
					<div align="center">
				
						<tr>
							<td><input type="file" name="upfile"></td>
							<td><h4 align="center" style="color: red;">※썸네일은 필수 입니다.</h4></td>
							
						</tr>
					</div>
					
				</table>
			</div>
			<input type="hidden" name="category" value="1"> 
			<br>
			<br>
			<div class="btns" align="center">
				<button class="btn" type="submit">등록하기</button>
				<br>
			</div>
		</form>
		
		
		<br>
		
		<div align="center">
				<hr width="100%">
		<br>
			<button class="btn" onclick="location.href='<%=request.getContextPath()%>/listBoard.do'">작성 완료</button>
		</div>
		<br>
		<br>

    </div>
    
    	<%@ include file="../common/footer.jsp" %> 	    
    

</body>
</html>