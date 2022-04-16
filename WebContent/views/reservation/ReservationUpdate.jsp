<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*
	Reservation r = (Reservation)request.getAttribute(""); //insertReseravtion에서 정보를 받아오면 될듯
	String baggage = r.getBaggage();
	int amount = r.getAmount();
	String sta_date = r.getSta_date();
	String sta_place = r.getSta_place();
	String sta_time = r.getSta_time();
	String arr_time = r.getArr_time();
	String arr_place = r.getArr_place();
*/
%>
    
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약변경</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    
    <!-- 제이쿼리 ui css -->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 
	 <!-- 제이쿼리 style css -->
	 <link rel="stylesheet" href="/resources/demos/style.css">
	 
	 <!-- 제이쿼리 js -->
	 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	 
	 <!--  제이쿼리 ui js -->
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    

	<!--  제이쿼리 timepicker-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <style>

        .outer{
            width: 800px;
            margin: auto;
            margin-top: 50px;
            text-align: center;
            
            
            

        }

        .info_box{
            width: 800px;
            height: 350px;
            margin: auto;
            margin-bottom: 40px;
            margin-top: 50px;
            text-align: left;
            border: 1px solid black;
            
        }

        .info{
            margin-top: 20px;
            line-height: 50px;
            margin-left: 20px;
        }


        .lb_1{
            width: 200px;
            margin-left: 30px;
        }
        .lb_1_bag{
            width: 200px;
            margin-left: 70px;

        }

        .btn{
            margin: 50px;
            text-align: center;
        }
        .update{
            background-color: rgb(50, 65, 1);
            color: white;
            border-radius: 4px 4px 4px 4px;
            width: 100px;
            height: 30px;
            margin: 10px;
            padding: 0;
            font-size: large;
        }
        
    </style>
</head>
<body>
	<!--navigation-->
	<%@ include file="../common/menubar.jsp" %>
	
	
    <div class= "reseve_img">
       <img src="/resources/images/reservation2.jpg" alt="">
    </div>

    <section>
        <div class="outer">
            <div>
                <h1 align="center">예약변경</h1>
            </div>

            <div class="info_box" align="center" action="updateForm()"   "<%=request.getContextPath() %>/updateReservation.do" method="post">
                <div class="info">
                <label class="gim">짐</label>
                <input type="text" name="bag" class="lb_1_bag" value="<%=baggage%><%=amount %>"  placeholder="사이즈/수량"  data-toggle="dropdown" readonly aria-expanded="true">
                <br>
                <label>출발장소</label>
                <input type="text" name="start_place" value="<%=sta_place %>"  class="lb_1" >

                <br>
                <label>출발날짜</label>
                <input type="text" id="datepicker" name="start_date"  id="datepicker"  value="<%=sta_date %>"  class="lb_1">
                <br>
                <label>출발시간</label>
                <input type="time" name="start_time" class="lb_1" value="<%=sta_time %>"  id="time" readonly>
                
                <br>
                <label>도착장소</label>
                <input type="text" name="arr_place" value="<%=arr_place %>"  class="lb_1">
                
                <br>
                <label>도착시간</label>
                <input type="time" name="arr_time" id="time1" value="<%=arr_time %>"  class="lb_1">
                
                <br>
                </div>
            </div>
            <div class="btn" align="center">
                <button type="button" onclick="location.href='reservationCheck.do'" class="update">확인</button>
            </div>


        </div>
    </section>
	<script type="text/javascript">
	function updateForm(){
		$("#postForm").attr("action", "<%=contextPath%>/updateFormReservation.do");
		$("#postForm").submit();
	}	
	
	
	</script>




    <script>
     
    $(function() {
        //input을 datepicker로 선언
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd' //달력 날짜 형태
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
            ,changeYear: true //option값 년 선택 가능
            ,changeMonth: true //option값  월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
            ,buttonText: "선택" //버튼 호버 텍스트              
            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
            ,minDate: "+1d" //허용하는 가장 이른 날짜 (-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1y" //허용하는 가장 늦은 날짜(+1D:하루후, -1M:한달후, -1Y:일년후)  
        });                    
        
        //초기값을 오늘 날짜로 설정
        $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    });


    
    
    $(function() {//출발시간
    		$("#time").timepicker({
                timeFormat: 'HH:mm',
                interval: 5,
                minTime: '8', 
                maxTime: '19',
                defaultTime: '8',
                startTime: '8',
                dynamic: false,
                dropdown: true,
                scrollbar: true        
            });

    	
        
    });
    
    $(function(){//도착시간 : 출발시간 + 2시간
    	          
        $("#time1").timepicker({
            timeFormat: 'HH:mm',
            interval: 5,
            minTime: '10',
            maxTime: '21',
            defaultTime: '10',
            startTime: '10',
            dynamic: false,
            dropdown: true,
            scrollbar: true
            

          
        });
    })
    
    
    </script>
	 <!--footer-->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>