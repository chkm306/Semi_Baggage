<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.uni.faq.model.dto.*"%>
<% 
FAQ f  = (FAQ)request.getAttribute("f");
Attachment at  = (Attachment)request.getAttribute("at");

String category = f.getFaqCategory();
String[] selected = new String[7];

switch(category){
case "결제 문의": selected[0] = "selected";break;
case "이용 문의": selected[1] = "selected";break;
case "기능 오류": selected[2] = "selected";break;
case "건의사항": selected[3] = "selected";break;
case "기타 문의": selected[4] = "selected";break;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.faqimg{
        width: 100%;
        height: 30%;
    }
    
	.container{
		padding: 20px 60px 50px;
        position: relative;
        width: 1200px;
        margin: auto;
        font-size: 20px;
        
        display: grid;
        justify-content: center;
        
		height:auto;
		color:black;
		margin-top:50px;
		margin-bottom:50px;
	}
	
	#updateForm>table{
		border:1px solid white;
	}
	
	#updateForm>table input, #updateForm>table textarea{
		width:100%;
		box-sizing:border-box;
	}
	
	#deleteBtn{color:gray;}
	#deleteBtn:hover{cursor:pointer}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<img src="resources/images/faqMain.jpg" alt="" class="faqimg">
	
	<div class="container">
		<h2 align="center">문의 수정</h2>
		<br>
		
		<form id="updateForm" action="<%= contextPath %>/updateFAQ.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="fno" value="<%= f.getFaqNo() %>">
			<table align="center">
				<tr>
					<th width="100">분야</th>
					<td width="500">
						<select name="category">
							<option value="10" <%= selected[0] %>>결제 문의</option>
							<option value="20" <%= selected[1] %>>이용 문의</option>
							<option value="30" <%= selected[2] %>>기능 오류</option>
							<option value="40" <%= selected[3] %>>건의사항</option>
							<option value="50" <%= selected[4] %>>기타 문의</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="<%= f.getFaqTitle() %>"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="15" name="content" style="resize:none;"><%= f.getFaqContent() %></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<% if(at != null){ %> <!-- 기존의 첨부파일이 있었을 경우 -->
							<%= at.getOriginName() %> <br>
							<input type='hidden' name='originFile' value='<%=at.getChangeName()%>'>
							<input type='hidden' name='originFileNo' value='<%=at.getFileNo()%>'>
						<% }%>
						<input type="file" name="upFile">
					</td>
				</tr>
			</table>
			<br>
			<div class="btns" align="center">
				<button type="submit">수정하기</button>
			</div>
			<script>
			$("#updateForm").submit(function() {
				alert("문의글을 성공적으로 수정했습니다.");
			});
			</script>
		</form>
	</div>
</body>
</html>