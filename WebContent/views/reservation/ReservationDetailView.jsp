<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세보기</title>
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

            margin-bottom: 40px;
            margin-top: 50px;
            text-align: left;
            border: 1px solid black;
            
        }

        .info{
            margin-top: 20px;
            margin-left: 20px;
            line-height: 50px;
        }

        .lb_1{
            width: 200px;
            margin-left: 30px;
        }
        .lb_1_bag{
            width: 200px;
            margin-left: 80px;
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
        .delete{
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
                <h1 align="center">상세보기</h1>
            </div>

            <div class="info_box" align="center">
                <div class="info">
                <label>짐</label>
                <input type="text" name="bag" class="lb_1_bag"><br>
                <label>출발장소</label>
                <input type="text" name="start_place" class="lb_1"><br>
                <label>출발날짜</label>
                <input type="text" name="start_date" class="lb_1"><br>
                <label>출발시간</label>
                <input type="text" name="start_time" class="lb_1"><br>
                <label>도착장소</label>
                <input type="text" name="arr_place" class="lb_1"><br>
                <label>도착시간</label>
                <input type="text" name="arr_time" class="lb_1"><br>
                </div>
            </div>
            <div class="btn" align="center">
                <button type="button" onclick="" class="update">예약변경</button>
                <button type="button" onclick="" class="delete">예약취소</button>
            </div>


        </div>
    </section>
    
     <!--footer-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>