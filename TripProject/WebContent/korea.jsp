<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TRAVEL-JAVA > 전국 지도</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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
	border: 1px solid rgba(0,0,0,0);
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
	margin: 8px 0px 5px 5px;/* 
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
/* ----------회원가입------------*/
.tijoin {
	font-size: 25px;
	margin-left: 170px;
}

.new {
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
	z-index: 3;
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

/*지도*/
.map {
	width: 50%;
	margin: 0 auto;
	margin-top: 100px;
	min-width: 500px;
}

.citych1 {
	width: 100%;
	text-align: center;
	font-size: 25px;
}

.citych2 {
	width: 100%;
	text-align: center;
	font-size: 15px;
}

.map>div {
	width: 80%;
	margin: 10px auto 0;
	position: relative;
}

.map>div>div {
	position: absolute;
}

.map>div>div>div {
	display: none;
}

.map>div>div:hover>div {
	font-size: 20px;
	display: inline-block;
	width: 100px;
	font-weight: bolder
}

.map>div>div {
	width: 100px;
	cursor: pointer;
}

.map>div>.bu {
	top: 64%;
	left: 69%;
	color: aqua;
}

.map>div>.se {
	top: 22%;
	left: 43%;
	color: blue;
}

.map>div>.ta {
	top: 52%;
	left: 63%;
	color: green;
}

.map>div>.da {
	top: 43%;
	left: 48%;
	color: fuchsia;
}

.map>div>.gw {
	top: 64%;
	left: 40%;
	color: gold;
}

.map>div>.je {
	top: 93%;
	left: 36%;
	color: blueviolet;
}

.map>div>.ul {
	top: 57%;
	left: 71%;
	color: orange;
}

.map>div>.in {
	width: 30px;
	top: 22%;
	left: 39%;
	color: crimson;
}

img {
	width: 100%;
}

@media ( max-width :800px) {
	.whole {
		width: 60px;
		height: 50px;
	}
}
</style>
</head>
<body>
	<div class="wrap">
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
							<div class="mypage">마이페이지</div>
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
			<input class="gab" type="submit" value="가입">
			<input type="button" class="can" value="취소">
		</div>
	</form>

	<!-- 
	//로그인되었는지 보여주기// -->
	<div class="search">
		<input type="text" value=<%=(String) session.getAttribute("loginID")%>>&nbsp;&nbsp;&nbsp;
		<div style="cursor: pointer">검색</div>

			<div class="map">
				<div class="citych1">가고싶은 도시를 선택하세요 :D</div>
				<div class="citych2">choose the city you wanna go</div>
				<div class="mainmap">
					<img src="img/map.png" alt="">
					<div class="bu">
						<i class="fas fa-circle"></i>
						<div>부 산</div>
					</div>
					<div class="ul">
						<i class="fas fa-circle"></i>
						<div>울 산</div>
					</div>
					<div class="se">
						<i class="fas fa-circle"></i>
						<div>서 울</div>
					</div>
					<div class="ta">
						<i class="fas fa-circle"></i>
						<div>대 구</div>
					</div>
					<div class="gw">
						<i class="fas fa-circle"></i>
						<div>광 주</div>
					</div>
					<div class="da">
						<i class="fas fa-circle"></i>
						<div>대 전</div>
					</div>
					<div class="in">
						<i class="fas fa-circle"></i>
						<div>인 천</div>
					</div>
					<div class="je">
						<i class="fas fa-circle"></i>
						<div>제 주</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script>
	$(".logo").click(function() {
		location.href = "Main.do";
	});

	$(function() {
		$(".login").click(function() { /* 로그인 버튼 */
			if ($('.logpop').css('display') == 'none') {
				$('.logpop').show();
			} else {
				$('.logpop').hide();
			}
		});
		$(".proimg").click(function() { /* 로그인 후 프로필 버튼 */
			if ($('.wrap_login').css('display') == 'none') {
				$('.wrap_login').show();
			} else {
				$('.wrap_login').hide();
			}
		});

	});
	/* 로그인 전/후 버튼  */
<%if ((String) session.getAttribute("loginID") != null) {%>
	$(".beforeLog").css("display", "none");
	$(".afterLog").css("display", "block");
<%}%>
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
    $(".mypage").click(function(){
    	location.href="mypage.do";
    });
    /* 회원정보수정 */
    $(".uppro").click(function(){
    	location.href="uppro.do";
    });
	/* 로그아웃 */
	$(".logout").click(function(){
    	location.href="logout.do";
    });
	/* 공지사항 */
	$(".notice").click(function(){
    	location.href="notice.do";
    });
    /* 리뷰 */
    $(".review").click(function(){
    	location.href="review.do";
    });
    /* 고객센터 */
    $(".cs").click(function(){
    	location.href="cs.do";
    });
    $(".bu").click(function(){
        location.href="busan.do?code=051";
    });
    $(".se").click(function(){
        location.href="seoul.do?code=02";
    });
    $(".ul").click(function(){
        location.href="ulsan.do?code=052";
    });
    $(".ta").click(function(){
        location.href="daegu.do?code=053";
    });
    $(".gw").click(function(){
        location.href="gwangju.do?code=062";
    });
    $(".da").click(function(){
        location.href="daejeon.do?code=042";
    });
    $(".in").click(function(){
        location.href="incheon.do?code=032";
    });
    $(".je").click(function(){
        location.href="jeju.do?code=064";
    });

    </script>
</body>
</html>