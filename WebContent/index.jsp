<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
	.content{
			width:70%;
			height:800px;
		
		}
		
	
</style>
</head>
<body>

	<%@ include file = "views/common/menubar.jsp" %>
	<div class="main-reservation">
	
	</div>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>index</title>
<style>

	
#myCarousel{

    color: #5a5a5a;
  }

  .carousel {
    margin-bottom: 4rem;
  }

  .carousel-caption {
    bottom: 3rem;
    z-index: 10;
  }
  .carousel-item {
      height: 42rem;
  }

  .carousel-item > img {
    position: absolute;
    top: 0;
    left: 0;
    min-width: 100%;
    height: 42rem;
  }
  .container p{
    font-family: 'Nanum Gothic', sans-serif;
  }
  
  .marketing .col-lg-4 {
    margin-bottom: 1.5rem;
    text-align: center;
  }

  .marketing h2 {
    font-weight: 400;
  }
  .marketing .col-lg-4 p {
    margin-right: .75rem;
    margin-left: .75rem;
  }
  
  
  .featurette-divider {
    margin: 5rem 0;
  }
  
  .featurette-heading {
    font-weight: 300;
    line-height: 1;
    letter-spacing: -.05rem;
  }
  
  @media (min-width: 40em) {
    .carousel-caption p {
      margin-bottom: 1.25rem;
      font-size: 1.25rem;
      line-height: 1.4;
    }
  
    .featurette-heading {
      font-size: 50px;
    }
  }
  
  @media (min-width: 62em) {
    .featurette-heading {
      margin-top: 7rem;
    }
  }
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>
	
	
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
                <h1>BAGGAGE_1</h1>
                <p>여행의 즐거움은 자유로부터 시작된다.</p>
                <!-- <p><a class="btn btn-lg btn-primary" href="#">Reservation</a></p>-->
                </div>
            </div>
            </div>

            <div class="carousel-item">
            <img src="resources/images/banner02.jpg" alt="">
            <div class="container">
                <div class="carousel-caption">
                <h1>BAGGAGE_2</h1>
                <p>여행의 즐거움은 자유로부터 시작된다.</p>
                <!-- <p><a class="btn btn-lg btn-primary" href="#">이용 후기</a></p>-->
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

    <main>
        <!-- 예약 바가 될 무언가 -->

        <div class="Reserv_bar">

            <form action="<%=request.getContextPath()%>/Reserv.do" method="get">
                <table>
                    <tr>
                        <label for="운송">운송 : </label>
                        <input type="radio" name="예약방법" value="운송">
                        <label for="보관">보관 : </label>
                        <input type="radio" name="예약방법" value="보관"><br>
                    </tr>
                    <tr>
                        <label for="맡길날짜">맡길 날짜 : </label>
                        <input type="date" name="dateInput" id="맡길날짜"> &nbsp;
                    </tr>
                    <tr>
                        <label for="찾을날짜">찾을 날짜 : </label>
                        <input type="date" name="dateInput" id="찾을날짜"><br>
                    </tr>
                    <tr>
                        <label for="맡길 장소">맡길 장소 : </label>
                        <input type="text" size="30" name="맡길 장소"> &nbsp;
                    </tr>
                    <tr>
                        <label for="찾을 장소">찾을 장소 : </label>
                        <input type="text" size="30" name="찾을 장소"><br>
                    </tr>
                    <tr>
                        <label for="규격">규격 : </label>
                        <select name="규격" size="3" multiple>
                            <option value="small">작음 (?~?cm)</option>
                            <option value="medium">중간 (?~?cm)</option>
                            <option value="large">큼 (?~?cm)</option>
                            <option selected>-----</option>
                        </select>
                    </tr>
                </table>
                <div class ="btns" align="center">
                    <button id = "예약Btn" type="submit">예약</button>
                </div>
            </form>
        </div>
        <!-- 이미지 박스 -->
        <div class="Reserv_info">
            <img src="resources/images/test.png" alt="" style="width: 100%;">
            
        </div>

    </main>


	
	<div class="content">
	
	
	</div>
	


	
	
	
	
	<!-- 부트스트랩 자스코드 -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	    <a style="display:scroll; position:fixed; bottom:3rem; right:3rem; color: #a2cdf2;" href="#" id="angle_up"><i class="fa-solid fa-circle-arrow-up fa-3x"></i></i></a>

	<%@ include file="views/common/footer.jsp" %> 
</body>
</html>