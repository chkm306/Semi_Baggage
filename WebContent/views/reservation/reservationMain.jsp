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
        
       
        

        
        .cate{
        	text-align: center;
        	display: flex;
        	margin-left: 35%;
        	margin-top:10%;
        
        }
        
       .col_text_right{
       		width: 100%;
            
            
            border-radius: 10px 10px 10px 10px;
            padding: 0;
		
        }
       
		p{
			font-size: 25px;
			margin-left: 40px
		}

	    
	    
	    ._box{
	    	border: 1px solid black;
	    }
	    
	    
        .png{
            margin-top: 30px;
            width: 150px;
            height:150px;
            text-align: center;
            border-radius : 6px 6px 6px 6px;
            border-color: rgb(50, 65, 1);
            font-size: 25px;
            font-weight: 800;
            color: white;
            margin-left: 630px;
        }

        .col_text_left{
            width: 20%;
            position: relative;
            border-radius: 10px 10px 10px 10px;
            padding: 0;
            margin-left: 30px;
            
        }

    
        
        #selectRList{
			text-align: center;
			margin-bottom: 10px;
			
		}
		#reservationList{
			background-color: #324001;
			color: white;
			
			margin-top: 10%;
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
            <p></p>
           </div> 
        </div>
	<div class="col_text_left">
        <div class="store_box">
            
            <img src="resources/images/3.png" class="png" onclick="location.href='<%=request.getContextPath()%>/r_storage.do'"> 
            <p></p>
            </div>
   </div>
		</div>
    </div>
    
    
		
    
    
    
    
    
    
    
    
 

    <!-- 푸터 -->
    	<%@ include file="../common/footer.jsp" %> 
</body>
</html>