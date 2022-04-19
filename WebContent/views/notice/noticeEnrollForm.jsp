<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Baggage</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


  <style>
        .outer{
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
        table{
            width: 100%;
            float: center;
            margin: auto;
        }
        input[name=title] {
			width: 100%;
			font-size: 20px;
		}
        button{
            background-color: rgb(50, 65, 1);
            color: white;
            font-size: 15px
        }		textarea{
			width : 100%;
			height : 400px;
			font-size: 20px;
		}
  </style>
  
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
		<img class="mainImg" alt="img" src="resources/images/noticeMain.jpg">
	

    <div class="outer">

        <br>
        <h1 align="center">공지사항</h1>     
          <br>
          
          <form id="enrollForm" action="<%= request.getContextPath()%>/insertNotice.do" method="post">
          <table>
             <tr>
                <td><input type="text" name="title" placeholder="제목을 입력하세요."></td>
             </tr>
        </table>
        <br>
             <textarea name="content" placeholder="내용을 입력하세요."></textarea>  
             
             <br>
          
			<div class="btns" align="center">
				<button type="submit" >등록하기</button>
				
			</div>  
          
          </form>
          
          
   </div>
   
   <br>
   
<script>

	function insert(){
		console.log("click");
	}
	
</script>

	    <%@ include file="../common/footer.jsp" %> 

</body>
</html>