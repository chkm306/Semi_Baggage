<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.reservation.model.dto.Reservation"  %>
    
<%--
	ArrayList<Reservation> list = (ArrayList<Reservation>) request.getAttribute("list");
--%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약조회</title>
    <style>

        .outer{
            width:800px;
            height:500px;
            color:black;
            margin:auto;
            margin-top:80px;
            margin-left: 600px;
            text-align: center;
      
        }

        th{
            color: rgb(12, 101, 166);
        }

        .listArea{
            border: 1px solid black;
            text-align: center;
            margin-top: 50px;
 			width:800px;
        }

        .listArea>tbody>tr:hover{
            background:rgb(12, 101, 166);
            cursor:pointer
	    }
        .btn{
            background-color: rgb(50, 65, 1);
            border-color: rgb(50, 65, 1);
            color: white;
        }
    </style>
</head>
<body>
    <!--navigation-->
	<%@ include file="../common/menubar.jsp" %>
	
    <div class= "reseve_img">
        <img src="resources/images/reservation2.jpg" alt="" >       
	</div>
    <form action="<%= request.getContextPath() %>/listReservationMem.do" method="post">
        <div class="outer">
        <div>
            <h1 align="center">예약조회</h1>
        </div>
        <div>
            <table class="listArea" align="center">
            <thead>
            <tr>
                <th width="50">유형</th>
                <th width="200">출발장소</th>
                <th width="100">출발날짜</th>
                <th width="100">출발시간</th>
                <th width="200">도착장소</th>
                <th width="100">도착시간</th>
                <th>상세보기</th>
            </tr>
            </thead>
            <tbody>
          
               <tr>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td><button onclick="location.href='reservationDetail.do'" type="button" class="btn">상세보기</button></td>
                </tr>

                <tr>
                    <td colspan="7">예약내역이 없습니다.</td>
                </tr>  
                
          <!--  지금 null이라 오류뜸    
                	<%-- if(list.isEmpty()){ %>
				 	<tr>
						<td colspan="7">예약내역이 없습니다</td>
					</tr>
				 <% }else{  %>
				 	<% for(Reservation r : list){ %>
				 		<tr>
				 			<td><%= r.getRes_type() %></td>
							<td><%= r.getSta_place() %></td>
							<td><%= r.getSta_date() %></td>
							<td><%= r.getSta_time() %></td>
							<td><%= r.getArr_place() %></td>
							<td><%= r.getArr_time() %></td>
							<td><button onclick="location.href='reservationDetail.do'" type="button" class="btn">상세보기</button></td>
				 		</tr>
				 	<% } %>
				 <% } --%>
                 --> 
            </tbody>
            </table>
        </div>

        </div>
    </form>
	
	<script type="text/javascript">
	
	<%-- if(!list.isEmpty()){%>
	$(function(){
		$(".listArea>tbody>tr").click(function(){
			var rno = $(this).children().eq(0).text();
			
			location.href="<%=contextPath%>/detailReservation.do?rno="+rno;
		})
	})
	
		
	<% }--%>
	
	</script>



    <!--footer-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>