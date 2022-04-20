<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.reservation.model.dto.*" %>
    
<%
	Reservation r = (Reservation)request.getAttribute("r");
	ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("list");
%>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    
    
    
    <title>상세보기</title>
    <style>
		
		


        .outer{
            width: 70%;
            height:30%;
            margin: auto;
            margin-top: 50px;
          
        }

        .info_box{
            width: 50%;
            height: 35%;
			margin-left:30%;
            margin-bottom: 40px;
            margin-top: 50px;
            text-align: left;
            border: 1px solid black;
            
        }
        
      

        .info{
  			text-align:center;
            margin: auto;
            padding: 6%;
            line-height: 20%;
            margin-right: 60px;
        }

        .lb_1{
            width: 40%;
            line-height: 20%;
            margin-left: 8%;
      		margin-top:6%;

        }
        .lb_1_bag{
            width: 40%;
            margin-left: 14%;
            
        }
        .lb_2{
      		width: 40%;
      		margin-left: 12%;
      		margin-top:3%;
        }
        
        .btn{
           	
     		text-align: center;
     		margin: 20px;
        }
        
        button{
        	background-color: rgb(50, 65, 1);
        	color: white;
        	margin-left: 20px;
        }
        
        
        .update{
            background-color: rgb(50, 65, 1);
            color: white;
            border-radius: 4px 4px 4px 4px;
            width: 30%;
            height: auto;
            margin: 5%;
            padding: 0;
            font-size: large;
        }
        .delete{
            background-color: rgb(50, 65, 1);
            color: white;
            border-radius: 4px 4px 4px 4px;
            
            height: auto;
            margin: 5%;
            padding: 0;
            font-size: large;
        }
        
    </style>
</head>
<body>
	<!--navigation-->
	<%@ include file="../common/menubar.jsp" %>
	
   <img class="mainImg" src="resources/images/reservation.jpg">    

    <form>
        <div class="outer"></div>
            <div>
                <h1 align="center">상세보기</h1>
            </div>
            <div class="info_box" align="center">
                <div class="info">
                <label>짐</label>
                <input type="text" name="baggage" value="<%= r.getBaggage()%>" class="lb_1_bag" readonly><br>
                <label>수량</label>
                <input type="text" name="amount" value="<%= r.getAmount()%>" class="lb_2" readonly><br>
                <label>출발장소</label>
                <input type="text" name="sta_place" value="<%= r.getSta_place() %>" class="lb_1" readonly><br>
                <label>출발날짜</label>
                <input type="text" name="sta_date" value="<%=r.getSta_date() %>" class="lb_1" readonly><br>
                <label>출발시간</label>
                <input type="text" name="sta_time" value="<%=r.getSta_time() %>" class="lb_1" readonly><br>
                <label>도착장소</label>
                <input type="text" name="arr_place" value="<%=r.getArr_place() %>" class="lb_1" readonly><br>
                <label>도착시간</label>
                <input type="text" name="arr_time" value="<%=r.getArr_time() %>" class="lb_1" readonly><br>
                </div>
            </div>
            
            <div class="btn" align="center">
			<% if(loginUser != null && loginUser.getUserNo().equals(r.getMem_no())){  //멤버만 %>
				<button type="button" onclick="updateFormRes();">수정하기</button>
				<button type="button" onclick="deleteRes();">삭제하기</button>
			<% } %>
			<% if(loginUser != null && loginUser.getUserType() == 3){  // 관리자만%>
				<button type="button" onclick="deleteRes();">삭제하기</button>
			<% } %>
            </div>

      
    </form>
    
     <!--footer-->
	<%@ include file="../common/footer.jsp" %>
		<form action="" id="postForm" method="post">
			<input type="hidden" name="rno" value="<%= r.getRes_no() %>">
		</form>
	<script>
		function updateFormRes(){
			$("#postForm").attr("action", "<%=contextPath%>/updateFormRes.do");
			$("#postForm").submit();
		}
		function deleteRes(){
			$("#postForm").attr("action", "<%=contextPath%>/deleteRes.do");
			$("#postForm").submit();
		}
		function deleteReservation(){
			var val = confirm("정말로 취소하시겠습니까?");
			if(val){
				$("#delete").submit();
			}else{
				alert("취소하였습니다");
			}
		}
	</script>
	
</body>
</html>