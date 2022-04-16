<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보관,운송 선택</title>
    <style>

		
		h1{
		text-align: center;
		margin-left: 80px;
		
		}
		
        .page_section{
            height: 800px;
            padding-top: 100px;
            margin-bottom: 120px;
            margin-left: 220px;
   
        }

        .container{
            width: 1400px;
            padding-left: 0px;
            padding-right: 30px;
            
            
        }


        .res_form{
            text-align: center;
            font-size: 35px;
           
        }

        .row{
            display: flex;
            flex-wrap: wrap;
            text-align: center;
        
        }

        .col_text_right{
            width: 50%;
            position: relative;
            
            border-radius: 10px 10px 10px 10px;
            padding: 0;
            margin-right: 30px;
            
        }

        .trans_res_box{
            float: right;
            padding: 40px 25px;
            text-align: center;
            border: 1px solid black;
            border-radius: 10px 10px 10px 10px;
            height: 400px;
            width: 300px;
            margin-top: 60px;
        }

        p{
            text-align: center;
            margin-top: 40px;
            margin-bottom: 20px;
            font-size: 25px;
            font-weight: 600;
            color: rgb(12, 101, 166);
            
        }

        .png{
            margin-top: 30px;
            width: 200px;
            height:200px;
            text-align: center;
            
            border-radius : 6px 6px 6px 6px;
            border-color: rgb(50, 65, 1);
            font-size: 25px;
            font-weight: 800;
            color: white;
        }

        .col_text_left{
            width: 20%;
            position: relative;
            border-radius: 10px 10px 10px 10px;
            padding: 0;
            margin-left: 30px;
            
        }

        .store_box{
            float: left;
            padding: 40px 25px;
            text-align: center;
            border: 1px solid black;
            border-radius: 10px 10px 10px 10px;
            height: 400px;
            width: 300px;
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
    <form class="page_section" action="<%=request.getContextPath() %>/reservationSelect.do" method="post">

     <div class="container">
         <h1 class="res_form">예약신청서</h1>
     <div class="row">
        <div class="col_text_right">
            <div class="trans_res_box">
            
            	<img src="resources/images/2.png" onclick="location.href='<%=request.getContextPath()%>/reservationForm.do'" class="png"> 
                <p>운송</p>
                
            </div>
        </div>

        <div class="col_text_left">
            <div class="store_box">
                <img src="resources/images/3.png" onclick="location.href='<%=request.getContextPath()%>/reservationForm.do'"  class="png" > 
                <p>보관</p>
                
            </div>
        </div>
     </div>
    </div>
    </form>
     <!--footer-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>