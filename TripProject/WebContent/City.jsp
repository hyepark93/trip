<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--16개 시도 리스트-->
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>TRAVEL-JAVA > 도시</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<style>
*, html, body {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.top {
	position: fixed;
	display: flex;
	justify-content: space-between;
	width: 100%;
	height: 80px;
	background-color: black;
	z-index: 10000;
}

.beforeLog, .afterLog {
	position: relative;
	right: 0;
	display: flex;
	justify-content: flex-end;
	color: white;
	font-size: 20px;
}

.afterLog {
	display: none;
}

.beforeLog>div {
	border: 1px solid rgba(0, 0, 0, 0);
	padding: 22px 5px;
}
/*------로고------*/
.logo {
	width: 100px;
	right: 88%;
}

.logo:hover {
	cursor: pointer;
}

.logo img {
	width: 100%;
}
/*------로그인팝업------*/
.login {
	border: 1px solid black;
}

.logpop {
	position: absolute;
	height: 0;
	display: none;
	height: 140px;
	top: 85px;
	right: 10px;
	color: black;
	background-color: white;
	border: 1px solid gray;
	border-radius: 10px;
	padding: 10px;
}

/* ---------상단바 프로필 이미지---------*/
.proimg {
	width: 50px;
	text-align: center;
	margin-top: 12px;
	margin-right: 10px;
}

.proimg:hover {
	cursor: pointer;
}

.proimg>img {
	width: 100%;
}
/* ---------정보팝업---------*/
.wrap_login {
	display: none;
	width: 230px;
	border: 1px solid black;
	position: absolute;
	background-color: white;
	color: black;
	top: 85px;
	right: 10px;
	border-radius: 10px;
}

.myinfo {
	width: 100%;
	display: flex;
}

.myinfo>div:nth-child(1) {
	width: 30%;
}

.myinfo>div:nth-child(2) {
	padding: 5px 0;
}

.myinfo>div>div {
	padding: 5px 10px;
}

.myinfo>div>img {
	width: 100%;
	margin: 8px 0px 5px 5px; /* 
	margin-left: 5px;
	margin-top: 5px; */
}

.list {
	border-top: 1px solid;
	border-color: rgba(0, 0, 0, .15);
}

.mypage {
	cursor: pointer;
}

.list>div {
	padding: 7px 10px;
	cursor: pointer;
}

.list>div:hover {
	background-color: rgba(0, 0, 0, 0.05);
}

/*회원가입*/
.tijoin {
	font-size: 25px;
	margin-left: 170px;
}

.new {
	z-index: 999999;
	width: 450px;
	height: 600px;
	background-color: white;
	opacity: 0;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	top: 1000px;
	display: none;
	border: 3px solid gray;
	border-radius: 10px;
	width: 450px;
}

table {
	border-collapse: collapse;
	margin: 0 auto;
	width: 500px;
	height: 400px;
	text-align: center;
}

th {
	height: 40px;
	width: 100px;
}

.id1, .pw1, .name1, .email1, .birth1 {
	width: 200px;
	height: 30px;
	background-color: white;
	border-color: gray;
	border-radius: 5px;
}

#x {
	margin-left: 400px;
	margin-top: 10px;
	color: gray;
}

.gab {
	margin-left: 140px;
	margin-top: 20px;
	width: 50px;
	height: 30px;
	background-color: black;
	color: white;
}

.can {
	width: 50px;
	height: 30px;
	margin-left: 50px;
	background-color: black;
	color: white;
}
/*내용*/
.wrap {
	border: 1px solid white;
	margin: 0 auto;
	width: 1024px;
}

.wrap>div:nth-child(1) { /* 내용 첫멘트 */
	margin-top: 105px;
	text-align: center;
	font-size: 30px;
}

.wrap>div:nth-child(2) { /* 내용 2멘트 */
	margin-top: 10px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 10px;
}

.middle {
	margin: 10px auto;
	width: 100%;
	height: 100vh;
	display: flex;
	flex-flow: row wrap;
	justify-content: space-around;
}

