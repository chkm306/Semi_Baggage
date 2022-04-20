<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.uni.storage.model.dto.Storage"%>
<%
	ArrayList<Storage> storageList = (ArrayList<Storage>)request.getAttribute("sList");
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
        p {
            margin-bottom: 10px;
        }
        table{
	        margin-top: 20px;
		    margin-left: auto;
		    margin-right: auto;
		    text-align: left;
		    border-spacing: 10px;
		}
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="banner_img">
		<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img3.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<h1>보관소 목록</h1>
		<div class="storageListTBL">
			<table class="listArea">
				<% if(storageList.isEmpty()) { %>
					<tr>
						<td>조회 가능한 보관소가 없습니다.</td>
					</tr>
				<%} else {%>
					<% for(Storage s : storageList) { %>
						<tr>
							<td>
								<span style="font-size: 1em;"><%= s.getSto_no() %></span>
							</td>
							<td>
								<span style="font-size: 1.5em;"><%= s.getSto_name() %></span>
							</td>
							<td>
								<span style="font-size: 1em;"><%= s.getSto_address() %></span>
							</td>
						</tr>
					<% } %>
				<% } %>
			</table>
		</div>
	</div>
	<script>
		<%if(!storageList.isEmpty()) {%>
	    $(function(){
	        $("tbody>tr").click(function(){
	           var sno = $(this).children().eq(0).text();
	           location.href = "<%=request.getContextPath()%>/reservationStorageForm.do?sno=" + sno;
	        })
	     })
	    <% } %>
     </script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>