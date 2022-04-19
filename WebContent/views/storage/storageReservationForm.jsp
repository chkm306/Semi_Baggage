<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.storage.model.dto.Storage, com.uni.member.model.dto.Member"%>
<%
	Storage s = (Storage)request.getAttribute("storage");
	Member m = (Member)request.getAttribute("loginUser");
	
	int sto_no = s.getSto_no();
	String sto_address = s.getSto_address();
	String mem_no = s.getMem_no();
	String sto_name = s.getSto_name();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		font-weight: bold;
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
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="banner_img">
		<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img3.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<div class="storageReserve">
			<form id="storageReserveForm" action="<%= request.getContextPath() %>/storageReservation.do" method="post">
				<input type="hidden" name="userNo" value="<%= m.getUserNo() %>">
				<input type="hidden" name="sto_no" value="<%= sto_no %>">
				<h1><%= sto_name %></h1>
				<table>
					<tr>
						<th>주소</th>
						<td><%= sto_address %></td>
					</tr>
					<tr>
						<th>예약 날짜</th>
						<td><input type="text" id="reserveDate" name="reserveDate" readonly></td>
					</tr>
					<tr>
						<th>찾을 날짜</th>
						<td><input type="text" class="recoverDate" id="recoverDate" name="recoverDate" readonly></td>
					</tr>
					<tr>
						<th>짐 종류</th>
						<td>
							<select name="baggageType">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="text" name="baggageAmount"></td>
					</tr>
				</table>
				<div class="baggageReserveBtns" align="center">
	                <button type="submit" id="baggageReserveBtn">예약하기</button><br>
	                <button type="button" id="goLogin" onclick="history.go(-1)">이전 페이지로</button>
            	</div>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
	var jb = jQuery.noConflict();
	$(document).ready(function(){
		jb("#reserveDate").datepicker({
			changeMonth: true,
			changeYear: true,
			nextText: '다음 달',
			prevText: '이전 달',
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat: 'yy-mm-dd',
			minDate: "0M",
			maxDate: "+1M",
			onClose: function(selectDate) {
				jb('#recoverDate').datepicker('option', 'minDate', selectDate);
			}
		});
			
		jb("#recoverDate").datepicker({
			changeMonth: true,
			changeYear: true,
			nextText: '다음 달',
			prevText: '이전 달',
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat: 'yy-mm-dd',
			maxDate: "+1M"
		});
		
	})
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>