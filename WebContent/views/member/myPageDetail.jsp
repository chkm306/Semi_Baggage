<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.member.model.dto.Member"%>
<%
	Member m = (Member)request.getAttribute("loginUser");
	String userId = m.getUserId();
	String userName = m.getUserName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	.outer{
		margin-top: 40px;
		margin-bottom: 100px;
	    width: 100%;
	    height: 100%;
	    text-align: center;
	}
	.userInfo{
	    width: 70%;
	    height: 70%;
	    margin: 0 auto;
	}
	.myInfo{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	table{
	    margin-left: auto;
	    margin-right: auto;
	}
	button{
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
	<div class="banner_img">
			<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img2.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
        <div class="userInfo">
        	<h1 style="color: #0367a6;">마이페이지</h1>
        	<div class="myInfo">
	            <table>
	                <tr>
	                    <td width="50px">아이디</td>
	                    <td width="100px"><%= userId %></td>
	                </tr>
	                <tr>
	                    <td>이름</td>
	                    <td><%= userName %></td>
	                </tr>
	            </table>
            </div>
            <div class="updateBtns">
                <button type="button" id="myPageUpdateBtn" onclick="updateMyPage()">개인 정보 수정</button>
                <br>
                <button type="button" id="memDeleteBtn" onclick="deletePage()">회원 탈퇴</button>
                 <br>
                <button type="button" id="memDeleteBtn" onclick="memberListTest()">정보 불러오기</button>
            </div>
            <script>
            	function updateMyPage(){
            		location.href="<%=request.getContextPath()%>/updateMemberInfo.do";
            	}
            	function deletePage(){
            		location.href="<%=request.getContextPath()%>/deletePage.do";
            	}
            	function memberListTest(){
            		location.href="<%=request.getContextPath()%>/listMember.do";
            	}
            </script>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>