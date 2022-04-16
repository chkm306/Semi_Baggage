<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.uni.storage.model.dto.Storage"%>
<%
	// ArrayList<Storage> storageList = (ArrayList<Storage>)request.getAttribute(storageList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BAGGAGE</title>
</head>
<body>
	<div class="outer">
		<div class="storageListTBL">
			<% for(Storage s : storageList) {  %>
			<%} %>
		</div>
	</div>
</body>
</html>