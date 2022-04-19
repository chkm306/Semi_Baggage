<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Baggage</title>
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
        
       
       .row{
       		display: flex;
       		flex-wrap: wrap;
       		text-align: center;]
       }
        
        
       .col_text_right{
       		width: 100%;
            position: relative;
            
            border-radius: 10px 10px 10px 10px;
            padding: 0;
            margin-right: 30px;
       
       }
       .trans_res_box{
        	float: left;
            padding: 40px 25px;
            text-align: center;
            border: 1px solid black;
            border-radius: 10px 10px 10px 10px;
            height: 30%;
            width: 100%px;
            margin-top: 60px;
        	
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
            height: 30%;
            width: 100%px;
            margin-top: 60px;
        }
    </style>

</head>
<body>
    <!-- 메뉴바 -->
	<%@ include file="../common/menubar.jsp" %>
	

        <img class="mainImg" src="resources/images/reservation.jpg" alt="img" >      
 
 	
    <h1 align="center">예약신청서</h1>
    <br>
    
    <div class="outer">
	<div class="row">
        <div class="col_text_right">
        <div class="trans_res_box">
            
            <img src="resources/images/2.png" class="png" onclick="location.href='<%=request.getContextPath()%>/r_transe.do'"> 
            <p>운송</p>
           </div> 
        </div>
	<div class="col_text_left">
        <div class="store_box">
            
            <img src="resources/images/3.png" class="png" onclick="location.href='<%=request.getContextPath()%>/r_storage.do'"> 
            <p>보관</p>
            </div>
   </div>
		</div>
    </div>
    

    
    
    
    	<a href="<%= request.getContextPath()%>/memRList.do">
            <p>예약 조회 - 마이페이지로 들어가는게좋을듯</p>
        </a>
    
    
    


   
    

    <!-- 푸터 -->
    	<%@ include file="../common/footer.jsp" %> 
</body>
</html>