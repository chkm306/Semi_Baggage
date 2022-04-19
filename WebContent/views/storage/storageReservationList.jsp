<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.uni.storage.model.dto.Storage"%>
<%
	ArrayList<Storage> list = (ArrayList<Storage>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BAGGAGE</title>
<style>
	.outer{
		margin-top: 40px;
		margin-bottom: 100px;
	    width: 100%;
	    height: 100%;
	    text-align: center;
	}
	
	.adminTBL{
		border-collapse: separate;
		border-spacing: 1px;
		text-align: center;
		line-height: 1.5;
		margin: 20px 10px;
		border-color: gray;
		margin-left: auto;
	    margin-right: auto;
	}
	
	.adminTBL thead{
		width: 155px;
		padding: 10px;
		vertical-align: top;
		color: #fff;
		background: #0367a6;
		font-size: 20px;
	}
	
	.adminTBL tbody td{
		width: 155px;
		padding: 10px;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
		background: white;
	}
	
	.reserveDeleteBtn{
		background-color: #324001;
		width: 100px;
		color: white;
	}
	
	#goBack{
		background-color: #324001;
	    margin-top: 10px;
		color: white;
	    width: 230px;
	    height: 30px;
	}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<h1>보관소 예약 관리</h1>
        <table class="adminTBL">
            <thead id="reservationListHead">
                <tr>
                    <th>예약번호</th>
                    <th>보관소 번호</th>
                    <th>보관소 주소</th>
                    <th>회원 번호</th>
                    <th>예약 날짜</th>
                    <th>찾을 날짜</th>
                    <th>짐종류</th>
                    <th>수량</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% if(list.isEmpty()){ %>
                    <tr>
                        <td colspan="9">조회 가능한 예약이 없습니다</td>
                    </tr>
                <% } else { %>
                    <% for(Storage s : list) { %>
                        <tr>
                            <td><%= s.getSr_no()%></td>
                            <td><%= s.getSr_sno()%></td>
                            <td><%= s.getSr_address()%></td>
                            <td><%= s.getMem_no()%></td>
                            <td><%= s.getSr_start()%></td>
                            <td><%= s.getSr_end()%></td>
                            <td><%= s.getSr_baggage()%></td>
                            <td><%= s.getSr_amount()%></td>
                            <td><input type="button" class="reserveDeleteBtn" value="삭제" /></td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
        <button type="button" id="goBack" onclick="history.go(-1)">이전 페이지로</button>
    </div>
    <script>
 		$(".reserveDeleteBtn").click(function(){
 			var rDeleteBtn = $(this);
 			
 			var tr = rDeleteBtn.parent().parent();
 			var td = tr.children();
 			var sr_no = td.eq(0).text();
 			
 			var popupX = (document.body.offsetWidth / 2) - 200;
 			var popupY = (window.screen.height / 2) - 150;
 			/* 절대 경로로 설정해 줌 */
 			window.open("${pageContext.request.contextPath}/views/storage/reserveDelete.jsp?" + sr_no, "sr_no", "width=400, height=150, left= "+ popupX + ", top=" + popupY);
 		})
    </script>
</body>
</html>