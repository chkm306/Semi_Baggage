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
<style>
        .outer {
            float: center;
            width: 70%;
            margin: auto;
        }
        .mainImg{
	        width: 100%; 
	        height: 30%;
	        margin: 0%;
	        padding: 0%;
   	 	}
        input[name=address]{
            width: 100%;
            font-size: 30px;
        }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<img class="mainImg" alt="img" src="resources/images/noticeMain.jpg">
	
    <div class="outer">

        <br>
        <h2 align="center">보관소 찾기</h2>
        <br>

        <form id="searchForm" action="<%=request.getContextPath()%>/searchStorage.do" method="post">
                <input name="address" type="text" placeholder=" 주소를 입력하세요.">

        <br>
        <br>
        <br>
        <div class="btn" align="center">
            <button type="submit">검색하기</button>
        </div>
        
        <br>
        <br>
		</form>
    </div>
    
    <%@ include file="../common/footer.jsp" %> 
    
</body>
</html>