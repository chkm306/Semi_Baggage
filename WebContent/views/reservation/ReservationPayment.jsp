<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약폼타고옴</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>

        #wrapper_page{
            max-width: 1000px;
            margin: 0 auto;
            margin-left: 650px;
            
        }


        .reseve_img{
            padding: auto;
            margin: auto;
           
        }

        .info{
            font-size: 16px;
            margin: 0;
            padding: 10px;
            border: 1px solid black;
        }

        .form_control{
            font-size: 15px;
            padding: auto;
            margin: 10px;
            width: 240px;
        }

        .name{
            padding-right: 48px;
        }

        .size_box { /*짐*/
            display: flex;
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            float: left;
            text-align: left;
            width: 50%;
            font-weight: bold;
        }

        .price_box{ /*금액*/
            
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            float: right;
            text-align: right;
            width: 50%; 
            font-weight: bold;
        }
       

        .non-res_form{
            max-width: 800px;
            margin: 0;
            padding: 0 10px;
            text-align:center;
        }

        .res_subject{
            
            margin-top: 30px;
            font-size: 25px;
            padding: 5px;
            margin-bottom: 5px;
            
        }

        .cart_list1{
            
            height: 60px;
            background-color: rgb(12, 101, 166);
            border-radius: 10px 10px 0 0;
            padding: 0 15px;
            color: white;
        }

         
        .res_spot{
            position: relative;
            height: 130px;
            padding-top: 20px;
            border: 1px solid black;
            margin-bottom: 25px;
            border-top: 0;
            

        }

        .res_data{
            display: inline;
            font-size: 20px;
            margin: 0;
        }

        .spot{
            display: flex;
            justify-content: space-evenly;
        }


        ._spot{
            display: flex;
            
            font-size: 25px;
            margin: 10px 0;
            text-align: center;
        }

        .res_date{
            display: flex;
            justify-content: space-around;
            margin-left: 0px;
            position: relative;
            font-size: 12px;
        }

        .btn{
            position: relative;
            text-align: center;
            margin: 5px;
            margin-bottom: 40px;
            margin-right: 200px;
        }
        .delete{
            
            background-color: rgb(50, 65, 1);
            color: white;
            width: 100px;
            height: 30px;
            border-radius : 4px 4px 4px 4px;
            border-color: rgb(50, 65, 1);
            font-size: large;
        }

        .wrap_box{
            position: relative;
            border: 1px solid black;
            border-radius: 10px 10px 10px 10px;
            width: 600px;
            text-align: center;
        
            
        }

        #tot_price{
            text-align: center;
            padding: 30px;
            margin: 0;
            font-size: 25px;
            font-weight: bold;
            margin-right: 200px;
        }

        #display_pay_btn{
            text-align: center;
            margin-right: 200px;
            padding: 10px;
        }

        .btn_submit{
            width: 100px;
            height: 30px;
            background-color: rgb(50, 65, 1);
            color: white;
            border-radius : 4px 4px 4px 4px;
            border-color: rgb(50, 65, 1);
            font-size: large;
        }
        
        .modal{ 
		  	position:relative; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
		}
	
		.modal_content{
			  width:400px; height:200px;
			  background:#fff; border-radius:10px;
			  position:relative; top:50%; left:50%;
			  margin-top:-100px; margin-left:-200px;
			  text-align:center;
			  box-sizing:border-box; padding:74px 0;
			  line-height:23px; cursor:pointer;
		}
		
		#btn_close{
			 background-color: rgb(50, 65, 1);
			 border-color: rgb(50, 65, 1);
			 color:white;
		}
		
		#pay{
			 background-color: rgb(50, 65, 1);
			 border-color: rgb(50, 65, 1);
			 color:white;
		}
    </style>
</head>

<body>
	<!--navigation-->
	<%@ include file="../common/menubar.jsp" %>

    <div class= "reseve_img">
        <img src="resources/images/reservation.jpg" alt="" >       
	</div>

    <div id="wrapper_page">
        <div id="confirm">
        <div class="non-res_form">
            <br>
            <h1>예약신청서</h1>
        
            
            <form>
                <div class="info">
                    <label class="name">이름  </label>
                    <input type="text" class="form_control" id="name" name="name" placeholder="이름을 입력해주세요" required>
                    <div id="checkResult" style="display:none; font-size:0.8em"></div>
                    <br>
                    <label>휴대폰번호  </label>
                    <input type="tel" class="form_control" id="phone" name="phone" placeholder="휴대폰번호를 입력해주세요(-없이)" required>

                </div>
                <h2 class="res_subject">예약정보</h2>
                <div class="cart_list1">
                    <div class="size_box">
                        <label class="res_data">짐 : </label>
                        <span class="res_size_count">
                            <div class="amount"> </div>
                        </span>
                    </div>
                    <div class="price_box">
                        <label class="res_data">금액 : </label>
                        <span>
                            <b class="price"> </b>
                        </span>
                    </div>
                </div>

                <div class="res_spot">
                    <label class="res_data">
                        <div class="spot">
                            <div class="_spot">서울역(출발장소출력)</div>
                            <span> --></span>
                            <div class="_spot">부산역(도착장소출력)</div>

                        </div>
                   
                    </label>

                    <span class="res_date">
                        <div>출발 일정</div>
                        <div>도착 일정</div>
                    </span>
                </div>
        	
       	</form>
       </div>
    </div>
    </div>
    
    <div class="btn">
    <input type="button" class="delete" value="예약취소" onclick="location.href='reservationCheck.do'">
    </div>
    <div class="wrap_box">
        <p>
            <span>* 비회원 예약 조회는 로그인 창에서 확인가능합니다.</span>
        </p>
        <p>
            <span>* 거리가 너무 먼 지역은 배송 불가능합니다.</span>
        </p>
    </div>
    
    <div id="payment">
        
        <div id="tot_price">
            <hr>
            <span>총 결제금액</span>
            <b class="print_price"></b>
        </div>
        <div id="display_pay_btn" class="pay_btn">
            <input type="button" value="결제하기" class="btn_submit">

        </div>

    </div>
  
    

	<div class="modal">
	  <div class="modal_content" 
	       title="클릭하면 창이 닫힙니다.">
	    <label>카드번호</label>
	    <input type="tel" maxlength="16" class="card_num" placeholder="(-없이)1234567812345678">
	    <br><br>
	    <button type="submit" id="pay" onclick="location.href='reservationComplete.do'">확인</button>
	    <button type="button" id= "btn_close" class = "close">취소</button>
	  </div>
	</div>
    

     <!--footer-->
	<%@ include file="../common/footer.jsp" %>
</body>

    <script>
    
    


    	  $(".btn_submit").click(function(){
    	    $(".modal").fadeIn();
    	  });
    	  
    	     //팝업 Close 기능
	       $('#btn_close').click(function(){
	                $('.modal').hide();
	        });


    
    </script>


</html>