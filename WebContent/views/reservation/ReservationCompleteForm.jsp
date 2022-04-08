<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약완료</title>
    <style>
        .customer{
            color: rgb(12, 101, 166);
            text-align: center;
            font-size: 50px;
            
            
        }
        .res_num{
            text-align: center;
        }

        .info{
            margin-top: 150px;
        }

        .next_btn{
            margin: 50px;
            text-align: center;
        }

        .btn{
            background-color: rgb(50, 65, 1);
            color: white;
            border-radius: 4px 4px 4px 4px;
            width: 50px;
            height: 30px;
            margin-top: 60px;
        }
    </style>
</head>
<body>
 	<!--navigation-->
	<%@ include file="../common/menubar.jsp" %>
	

    <div class= "reseve_img">
        <img src="resources/images/reservation.jpg" alt="" >       
	</div>
    <div class="info">
        <h2 class="customer">고객님의 예약이 완료되었습니다.</h2>
        <h2 class="res_num">예약 번호 : </h2>
    </div>
    <div class="next_btn">
        <input type="button" value="확인" class="btn" onclick="goMain()">
    </div>
    
    <script type="text/javascript">
    
    function goMain(){
        location.href="<%= request.getContextPath()%>";
    }
    </script>
    
     <!--footer-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>