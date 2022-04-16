<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.uni.storage.dto.Storage"%>
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
        h1 {
        	color: #0367a6;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<h1>보관소 목록</h1>
		<div class="storageListTBL">
			<% for(Storage s : storageList) {  %>
				<p>
                    <input type="hidden" name="storageNo" value="<%= s.getSr_sno() %>">
                    <span style="font-size: 1.5em;"><%= s.getSto_name() %></span>
                    <br>
                    <span style="font-size: 1em;"><%= s.getSr_address() %></span>
                </p>
			<%} %>
		</div>
	</div>
	<script>
	    $(function(){
	        $("tbody>tr").click(function(){
	           var sno = $(".storageListTBL input[name=storageNo]").val();
	           location.href = "<%=contextPath%>/reservationStorage.do?sno="+sno;
	        })
	     })    
     </script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>