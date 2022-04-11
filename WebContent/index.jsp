<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic:wght@700&family=Vibur&display=swap" rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/2bf1fadc44.js" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
<title>Baggage</title>

</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>
	<div class="main-reservation">
	
    <!-- 슬라이더 시작 {-->
    <!-- 슬라이드 페이징 -->
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>

        <!-- 슬라이드 내용 및 이미지 -->
        <div class="carousel-inner">
            <div class="carousel-item active">
            <img src="resources/images/banner01.jpg" alt="">
            <div class="container">
                <div class="carousel-caption text-start">
                <h1 style="font-family: 'Vibur', cursive; font-size:120px;">Baggage</h1><br>
                <p style="font-family: 'Jua', sans-serif; font-size:25px">가방으로부터 자유로운 여행</p>
                </div>
            </div>
            </div>

            <div class="carousel-item">
            <img src="resources/images/banner02.png" alt="">
            <div class="container">
                <div class="carousel-caption">
                <p><a class="btn btn-lg btn-primary" href="<%= request.getContextPath()%>/listReserve.do">예약하기</a></p>
                </div>
            </div>
            </div>

            <div class="carousel-item">
            <img src="resources/images/banner03.jpg" alt="">
            <div class="container">
                <div class="carousel-caption text-end">
                <h1>BAGGAGE_3</h1>
                <p>여행의 즐거움은 자유로부터 시작된다.</p>
                <p><a class="btn btn-lg btn-primary" href="#">gallery</a></p>
                </div>
            </div>
            </div>
        </div>
        <!-- 슬라이드 버튼 -->
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <!-- } 슬라이드 끝 -->
    
	<!-- 간편 예약바 시작 -->
	<input type="checkbox" id="check">
    <label class="chat-btn" for="check" style="font-family: 'Jua', sans-serif; opacity: 0.9;">
    	간편 예약
    </label>

    <div class="wrapper" style="position:fixed;">
        <div class="header">
            <h6>간편 예약하기</h6>
        </div>
        <form action="<%=request.getContextPath()%>예약 정보" method="get">
            <table id="Reserv_form">
                <tr>
                    <td>예약 방법</td>
                    <td>운송 <input type="radio" name="예약방법" value="운송"></td>
                    <td>보관 <input type="radio" name="예약방법" value="보관"></td>
                </tr>
                <tr>
                    <td>맡길 날짜</td>
                    <td colspan="2"><input type="date" name="dateInput" id="맡길날짜"></td>
                </tr>
                <tr>
                    <td>맡길 장소</td>
                    <td colspan="2"><input type="text" size="30" name="맡길 장소"></td>
                </tr>
                <tr>
                    <td>찾을 날짜</td>
                    <td colspan="2"><input type="date" name="dateInput" id="찾을날짜"></td>
                </tr>
                <tr>
                    <td>찾을 장소</td>
                    <td colspan="2"><input type="text" size="30" name="찾을 장소"></td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td></td>
                </tr>
            </table>
            <div class ="btns" align="center">
                <button id = "예약Btn" type="submit">예약</button>
            </div>
        </form>
    </div>
	<!-- 간편 예약바 끝 -->
    <main>
        <!-- 이미지 박스 -->
        <div class="Reserv_info">
            <img src="resources/images/test.png" alt="" style="width: 100%;">
        </div>
    </main>
	</div>
	
	
	
	
	
	<!-- 부트스트랩 자스코드 -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	    <a style="display:scroll; position:fixed; bottom:30px; right:30px; color: #a2cdf2;" href="#" id="angle_up"><i class="fa-solid fa-circle-arrow-up fa-3x"></i></i></a>

	<%@ include file="views/common/footer.jsp" %> 
</body>
</html>