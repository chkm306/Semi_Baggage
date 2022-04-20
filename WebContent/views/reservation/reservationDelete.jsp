<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.reservation.model.dto.Reservation, com.uni.member.model.dto.Member" %>
<%
	Reservation r = (Reservation)request.getAttribute("r");
String userName = ((Member) request.getSession().getAttribute("loginUser")).getUserName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>baggage</title>

	
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<img class="mainImg" src="resources/images/reservation.jpg" alt="img">
	
	<div class="outer">

			<%= userName %>님, 예약 취소가 되었습니다.
	
			<div class="deleteBtns">
				<button type="submit" id="deleteChkBtn">확인</button>
				<br>
				<button type="button" >취소</button>
			</div>
	</form>
		
		
	</div>
	<%@ include file="../common/footer.jsp" %> 
</body>
</html>