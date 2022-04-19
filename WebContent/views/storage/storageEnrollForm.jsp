<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BAGGAGE</title>
<style>
	.outer{
		margin-top: 40px;
		margin-bottom: 100px;
	    width: 100%;
	    height: 100%;
	    text-align: center;
	}
	table{
		margin-top: 20px;
	    margin-left: auto;
	    margin-right: auto;
	    margin-bottom: 20px;
	    text-align: left;
	    line-height: 1.5;
	    font-size: 20px;
	}
	
	table th{
		width: 150px;
		padding: 8px;
		vertical-align: top;
	}
	
	input{
		height: 20px;
	}
	button{
	    background-color: #324001;
	    margin-top: 10px;
		color: white;
	    width: 230px;
	    height: 30px;
	}
</style>
<script>
	function fnInputCheck() {
		var storageName = $("#storageName");
		var storageAddress = $("#storageAddress");
		
		if(storageName.val().trim() === "") {
			alert("보관소 이름을 입력해 주세요")
			return false;
		}
		
		if(storageAddress.val().trim() === "") {
			alert("보관소 주소를 입력해 주세요")
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<div class="storageReserve">
			<form id="storageEnrollForm" action="<%= request.getContextPath() %>/storageEnrollForm.do" method="post" onsubmit="return fnInputCheck();">
				<h1>보관소 등록</h1>
				<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>"> 
				<table>
					<tr>
						<th>보관소 이름</th>
						<td><input type="text" id="storageName" name="storageName"></td>
					</tr>
					<tr>
						<th>보관소 주소</th>
						<td><input type="text" id="storageAddress" name="storageAddress"></td>
					</tr>
				</table>
				<div class="baggageReserveBtns" align="center">
	                <button type="submit" id="baggageReserveBtn">등록하기</button>
	                <button type="button" id="goLogin" onclick="history.go(-1)">이전 페이지로</button>
            	</div>
			</form>
		</div>
	</div>
</body>
</html>