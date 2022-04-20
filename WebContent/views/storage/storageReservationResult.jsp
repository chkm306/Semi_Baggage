<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.storage.model.dto.Storage"%>
<%
	Storage s = (Storage)request.getAttribute("sr");
%>
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
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
		border-top: 1px solid #ccc;
		margin: 20px 10px;
		margin-left: auto;
	    margin-right: auto;
	    font-size: 20px;
	}
	table th{
		width: 150px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
	}
	
	table td{
		width: 350px;
		padding: 10px;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
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
	<div class="banner_img">
		<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img3.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<h1>예약 확인</h1>
		<div class="storageReserveInfo">
				<table>
					<tr>
						<th>예약 번호</th>
						<td><%= s.getSr_no() %></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%= s.getSr_address() %></td>
					</tr>
					<tr>
						<th>예약 날짜</th>
						<td><%= s.getSr_start() %></td>
					</tr>
					<tr>
						<th>찾을 날짜</th>
						<td><%= s.getSr_end() %></td>
					</tr>
					<tr>
						<th>짐 종류</th>
						<td><%= s.getSr_baggage() %></td>
					</tr>
					<tr>
						<th>수량</th>
						<td><%= s.getSr_amount() %></td>
					</tr>
				</table>
				<div class="baggageReserveBtns" align="center">
	                <button type="button" id="goMain" onclick="goMain()">메인 페이지로</button>
            	</div>
		</div>
	</div>
	<script>
	function goMain(){
        location.href="<%= request.getContextPath()%>/";
    }
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>