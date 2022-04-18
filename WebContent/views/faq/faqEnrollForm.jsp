<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Baggage - 문의 등록</title>
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
	
	#insertForm>table{
		border:1px solid white;
	}
	
	#insertForm>table input, #insertForm>table textarea{
		width:100%;
		box-sizing:border-box;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<img src="resources/images/faqMain.jpg" alt="" class="faqimg">
	
	<div class="container">
		<h2 align="center">1:1 문의 하기</h2>
		<br>
		
		<form id="insertForm" action="<%= contextPath %>/insertFAQ.do" method="post" enctype="multipart/form-data">
			<table align="center">
				<tr>
					<th width="100">문의 유형</th>
					<td width="500">
						<select name="category">
							<option value="10">결제 문의</option>
							<option value="20">이용 문의</option>
							<option value="30">기능 오류</option>
							<option value="40">건의사항</option>
							<option value="50" selected>기타 문의</option>
						</select>
					</td>
				</tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" placeholder="문의 제목을 적어주세요. (한 글자 이상)"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea rows="15" name="content" style="resize:none;" placeholder="문의 내용을 적어주세요. (한 글자 이상)"></textarea>
                    </td>
                </tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="upfile"></td>
				</tr>
			</table>
			<br>
			
			<div class="btns" align="center">
				<button type="reset" style="background: #324001; color : white;">취소하기</button>
				<button type="submit" style="background: #324001; color : white;">등록하기</button>
			</div>
		</form>
	</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>