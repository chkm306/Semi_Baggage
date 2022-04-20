<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.ArrayList, java.util.Collections, com.uni.member.model.dto.Member, com.uni.member.model.dto.MemberListComparator"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	Collections.sort(list, new MemberListComparator());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		font-weight: bold;
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
	
	.memUpdateBtn, .memDeleteBtn{
		background-color: #324001;
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
	<div class="banner_img">
			<img id="banner_img" src="${pageContext.request.contextPath}/resources/images/banner_img4.jpg" alt="img" width="100%" height="30%">
	</div>
	<div class="outer">
		<h1>회원 관리</h1>
        <table class="adminTBL">
            <thead id="memberListHead">
                <tr>
                    <th>회원번호</th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>이메일</th>
                    <th>가입 날짜</th>
                    <th>구분</th>
                    <th>번호</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <% if(list.isEmpty()){ %>
                    <tr>
                        <td colspan="6">가입한 회원이 없습니다</td>
                    </tr>
                <% } else { %>
                    <% for(Member m : list) { %>
                        <tr>
                            <td><%= m.getUserNo()%></td>
                            <td><%= m.getUserName()%></td>
                            <td><%= m.getUserId()%></td>
                            <td><%= m.getEmail()%></td>
                            <td><%= m.getEnrollDate()%></td>
                            <td><%= m.getUserType()%></td>
                            <td><%= m.getPhone()%></td>
                            <td><input type="button" class="memUpdateBtn" value="수정" />
                            <input type="button" class="memDeleteBtn" value="삭제" /></td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
        <button type="button" id="goBack" onclick="history.go(-1)">이전 페이지로</button>
    </div>
    <script>
 		$(".memUpdateBtn").click(function(){
 			var mUpdateBtn = $(this);
 			
 			var tr = mUpdateBtn.parent().parent();
 			var td = tr.children();
 			var userId = td.eq(2).text();
 			
 			location.href = "<%=request.getContextPath()%>/mgUpdateMemberForm.do?userId=" + userId;
 		})
 		
 		$(".memDeleteBtn").click(function(){
 			var mDeleteBtn = $(this);
 			
 			var tr = mDeleteBtn.parent().parent();
 			var td = tr.children();
 			var userId = td.eq(2).text();
 			
 			var popupX = (document.body.offsetWidth / 2) - 200;
 			var popupY = (window.screen.height / 2) - 150;
 			/* 절대 경로로 설정해 줌 */
 			window.open("${pageContext.request.contextPath}/views/member/manageMemberDelete.jsp?" + userId, "findId", "width=400, height=150, left= "+ popupX + ", top=" + popupY);
 			
 		})
    </script>
    <%@ include file="../common/footer.jsp" %> 
</body>
</html>