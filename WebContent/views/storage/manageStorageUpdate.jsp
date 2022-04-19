<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.storage.model.dto.Storage"%>
<%
	Storage s = (Storage)request.getAttribute("storage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BAGGAGE</title>
<style>
	.outer{
		width: 100%;
		height: 100%;
		text-align: center;
		margin-top: 40px;
		margin-bottom: 100px;
	}
	.storageUpdate{
		width: 70%;
		height: 70%;
		margin: 0 auto;
	}
	table{
		margin-top: 20px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 20px;
		font-size: 20px;
	}
	
	table th{
		text-align: left;
		width: 100px;
	}
	button{
		background-color: #324001;
		margin-top: 10px;
		color: white;
		width: 230px;
		height: 30px;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<h1>보관소 정보 수정</h1>
		<div class="storageUpdate">
			<form id = "updateMemberForm" action="<%= request.getContextPath() %>/updateStorage.do" method="post">
				<input type="hidden" name="storageNo" value=<%= s.getSto_no()%> />
				<table>
					<tr>
						<th>보관소 이름</th>
						<td><input type="text" name="storageName" value="<%= s.getSto_name() %>"></td>
					</tr>
					<tr>
						<th>보관소 주소</th>
						<td><input type="text" name="storageAddress" value="<%= s.getSto_address() %>"></td>
					</tr>
				</table>
				<div class="baggageReserveBtns" align="center">
	                <button type="submit" id="storageUpdateBtn">등록하기</button>
	                <button type="button" id="goBack" onclick="history.go(-1)">이전 페이지로</button>
            	</div>
			</form>
		</div>
	</div>
</body>
</html>