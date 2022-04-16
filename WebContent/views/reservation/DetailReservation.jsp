<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/*
	Reservation r = (Reservation)request.getAttribute("reserved"); //insertReseravtion에서 정보를 받아오면 될듯
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
    <title>예약페이지</title>
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
        
        h1{
        	
            text-align: center;
            margin: auto;
            margin-top: 80px;
            
            }

        .page_form{
            width:600px;
            height:500px;
            color:black;
            margin:auto;
            margin-top:80px;
            text-align: left;
            



        }
        
        
        .info{
            border: 1px solid black;
            margin-top: 40px;
            padding: 10px;
            line-height: 50px;
            width: 600px;
            height: 350px;
        }
        
        label{
        font-size: 25px;
        }

        /* .form_control_name{
            width: 240px;
            margin-left: 80px;
        }
        .form_control_ph{
            width: 240px;
            margin-left: 30px;
        } */

        .form_control_bag{
            width: 250px;
            margin-left: 115px;
        }
        .lb_1{
            margin-left: 45px;
            width: 250px;
        }

        .next_btn{
            margin-top: 50px;
            text-align: center;
        }

        .btn{
            background-color: rgb(50, 65, 1);
            color: white;
            border-radius: 4px 4px 4px 4px;
            text-align:center;
            margin-bottom: 20px;
            width: 100px;
            height: 30px;
            font-size: large;
        }
        
        .dropdown{
        	position: absolute;
		    top: 100%;
		    left: 0;
		    z-index: 1000;
		    display: none;
		    float: left;
		    min-width: 160px;
		    padding: 5px 0;
		    /* margin: 2px 0 0; */
		    font-size: 14px;
		    text-align: left;
		    list-style: none;
		    background-color: #fff;
		    -webkit-background-clip: padding-box;
		    background-clip: padding-box;
		    border: 1px solid #ccc;
		    border: 1px solid rgba(0,0,0,.15);
		    border-radius: 4px;
		    webkit-box-shadow: 0 6px 12px rgb(0 0 0 / 18%);
		    box-shadow: 0 6px 12px rgb(0 0 0 / 18%);
        }
        
        .modal_content{
			  width:400px;
			  height:300px;
			  text-align:center;
			  box-sizing:border-box;
			  padding:74px 0;
			  line-height:23px;
			  cursor:pointer;
		}

	/*	.bag_modal{
				background-color: rgb(50, 65, 1);
				color:white;
				margin-left:10px
		}	*/
		
		#btn_close{
				margin-top: 5px;
				text-align: center;
				background-color: rgb(50, 65, 1);
				color:white;
		}
		
		#selectBtn{
				background-color: rgb(50, 65, 1);
				color:white;
		}
		
		#quantity{
				width:80px;
				height:20px;
		}
    </style>
