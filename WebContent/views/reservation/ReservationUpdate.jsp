<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약변경</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- Air datepicker css -->
    <script src="resources/js/datepicker.js"></script> <!-- Air datepicker js -->
    <script src="resources/js/i18n/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->

    <style>

        .outer{
            width: 800px;
            margin: auto;
            margin-top: 50px;
            text-align: center;
            
            
            

        }

        .info_box{
            width: 800px;
            height: 350px;
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
            margin-left: 80px;
            margin-right: 20px;

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

    <section>
        <div class="outer">
            <div>
                <h1 align="center">예약변경</h1>
            </div>

            <div class="info_box" align="center">
                <div class="info">
                <label class="gim">짐</label>
                <input type="text" name="bag" class="lb_1_bag">
                <input type="button" value="변경" onclick="showPopup();">
                <br>
                <label>출발장소</label>
                <input type="text" name="start_place" class="lb_1">

                <br>
                <label>출발날짜</label>
                <input type="text" id="datepicker" name="start_date" class="lb_1">
                <br>
                <label>출발시간</label>
                <input type="time" name="start_time" class="lb_1">
                
                <br>
                <label>도착장소</label>
                <input type="text" name="arr_place" class="lb_1">
                
                <br>
                <label>도착시간</label>
                <input type="time" name="arr_time" class="lb_1">
                
                <br>
                </div>
            </div>
            <div class="btn" align="center">
                <button type="button" onclick="location.href='reservationCheck.do'" class="update">확인</button>
            </div>


        </div>
    </section>

    <script>
        $("#datepicker").datepicker({
            language: 'ko'

        }); 
    </script>
	 <!--footer-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>