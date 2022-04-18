<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.faq.model.dto.*, com.uni.member.model.dto.Member" %>  
<%
	FAQ f = (FAQ)request.getAttribute("f");
	Attachment at = (Attachment)request.getAttribute("at");
	Member m = (Member)request.getAttribute("loginUser");
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Baggage - 문의 상세보기</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic:wght@700&display=swap');
	
	*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;
	}
	
	.faqimg{
	    width: 100%;
	    height: 30%;
	}

	th, tr, td{
        padding: 8px;
        font-family: 'Nanum Gothic', sans-serif;
    }
    
    .container{
    	float: center;
        width: 70%;
        margin: auto;
        margin-bottom:100px;
    }
    
    table{
       	width: 100%;
    }
    
    #title{
        color:  rgb(13, 101, 166);
        font-size: 40px;
    }
    
    button {
        background-color: rgb(50, 65, 1);
        color: white;
	}
	
    .tr{
    	background-color: rgb(238, 238, 238);
    }
    
    .tbody{
    margin:10px;
    height:300px
    }
    
    .AnswerArea{
    text-align:center;
    width: 70%;
    }
    
    #AnswerArea{
    border:1px solid white;
    background:#fcfcfc;
    }
    
    h2{
    margin:30px;
    }
    
    .btns{
    margin-bottom:100px;
    }
    
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<img src="resources/images/faqMain.jpg" alt="" class="faqimg">
	
	<div class="container">
		<h2 align="center">문의 내역 상세보기</h2>
		<table align="center">
			<tr>
				<td align="right" colspan="4">분야 > <b><%= f.getFaqCategory() %></b></td>
			</tr>
			<tr class="thead">
				<td id="title" colspan="3"><%= f.getFaqTitle() %></td>
			</tr>
			<tr class="thead">
				<th align="left" style="width:15%">작성자</th>
				<td><%= f.getMemNo() %></td>
				<td align="center"><%= f.getFaqDate() %></td>
				<%if(f.getStatus().equals("Y")){%>
				<td align="right">문의 상태&nbsp;&nbsp;&nbsp;<%= "답변 완료" %></td>
				<%}else if(f.getStatus().equals("N")){%>
				<td align="right">문의 상태 >&nbsp;&nbsp;&nbsp;<%= "답변 대기" %></td>
				<%}%>
			</tr>
			</table>
			<hr>
			<table align="center">
			<tr class="tbody">
				<td colspan="5">
					<p><%= f.getFaqContent() %></p>
				</td>
			</tr>
			</table>
			<hr>
			<table align="center">
			<tr class="tfoot">
				<th align="left" style="width:15%">첨부파일</th>
				<td>
					<% if(at != null){ %>
					<a download="<%= at.getOriginName() %>" href="<%=contextPath%>/resources/upfiles/FAQ/<%=at.getChangeName()%>"><%= at.getOriginName() %></a>
					<% }else{ %>
					첨부파일이 없습니다.
					<% } %>
				</td> 
			</tr>
		</table>
	<h2 align="center">문의 답변</h2>
		<!-- 댓글 리스트 div -->
		<div id="AnswerArea">
			<table id="Answer" align="center">
			</table>
		</div>
	
	<!-- 답변 작성 영역 -->
	<% if(loginUser != null && loginUser.getUserType() == 3){ %>
	<div class="AnswerArea" style="width:100%; background:rgb(240,240,240)">
		<table align="center">
			<tr>
				<th style="width:15%">답변 작성</th>
				<td style="width:70%"><textarea rows="10" cols="100" id="answerContent"></textarea></td>
				<td style="width:15%"><button id="addAnswer">답변 등록</button></td>
			</tr>
		</table>
		<% } %>
	</div> 
	<br>
			<!-- 수정 및 삭제 버튼 -->
		<div class="btns" align="center">
			<button type="button" onclick="location.href='<%=contextPath%>/listMyFAQ.do?currentPage=1';">목록으로</button>
			
			<% if(loginUser != null && loginUser.getUserId().equals(f.getMemNo())){ %>
				<button type="button" onclick="updateForm();">수정하기</button>
				<button type="button" onclick="deleteFAQ();">삭제하기</button>
			<% } %>
			<% if(loginUser != null && loginUser.getUserType() == 3){ %>
				<button type="button" onclick="deleteFAQ();">삭제하기</button>
			<% } %>
		</div>
		
		<form action="" id="postForm" method="post">
			<input type="hidden" name="fno" value="<%= f.getFaqNo() %>">
		</form>
		<script>
			function updateForm(){
				$("#postForm").attr("action", "<%=contextPath%>/updateFormFAQ.do");
				$("#postForm").submit();
			}
			
			function deleteFAQ(){
				$("#postForm").attr("action", "<%=contextPath%>/deleteFAQ.do");
				$("#postForm").submit();
			}
		</script>
	</div>
	
	<script>
	$(function(){
		selectAnswerList();
		$("#addAnswer").click(function(){
			var content = $("#answerContent").val();
			var fno = <%=f.getFaqNo()%>;
			$.ajax({
				url:"insertAnswer.do",
				type:"post",
				data:{
						content:content,
					    fno:fno
				},
				success:function(status){
					if(status =="success"){
						selectAnswerList();
						$("#answerContent").val("");
					}
				},
				error:function(){
					console.log("ajax 통신 실패 (답변 등록)")
				}
			})
		})
	})
	function selectAnswerList(){
			$("#Answer").empty();
			$.ajax({
				url:"answerList.do",
				data:{fno:<%=f.getFaqNo()%>},
				type:"get",
				success:function(list){
					console.log(list)
					$.each(list, function(index, obj){
						var writerTd = $("<td>").text(obj.ansWriter).attr("width", "15%");
						var contentTd = $("<td>").text(obj.ansContent).attr("width", "70%");
						var dateTd = $("<td>").text(obj.createDate).attr("width", "15%","align","right");
						
						var tr = $("<tr>").append(writerTd, contentTd, dateTd);
						$("#Answer").append(tr);
					});
				},
				error:function(){
					console.log("ajax 통신 실패 (답변 조회)")
				}
			})
		}
	</script>
</body>
</html>