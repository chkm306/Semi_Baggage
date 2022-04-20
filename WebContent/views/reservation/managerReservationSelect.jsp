<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.reservation.model.dto.Reservation" %>
<%
	ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("list");
%>    


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자예약조회</title>
    <style>

        .outer{
            width:70%;
            height:auto;
            color:black;
            margin:auto;

            text-align: center;
      
        }

        th{
            color: rgb(12, 101, 166);
        }

        .listArea{
            border: 1px solid black;
            text-align: center;
            margin-top: 10%;
 			
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
    <form>
        <div class="outer">
        <div>
            <h1 align="center">예약조회</h1>
        </div>
        <div>
            <table class="listArea" align="center">
            <thead>
            <tr>
            	<th width="50">유형</th>
            	<th width="60">예약번호</th>
            	<th width="60">멤버번호</th>
                <th width="100">출발장소</th>
                <th width="100">출발날짜</th>
                <th width="100">출발시간</th>
                <th width="100">도착장소</th>
                <th width="100">도착시간</th>
                <th></th>
            </tr>
            </thead>
            <tbody>

   
                	<% if(list.isEmpty()){ %>
				 	<tr>
						<td colspan="9">예약내역이 없습니다</td>
					</tr>
				 <% }else{  %>
				 	<% for(Reservation r : list){ %>
				 		<tr>
				 			<td><%= r.getRes_type() %></td>
							<td><%= r.getRes_no() %></td>
							<td><%= r.getMem_no() %></td>
							<td><%= r.getSta_place() %></td>
							<td><%= r.getSta_date() %></td>
							<td><%= r.getSta_time() %></td>
							<td><%= r.getArr_place() %></td>
							<td><%= r.getArr_time() %></td>
							<td><input type="button" class="resUpdate" value="수정" onclick="location.href='<%=request.getContextPath()%>/reservationDetail.do"/>
                            <input type="button" class="resDelete" value="삭제" /></td>
				 		</tr>
				 	<% } %>
				 <% } %>
               
            </tbody>
            </table>
        </div>

        </div>
    </form>
	
	
	
	<script type="text/javascript">
		 
		$(.resUpdate).click(function(){
			var resUp = $(this);
			
			var tr = resUp.parent().parent(); //.parent()는 어떤 요소의 부모 요소를 선택합니다.
			var td = tr.children();
			var userId = td.eq(2).text();
			
			
		})
		
	
	
	
	</script>



    <!--footer-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>