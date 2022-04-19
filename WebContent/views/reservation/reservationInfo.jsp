<%@page import="com.uni.member.model.dto.NonMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   import="com.uni.reservation.model.dto.Reservation, com.uni.member.model.dto.Member" %>
    <%
    	Reservation r = (Reservation)request.getAttribute("r");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

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
	       		text-align: center;
	       		border: 1px solid black;
	       		width: 40%;
	       		margin: 10px;
	       		padding: 20px;
	       		margin-bottom: 20px;
	       		font-size: 25px;
	       		margin-left: 
	       	}
	       	
	       	#name{
	       		font-size: 25px;
	       		margin-bottom: 30px;
	       		margin-left: 58px;
	       	}
	       	#phone{
	       		font-size: 25px;
	       		margin-left:5px;
	       	}
	        
	        button{
	        	background-color: #324001;
				color: white;
	        }
</style>
</head>
<body>

<!-- 메뉴바 -->

<%@ include file="../common/menubar.jsp" %>

<img class="mainImg" src="resources/images/reservation.jpg" >  


		<h1 align="center">예약정보</h1>
    	<br>
		<div class="outer">

			<form action="<%= request.getContextPath()%>/insertReservation.do" method="post">
			
				<div align="center">
					<div name="baggage">짐 : <%=r.getBaggage() %>
						<input type="hidden" value="<%=r.getBaggage() %>" name="baggage"> 
					</div><br>
					
					<div name="amount">수량 : <%=r.getAmount() %>
						<input type="hidden" value="<%=r.getAmount() %>" name="amount"> 
					</div><br>
					
					<div name="sta_place">출발장소 : <%=r.getSta_place() %>
					<input type="hidden" value="<%=r.getSta_place() %>" name="sta_place">
					</div><br>
					
					<div name="sta_date">출발날짜 : <%=r.getSta_date() %>
					<input type="hidden" value="<%=r.getSta_date() %>" name="sta_date">
					</div><br>
					
					<div name="sta_time">출발시간 : <%=r.getSta_time() %>
					<input type="hidden" value="<%=r.getSta_time() %>" name="sta_time">
					</div><br>
					
					<div name="arr_place">도착장소 : <%=r.getArr_place() %>
					<input type="hidden" value="<%=r.getArr_place() %>" name="arr_place">
					</div><br>
					
					<div name="arr_time">도착시간 : <%=r.getArr_time() %>
					<input type="hidden" value="<%=r.getArr_time() %>" name="arr_time">
					</div><br>
					
					<input type="hidden" value="<%=r.getStatus() %>" name="status">
					<input type="hidden" value="<%=loginUser.getUserNo() %>" name="mem_no">
					<input type="hidden" value="<%=r.getRes_type() %>" name="res_type">
	
				</div>
				
				<button type="submit">예약완료</button>
				
			</form>
			
			<div class="wrap_box">
		        <p>
		            <span>* 비회원 예약 조회는 로그인 창에서 확인가능합니다.</span>
		        </p>
		        <p>
		            <span>* 거리가 너무 먼 지역은 배송 불가능합니다.</span>
		        </p>
			</div>

			
    	</div>
    
    
		<!-- 푸터 -->
    	<%@ include file="../common/footer.jsp" %> 
		
</body>
</html>