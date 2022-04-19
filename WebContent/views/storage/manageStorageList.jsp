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
	
	.storageUpdateBtn, .storageDeleteBtn{
		background-color: #324001;
		width: 50px;
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
		<h1>보관소 관리</h1>
        <table class="adminTBL">
            <thead id="storageListHead">
                <tr>
                    <th>보관소 번호</th>
                    <th>보관소 이름</th>
                    <th>보관소 주소</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% if(list.isEmpty()){ %>
                    <tr>
                        <td colspan="5">조회 가능한 보관소가 없습니다</td>
                    </tr>
                <% } else { %>
                    <% for(Storage s : list) { %>
                        <tr>
                            <td><%= s.getSto_no()%></td>
                            <td><%= s.getSto_name()%></td>
                            <td><%= s.getSto_address()%></td>
                            <td><input type="button" class="storageUpdateBtn" value="수정" />
                            <input type="button" class="storageDeleteBtn" value="삭제" /></td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
        <button type="button" id="goBack" onclick="history.go(-1)">이전 페이지로</button>
    </div>
    <script>
    $(".storageUpdateBtn").click(function(){
			var stoUpdateBtn = $(this);
			
			var tr = stoUpdateBtn.parent().parent();
			var td = tr.children();
			var sto_no = td.eq(0).text();
			
			location.href = "<%=request.getContextPath()%>/manageStorageUpdateForm.do?sto_no=" + sto_no;
		})
		
		$(".storageDeleteBtn").click(function(){
			var stoDeleteBtn = $(this);
			
			var tr = stoDeleteBtn.parent().parent();
			var td = tr.children();
			var sto_no = td.eq(0).text();
			
			var popupX = (document.body.offsetWidth / 2) - 200;
			var popupY = (window.screen.height / 2) - 150;
			/* 절대 경로로 설정해 줌 */
			window.open("${pageContext.request.contextPath}/views/storage/manageStorageDelete.jsp?" + sto_no, "sto_no", "width=400, height=150, left= "+ popupX + ", top=" + popupY);
			
		})
    </script>
</body>
</html>