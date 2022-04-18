<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.member.model.dto.Member"%>
<%
Member m = (Member)request.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/2bf1fadc44.js" crossorigin="anonymous"></script>
<title>Baggage - FAQ</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic:wght@700&family=Vibur&display=swap');
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }
    
    .container{
        padding: 20px 60px 100px 60px;
        position: relative;
        width: 968px;
        margin: auto;
        
        background: white;
        font-size: 20px;
    }
    
    .faqMenu{
        width: 100%;
        display: flex;
        font-size: 2rem;
        font-family: 'Jua', sans-serif;
        padding: 20px 30px;
        justify-content: center;
    }
    
    .faqMenu a{
        width:100%;
        text-decoration: none;
        text-align: center;
        padding-top: 40px;
        height: 128px;
        border-collapse: collapse;
        
        color: #0367a6;
	    border: 1px solid #d7d7d7;    
    }
    
    .faqimg{
        width: 100%;
        height: 30%;
    }
    

    /* FAQ */
    .layout{
        max-width: 800px;
        margin: 0 auto;
    }

    .qna{
        list-style: none;
        margin: 0;
        padding: 0;
        font-family: 'Nanum Gothic', sans-serif;
        line-height: 1.5;
    }
    
    .qna > li{
    padding: 10px 0;
    box-sizing: border-box;
    }
    
    /* 아이템 구분 점선 */
    .qna > li:nth-child(n+2){
    border-top: 1px dashed #aaa;
    }
    
    .qna input {
    display: none;
    }
    
    /* 제목 - 클릭 영역 */
    .qna label { 
    font-weight: bold;
    color: #000;
    margin: 20px 0 0;
    cursor: pointer;
    }
    
    /* 제목 앞 화살표 */
    .qna label::before {
    content: "▶";
    display: block;
    color: #0367a6;
    margin-right: 8px;
    float: left;
    }
    
    .qna input:checked + label::before { /* 내용 펼침 상태 제목 앞 화살표 */
    content: "▼";
    }

    .qna div { /* 내용 영역 - 기본 감춤 상태 */
    display: none;
    color: #666;
    font-size: 0.9375em;
    overflow: hidden;
    padding: 10px 0 10px 30px;
    box-sizing: border-box;
    transition: max-height 0.4s;
    }
    
    .qna input:checked + label + div { /* 내용 영역 펼침 */
    display: block;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <img src="resources/images/faqMain.jpg" alt="" class="faqimg">
    
    <div class="container">
    <h2 align="center">FAQ</h2><br>

    <div class="faqMenu">
		<a href="<%= request.getContextPath()%>/enrollFormFAQ.do" >
            <p><i class="fa-solid fa-lg fa-comments"></i>&nbsp;&nbsp;1:1 문의</p>
        </a>
        <a href="<%= request.getContextPath()%>/listMyFAQ.do">
            <p><i class="fa-solid fa-lg fa-receipt"></i>&nbsp;&nbsp;내 문의 내역</p>
        </a>
    </div>


    <br><h2 align="center">자주 묻는 질문</h2><br>
    <div class="layout">
        <ul class="qna">
            <li>
                <input type="checkbox" id="qna-1">
                <label for="qna-1">예약을 취소/환불 받고 싶어요.</label>
                <div>
                    <p>백있지의 예약 취소/환불은 아래와 같이 이루어집니다.<br>1. 홈페이지 예약: 서비스 이용 전날 21시 전까지 예약을 취소한 경우, 결제 금액의 90%를 환불받으실 수 있습니다. 서비스 이용 전날 21시 이후에는 취소는 가능하지만 환불은 불가합니다.
                    <br>2. 현장접수: 영수증을 지참하신 경우 취소/환불이 가능합니다. 단, 고객님의 수화물 운송이 시작되면 취소/환불이 불가합니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-2">
                <label for="qna-2">예약을 변경하고 싶어요.</label>
                <div>
                    <p>여행 일정이 변경되셨나요? 숙소명을 오기재하셨거나 숙소 또는 이용일자에 변동이 있으신 경우 1111-1111로 전화주시면 예약 내용 수정을 도와드리겠습니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-3">
                <label for="qna-3">백있지 예약 마감 시간은 언제인가요?</label>
                <div>
                    <p>백있지 예약은 아래와 같이 이루어집니다. <br>1. 홈페이지 예약: 서비스 이용 전날 21시까지 홈페이지에서 예약할 수 있습니다.<br>2. 당일 현장 접수: 매장에서 오후 3시 이전까지 현장 접수 가능합니다.
                    <br>※ 단, 당일 현장 접수의 경우 운송 서비스가 조기 마감되면 이용이 불가할 수 있습니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-4">
                <label for="qna-4">짐이 파손되거나 분실되면 어떻게 하나요?</label>
                <div>
                    <p>수하물의 분실 및 손실이 발생한 경우, 백있지의 실수로 발생한 것을 입증해야 하며, 입증 시 보상의 최대 금액은 1,000,000원입니다. 상세한 내용은 주문 신청 시 약관을 참고해주시기 바랍니다.</p>
                </div>
            </li>
        </ul>
    </div>
</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>