.cityBox {
	border-radius: 10px;
	width: 230px;
	margin: 10px 10px 10px;
	height: 300px;
	color: black;
	font-size: 20px;
	font-family: 'Jua', sans-serif;
	text-align: center;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.cityBox:HOVER {
	cursor: pointer;
	border: 1px solid gray;
}

.cityBox div {
	width: 100%;
	padding: 10px;
	position: absolute;
	bottom: 0;
	background-color: rgba(0, 0, 0, .7);
	color: white;
	border-radius: 0px 0px 10px 10px;
}

/*-----------------------------------------*/

.middle600 {
	width: 100%;
	margin: 30px auto 0px;
	display: none;
}

.box1, .box2, .box3, .box4, .box5 { /*이미지 보이는 박스*/
	margin: 0 auto;
	width: 435px;
	height: 300px;
	overflow: hidden;
	margin-bottom: 10px;
	border-radius: 10px;
	position: relative;
}

.ri1, .ri2, .ri3, .ri4, .ri5 {
	position: absolute;
	top: 140px;
	right: 10px;
	font-size: 30px;
	color: white;
	z-index: 1000;
}

.le1, .le2, .le3, .le4, .le5 {
	position: absolute;
	top: 140px;
	left: 10px;
	font-size: 30px;
	color: white;
	z-index: 1000;
}

.img1, .img3, .img4 {
	width: 300%;
	display: flex;
	position: absolute;
}

.img2 {
	width: 500%;
	display: flex;
	position: absolute;
}

.img5 {
	width: 200%;
	display: flex;
	position: absolute;
}

.pname {
	font-size: 15px;
	font-weight: bolder;
	padding-top: 10px;
	margin: 10px;
	border-top: 1px solid;
	border-color: rgba(0, 0, 0, 0.2);
}

.middle600>div>div>div {
	width: 700px;
	height: 300px;
	font-family: 'Jua', sans-serif;
	color: white;
	font-size: 30px;
	text-align: center;
}

.dot {
	width: 100%;
	display: flex;
	justify-content: center;
	border: 1px solid red;
	font-size: 10px;
}

.dot>div {
	padding: 2px;
}

@media ( max-width :1024px) {
	.wrap {
		width: 100%;
	}
}

@media ( max-width :800px) {
	.wrap {
		width: 100%;
	}
}

@media ( max-width :600px) {
	.middle {
		display: none;
	}
	.middle600 {
		display: block;
	}
}
</style>
</head>
<body>
	<!-- 상단바 -->
	<div class="top">
		<div class="logo">
			<img src="img/logo.png">
		</div>
		<!-- 로그인 전 상단바 -->

		<div class="beforeLog">
			<div class="login" style="cursor: pointer">LOGIN</div>
			<form action="login.do" method="post">
				<div class="logpop">
					ID <br> <input type="text" name="id"> <br>
					PASSWORD <br> <input type="password" name="pw"> <br>
					<input type="submit" value="Login">
				</div>
			</form>
			<div style="cursor: pointer" class="join">JOIN</div>
			<div class="menubar"></div>
		</div>

		<!--  로그인 후 상단바 -->
		<div class="afterLog">
			<div class="proimg">
				<img src="img/icon.png" alt="">
			</div>
			<div class="wrap_login">
				<div class="myinfo">
					<div>
						<img src="img/icon.png" alt="">
					</div>
					<div>
						<div><%=(String) session.getAttribute("loginID")%></div>
						<div>마이페이지</div>
					</div>
				</div>
				<div class="list">
					<div class="uppro">회원정보변경</div>
					<div class="logout">로그아웃</div>
					<hr>
					<div class="notice">공지사항</div>
					<div class="review">리뷰게시판</div>
					<div class="cs">고객센터</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 회원가입 -->
	<form action="regist.do" method="post">
		<div class="new">
			<i class="fas fa-times fa-2x" id="x"></i>
			<div class="tijoin">회원가입</div>
			<table>
				<tr>
					<th>아이디</th>
					<th><input type="text" name="id" class="id1"></th>
				</tr>
				<tr>
					<th>패스워드</th>
					<th><input type="password" name="pw" class="pw1"></th>
				</tr>
				<tr>
					<th>닉네임</th>
					<th><input type="text" name="name" class="name1"></th>
				</tr>
				<tr>
					<th>이메일</th>
					<th><input type="email" name="email" class="email1"></th>
				</tr>
				<tr>
					<th>성별</th>
					<th><input type="radio" name="sex" value="man">남 <input
						type="radio" name="sex" value="woman">여</th>
				</tr>
				<tr>
					<th>생년월일</th>
					<th><input type="date" name="age" class="birth1"></th>
				</tr>
			</table>
			<input class="gab" type="submit" value="가입"> <input
				type="button" class="can" value="취소">
		</div>
	</form>

	<!-- 내용 -->

	<div class="wrap">
		<div>which city do you wanna go?</div>
		<div>choose the city you wanna explore :D ! !</div>
		<div class="middle">
			<div class="cityBox" onclick="goCity('051')"
				style="background: url(img/busan.jpg) center"><div>부산</div></div>
			<div class="cityBox" onclick="goCity('02')"
				style="background: url(img/seoul.jpg) center"><div>서울</div></div>
			<div class="cityBox" onclick="goCity('042')"
				style="background: url(img/daejeon.jfif) center"><div>대전</div></div>
			<div class="cityBox" onclick="goCity('053')"
				style="background: url(img/daegu.jpg) center"><div>대구</div></div>
			<div class="cityBox" onclick="goCity('032')"
				style="background: url(img/incheon.png) center"><div>인천</div></div>
			<div class="cityBox" onclick="goCity('052')"
				style="background: url(img/ulsan.jfif) center"><div>울산</div></div>
			<div class="cityBox" onclick="goCity('062')"
				style="background: url(img/gwangju.jpg) center"><div>광주</div></div>
			<div class="cityBox" onclick="goCity('031')"
				style="background: url(img/busan.jpg) center"><div>경기</div></div>
			<div class="cityBox" onclick="goCity('063')"
				style="background: url(img/busan.jpg) center"><div>전북</div></div>
			<div class="cityBox" onclick="goCity('061')"
				style="background: url(img/busan.jpg) center"><div>전남</div></div>
			<div class="cityBox" onclick="goCity('043')"
				style="background: url(img/chungbuk.jpg) center"><div>충북</div></div>
			<div class="cityBox" onclick="goCity('041')"
				style="background: url(img/chungnam.jfif) center"><div>충남</div></div>
			<div class="cityBox" onclick="goCity('033')"
				style="background: url(img/busan.jpg) center"><div>강원</div></div>
			<div class="cityBox" onclick="goCity('054')"
				style="background: url(img/busan.jpg) center"><div>경북</div></div>
			<div class="cityBox" onclick="goCity('055')"
				style="background: url(img/busan.jpg) center"><div>경남</div></div>
			<div class="cityBox" onclick="goCity('064')"
				style="background: url(img/busan.jpg) center"><div>제주</div></div>
		</div>


		<div class="middle600">
			<div class="pname">수도권</div>
			<div class="box1">
				<div class="le1">
					<i class="fas fa-arrow-circle-left"></i>
				</div>
				<div class="ri1">
					<i class="fas fa-arrow-circle-right"></i>
				</div>
				<div class="img1">
					<div onclick="goCity('02')"
						style="background: url(img/seoul.jpg) center">서울</div>
					<div onclick="goCity('032')"
						style="background: url(img/incheon.png) center">인천</div>
					<div onclick="goCity('031')"
						style="background: url(img/busan.jpg) center">경기</div>
				</div>
			</div>

			<div class="pname">경상권</div>
			<div class="box2">
				<div class="le2">
					<i class="fas fa-arrow-circle-left"></i>
				</div>
				<div class="ri2">
					<i class="fas fa-arrow-circle-right"></i>
				</div>
				<div class="img2">
					<div onclick="goCity('051')"
						style="background: url(img/busan.jpg) center">부산</div>
					<div onclick="goCity('053')"
						style="background: url(img/daegu.jpg) center">대구</div>
					<div onclick="goCity('052')"
						style="background: url(img/ulsan.jfif) center">울산</div>
					<div onclick="goCity('054')"
						style="background: url(img/busan.jpg) center">경북</div>
					<div onclick="goCity('055')"
						style="background: url(img/busan.jpg) center">경남</div>
				</div>
			</div>

			<div class="pname">충청권</div>
			<div class="box3">
				<div class="le3">
					<i class="fas fa-arrow-circle-left"></i>
				</div>
				<div class="ri3">
					<i class="fas fa-arrow-circle-right"></i>
				</div>
				<div class="img3">
					<div onclick="goCity('042')"
						style="background: url(img/daejeon.jfif) center">대전</div>
					<div onclick="goCity('041')"
						style="background: url(img/chungbuk.jpg) center">충북</div>
					<div onclick="goCity('043')"
						style="background: url(img/chungnam.jfif) center">충남</div>
				</div>
			</div>

			<div class="pname">전라권</div>
			<div class="box4">
				<div class="le4">
					<i class="fas fa-arrow-circle-left"></i>
				</div>
				<div class="ri4">
					<i class="fas fa-arrow-circle-right"></i>
				</div>
				<div class="img4">
					<div onclick="goCity('062')"
						style="background: url(img/gwangju.jpg) center">광주</div>
					<div onclick="goCity('063')"
						style="background: url(img/busan.jpg) center">전북</div>
					<div onclick="goCity('061')"
						style="background: url(img/busan.jpg) center">전남</div>
				</div>
			</div>

			<div class="pname">강원/제주</div>
			<div class="box5">
				<div class="le5">
					<i class="fas fa-arrow-circle-left"></i>
				</div>
				<div class="ri5">
					<i class="fas fa-arrow-circle-right"></i>
				</div>
				<div class="img5">
					<div onclick="goCity('033')"
						style="background: url(img/busan.jpg) center">강원</div>
					<div onclick="goCity('064')"
						style="background: url(img/busan.jpg) center">제주</div>
				</div>
			</div>
			<!-- <div>
				<br> copy copy copy copy copy copy copy copy copy copy copy
				copy copy copy <br> <br>

			</div> -->
		</div>
	</div>

	<script>
		/* 회원가입 */
		$(function() {
			$(".join").click(function() {
				$(".new").css("display", "block");
				$(".new").animate({
					opacity : 1,
					top : '200px'
				});
			});
			$("#x, .can").click(function() {
				$(".new").animate({
					opacity : 0,
					top : '1000px'
				}, function() {
					$(".new").css("display", "none");
				});
			});
		});
		/* 마이페이지 */
		$(".mypage").click(function() {
			location.href = "mypage.do";
		});
		/* 회원정보수정 */
		$(".uppro").click(function() {
			location.href = "uppro.do";
		});
		/* 로그아웃 */
		$(".logout").click(function() {
			location.href = "logout.do";
		});
		/* 공지사항 */
		$(".notice").click(function() {
			location.href = "notice.do";
		});
		/* 리뷰 */
		$(".review").click(function() {
			location.href = "review.do";
		});
		/* 고객센터 */
		$(".cs").click(function() {
			location.href = "cs.do";
		});

		$(".logo").click(function() {
			location.href = "Main.do";
		});

		$(function() {
			$(".login").click(function() {
				if ($('.logpop').css('display') == 'none') {
					$('.logpop').show();
				} else {
					$('.logpop').hide();
				}
			});
			$(".proimg").click(function() {
				if ($('.wrap_login').css('display') == 'none') {
					$('.wrap_login').show();
				} else {
					$('.wrap_login').hide();
				}
			});

		});
	<%if ((String) session.getAttribute("loginID") != null) {%>
		$(".beforeLog").css("display", "none");
		$(".afterLog").css("display", "block");
	<%}%>
		$(function() {
			var size1 = 0;
			var size2 = 0;
			var size3 = 0;
			var size4 = 0;
			var size5 = 0;

			$(".le1").click(function() {
				if (size1 < 0) {
					size1 += 435;
					$(".img1").animate({
						left : size1 + 'px'
					});
				}
			});
			$(".ri1").click(function() {
				if (size1 > -870) {
					size1 -= 435;
					$(".img1").animate({
						left : size1 + 'px'
					});
				}
			});
			$(".le3").click(function() {
				if (size3 < 0) {
					size3 += 435;
					$(".img3").animate({
						left : size3 + 'px'
					});
				}
			});
			$(".ri3").click(function() {
				if (size3 > -870) {
					size3 -= 435;
					$(".img3").animate({
						left : size3 + 'px'
					});
				}
			});

			$(".le4").click(function() {
				if (size4 < 0) {
					size4 += 435;
					$(".img4").animate({
						left : size4 + 'px'
					});
				}
			});
			$(".ri4").click(function() {
				if (size4 > -870) {
					size4 -= 435;
					$(".img4").animate({
						left : size4 + 'px'
					});
				}
			});

			$(".le2").click(function() {
				if (size2 < 0) {
					size2 += 435;
					$(".img2").animate({
						left : size2 + 'px'
					});
				}
			});
			$(".ri2").click(function() {
				if (size2 > -1740) {
					size2 -= 435;
					$(".img2").animate({
						left : size2 + 'px'
					});
				}
			});

			$(".le5").click(function() {
				if (size5 < 0) {
					size5 += 435;
					$(".img5").animate({
						left : size5 + 'px'
					});
				}
			});
			$(".ri5").click(function() {
				if (size5 > -435) {
					size5 -= 435;
					$(".img5").animate({
						left : size5 + 'px'
					});
				}
			});

		});

		function goCity(code) {
			location.href = "place.do?code=" + code;
		}
	</script>
</body>
</html>