</head>
<body>
	 <!--navigation-->
	<%@ include file="../common/menubar.jsp" %>
	
    <div class= "reseve_img">
        <img src="resources/images/reservation.jpg" alt="" >       
	</div>
    <h1>예약신청서</h1>
    
        <form id="reservationForm" class="page_form" action="<%=request.getContextPath()%>/insertReservation.do" method="post">
            <div class="page">
            <div class="info" >
                <label>짐</label><input type="text" class="form_control_bag" value="" placeholder="사이즈/수량"  data-toggle="dropdown" readonly >
          	<%--<input type="button" class="bag_modal" value="선택" data-toggle="modal" data-target="#modal" > --%><br> 
                <label>출발장소</label>
                    <input type="text" name="searchText" value="" class="lb_1"><br>
                <label>출발날짜</label>
                    <input type="text" name ="start_time" value="" class="lb_1" id="datepicker" readonly><br>
                <label for="time">출발시간</label>
                    <input type="text" id="time" name ="str_time" value="" class="lb_1"><br>
                <label>도착장소</label>
                    <input type="text" name="searchText" value=""  class="lb_1"><br>
                <label for="time">도착시간</label>
                <input type="text" id="time1" name ="arr_time" value=""  class="lb_1"><br>
            </div>

            <div class="next_btn">
                <input type="button" value="확인" class="btn" onclick="location.href='reservationPayment.do'">
                
            </div>
        </div>
        </form>



		<div class="dropdown">
		<form method = "post" action="">
			<div class="modal_content">
			  <ul class="dropdown-menu carrier_list">
               <li>
                  <span>수하물정보</span>
                  <span class="dropdown-toggle pull-right" data-toggle="dropdown" style="cursor:pointer;"></span>
               </li>
               <li role="separator" class="divider"></li>
                              <li>
                  <span class="cr_name">S</span>  
                  <span class="pull-right" style="">
                     <button type="button" class="cr_qty_minus">-</button>
                     <input type="text" name="cr_qty[0][]" value="0" class="frm_input text-center" >
                     <button type="button" class="cr_qty_plus">+</button>
                  </span>
                  <input type="hidden" name="cr_id[0]" value="7">
                  <input type="hidden" name="cr_name[0]" value="S">
                  <input type="hidden" name="cr_price[0]" value="0">
               </li>
                <li>
                  <span class="cr_name">M</span>  
                  <span class="pull-right" style="">
                     <button type="button" class="cr_qty_minus">-</button>
                     <input type="text" name="cr_qty[1][]" value="0" class="frm_input text-center">
                     <button type="button" class="cr_qty_plus">+</button>
                  </span>
                  <input type="hidden" name="cr_id[1]" value="8">
                  <input type="hidden" name="cr_name[1]" value="M">
                  <input type="hidden" name="cr_price[1]" value="5000">
               </li>
                <li>
                  <span class="cr_name">L</span>  
                  <span class="pull-right" style="">
                     <button type="button" class="cr_qty_minus">-</button>
                     <input type="text" name="cr_qty[2][]" value="0" class="frm_input text-center" >
                     <button type="button" class="cr_qty_plus">+</button>
                  </span>
                  <input type="hidden" name="cr_id[2]" value="9">
                  <input type="hidden" name="cr_name[2]" value="L">
                  <input type="hidden" name="cr_price[2]" value="5000">
               </li>
            </ul>
            		<button type="submit" id="selectBtn" class ="select">확인</button>
            		<button type="button" id= "btn_close" class = "close">취소</button>
			</div>
		</form>
		<script>
		</script>
		</div>

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
            
  


    		

        		//버튼 클릭시 보여줌
        		$('.form_control_bag').click(function(){
		                $('.dropdown').show();
		        });
		            
		        //팝업 Close 기능
		       $('#btn_close').click(function(){
		                $('.dropdown').hide();
		        });


            
        	
        	$(function(){
        		
        		
        		$('.cr_qty_minus').click(function(e){
        			e.preventDefault();
        			var stat = $('.frm_input text-center').text();
        			var cnt = parseInt(stat,10);
        			cnt--;
        			
        			if(cnt<=0){
                		alert('더이상 줄일수 없습니다.');
                		}
        			
        			$('.frm_input text-center').text();
        		});
        		
        		$('.cr_qty_plus').click(function(){
        			var stat = $('.frm_input text-center').text();
        			var cnt = parseInt(stat,10);
  
        			cnt++;
        			
        			
        			if(cnt>10){
                		alert('더이상 늘릴수 없습니다.');
                		}
        			 $('.frm_input text-center').text();
        		});
        	});
        	
     
  
    

		       /*	$(function(){
	        	
       		$('#up').click(function(e){
       		e.preventDefault();
       		var stat = $('#quantity').text();
       		var num = parseInt(stat,10);
       		num++;

       		if(num>10){
           		alert('더이상 늘릴수 없습니다.');
           		}
           		$('#quantity').text(num);
           	});
       		
       		$('#down').click(function(e){
           		e.preventDefault();
           		var stat = $('#quantity').text();
           		var num = parseInt(stat,10);
           		num--;
           		
           		if(num<=0){
           		alert('더이상 줄일수 없습니다.');
           		}
           		
           		$('#quantity').text(num);
           	});
       		
           }); */
       	
       
        </script>
        
        <!--footer-->
		<%@ include file="../common/footer.jsp" %>
</body>
</html>