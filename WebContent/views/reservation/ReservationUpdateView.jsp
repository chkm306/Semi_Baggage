<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.reservation.model.dto.*" %>
<%
	Reservation r = (Reservation)request.getAttribute("r");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약변경</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    

    <style>

        .outer{
            width: 70%;
            heigh: 50%;
            margin: auto;
            margin-top: 50px;
            text-align: center;
            
            
            

        }

        .info_box{
            width: 800px;
            height: 400px;
            margin: auto;
            margin-bottom: 40px;
            margin-top: 50px;
            text-align: left;
            border: 1px solid black;
            
        }

        .info{
            margin-top: 20px;
            line-height: 50px;
            margin-left: 20px;
        }


        .lb_1{
            width: 200px;
            margin-left: 30px;
        }
        .lb_1_bag{
            width: 200px;
            margin-left: 70px;

        }
        .lb_1_amount{
        	margin-left: 60px;
        
        }
        

        .btn{
            margin: 50px;
            text-align: center;
        }
        .update{
            background-color: rgb(50, 65, 1);
            color: white;
            border-radius: 4px 4px 4px 4px;
            width: 100px;
            height: 30px;
            margin: 10px;
            padding: 0;
            font-size: large;
        }
        
    </style>
</head>
<body>
	<!--navigation-->
	<%@ include file="../common/menubar.jsp" %>
	
	
    <div class= "reseve_img">
       <img src="/resources/images/reservation2.jpg" alt="">
    </div>

    <form action="<%=request.getContextPath() %>/updateRes.do" method="post">
        <div class="outer">
            <div>
                <h1 align="center">예약변경</h1>
            </div>

            <div class="info_box" align="center" >
                <div class="info">
                <label>짐</label>
                <input type="text" name="baggage" class="lb_1_bag" value="<%= r.getBaggage() %>"  placeholder="사이즈" >
                <br>
                <label>수량</label>
                <input type="text" name="amount" class="lb_1_amount" value="<%= r.getAmount() %>"  placeholder="수량" >
                <br>
                <label>출발장소</label>
                <input type="text" name="sta_place" value="<%= r.getSta_place() %>"  class="lb_1" >

                <br>
                <label>출발날짜</label>
                <input type="date" name="sta_date"  value="<%= r.getSta_date() %>"  class="lb_1">
                <br>
                <label>출발시간</label>
                <input type="time" name="sta_time" class="lb_1" value="<%= r.getSta_time() %>"  id="time">
                
                <br>
                <label>도착장소</label>
                <input type="text" name="arr_place" value="<%= r.getArr_place() %>"  class="lb_1">
                
                <br>
                <label>도착시간</label>
                <input type="time" name="arr_time" id="time1" value="<%= r.getArr_time() %>"  class="lb_1">
                <input type="hidden" name="rno" value="<%= r.getRes_no() %>">
                <input type="hidden" name="status" value="<%= r.getStatus() %>">
                <input type="hidden" name="res_type" value="<%= r.getRes_type() %>">
                <br>
                </div>
            </div>
            
            <div class="btn" align="center">
                <button type="submit" class="update">확인</button>
            </div>
        </div>
    </form>


	 <!--footer-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>