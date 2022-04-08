<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- Air datepicker css -->
    <script src="resources/js/datepicker.js"></script> <!-- Air datepicker js -->
    <script src="resources/js/i18n/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
    <style>
        
        h1{
        	
            text-align: center;
            margin: auto;
            margin-top: 80px;
            
            }

        .page_form{
            width:600px;
            height:500px;
            color:black;
            margin:auto;
            margin-top:80px;
            text-align: left;
            



        }
        
        
        .info{
            border: 1px solid black;
            margin-top: 40px;
            padding: 10px;
            line-height: 50px;
            width: 600px;
            height: 350px;
        }
        
        label{
        font-size: 25px;
        }

        /* .form_control_name{
            width: 240px;
            margin-left: 80px;
        }
        .form_control_ph{
            width: 240px;
            margin-left: 30px;
        } */

        .form_control_bag{
            width: 200px;
            margin-left: 100px;
        }
        .lb_1{
            margin-left: 45px;
        }

        .next_btn{
            margin-top: 50px;
            text-align: center;
        }

        .btn{
            background-color: rgb(50, 65, 1);
            color: white;
            border-radius: 4px 4px 4px 4px;
            text-align:center;
            margin-bottom: 20px;
            width: 100px;
            height: 30px;
            font-size: large;
        }
        

    </style>
</head>
<body>
	 <!--navigation-->
	<%@ include file="../common/menubar.jsp" %>
	
    <div class= "reseve_img">
        <img src="resources/images/reservation.jpg" alt="" >       
	</div>
    <h1>예약신청서</h1>
    
        <section class="page_form">
            <div class="page">
            <div class="info" >
                <label>짐</label><input type="text" class="form_control_bag">
                <input type="button" value="선택" onclick="showPopup();"><br>
                <label>출발장소</label>
                    <input type="text" name="searchText" class="lb_1"><br>
                <label>출발날짜</label>
                    <input type="text" name ="dateInput" class="lb_1" id="date"><br>
                <label for="time">출발시간</label>
                    <input type="time" id="time" name ="timeInput" class="lb_1"><br>
                <label>도착장소</label>
                    <input type="text" name="searchText" class="lb_1"><br>
                <label for="time">도착시간</label>
                <input type="time" name ="timeInput" class="lb_1"><br>
            </div>

            <div class="next_btn">
                <input type="button" value="확인" class="btn" onclick="location.href='reservationPayment.do'">
                
            </div>
        </div>
        </section>

        <script>
        
        	$(function(){
	        $("#date").datepicker({
	        	language: 'ko'
	        	});
	  
        	});
        	
        	
        	
        	/*$(function() {
        		$("#datepicker").datepicker({ minDate: 0});
        		})
        	*/
        	
         
       

      
        
       
        </script>
        
        <!--footer-->
		<%@ include file="../common/footer.jsp" %>
</body>
</html>