<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
            float: center;
            width: 70%;
            margin: auto;
        }
        .mainImg{
            width: 100%;
            height: 30%;
        }
        table{
            width: 100%;
        }
        #title{
            color:  rgb(13, 101, 166);
            font-size: 40px;
        }
    </style>
</head>
<body>
	<div class="outer">
	
	        <h2 align="center">공지사항</h2>
	
	        <hr>
	            <table>
	                <tr>
	                    <th id="title" colspan="2" align="left">title</th>
	                </tr>
	                <tr>
	                    <th align="left">date</th>
	                    <th align="right">조회수 : </th>
	                </tr>
	            </table>
	        <hr>
	            <h4>content</h4>
	            <div class="pagingArea" align="center">
	            <button class="giList">목록으로</button>
	            </div>
	
	        
	    </div>
</body>
</html>