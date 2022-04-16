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
	.adminTBL{
		border-collapse: separate;
		border-spacing: 1px;
		text-align: center;
		line-height: 1.5;
		margin: 20px 10px;
	}
	
	.adminTBL thead{
		width: 155px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		color: #fff;
		background: #0367a6;
	}
	
	.adminTBL tbody td{
		width: 155px;
		padding: 10px;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
		background: #eee;
	}
	
	button{
		background: #a2cdf2;
		color: white;
		width: 90px;
	}
</style>
</head>
<body>
	<div class="outer">
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
                            <td><button>수정</button></td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>