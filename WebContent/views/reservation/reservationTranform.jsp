<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.reservation.model.dto.*" %>
<%
	Reservation r = (Reservation)request.getAttribute("r");
%>    
    
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baggage</title>
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  

	
	
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
         	border: 1px solid black;
            margin-top: 40px;
            padding: 10px;
           
            width: 600px;
            height: 350px;
        }

		label{
			text-align: center;
			
		}
        
        
        .lb_0{
        	width:20%;
        	margin-left: 40px;
        	margin-top: 10px;
        	font-size: 15px;
        }
        .lb_1{
        	width:20%;
        	margin-left: 30px;
        	margin-top: 10px;
        	font-size: 15px;
        }
        .lb_2{
        	width:20%;
        	margin-left: 10px;
        	margin-top: 10px;
        }
        
    </style>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="../common/menubar.jsp" %>
	

        <img class="mainImg" src="resources/images/reservation.jpg">       


		<h1 align="center">예약신청서</h1>
    	<br>
		<div class="outer" align="center">
         <form id="enrollForm" action="<%= request.getContextPath()%>/R_Info.do" method="post">
         	<div id = "info">
         		
         		<label>짐</label>
                <input type="text" name="baggage" class="lb_0" placeholder="사이즈" id="bag" required><br>
                
                <label>수량</label>
                <input type="text" name="amount" placeholder="수량" required><br>           
                     
                <label>출발장소</label>
                 <input type="text" name="sta_place"  class="lb_2" required><br>
                 
                <label>출발날짜</label>
                    <input type="date" name ="sta_date" class="lb_2" required><br>
                    
                <label for="time">출발시간</label>
                    <input type="time" id="time1" name ="sta_time" class="lb_2" required><br>
                    
                <label>도착장소</label>
                    <input type="text" name="arr_place" id="arr_place" class="lb_2" required><br>
                    
                <label for="time">도착시간</label>
                <input type="time" id="time2" name ="arr_time" class="lb_2" required><br>
                
                <label></label>
                <input type="hidden" name="status" value="1">
                <input type="hidden" name="res_type" value="2">
         	</div>
         	<br>
      		<div>
         	<button type="submit">확인</button>
         	</div>
         </form>
        </div> 
         
         
   			  
		
         
	
	 <!-- 푸터 -->
		<%@ include file="../common/footer.jsp" %> 
		
		
		
		
	
</body>
</html>