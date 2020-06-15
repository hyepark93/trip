<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="com.test.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<title>TRAVEL-JAVA</title>
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
/* ----------회원가입------------*/
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
	margin: 0 auto;
	position: relative;
	display: flex;
	height: 100vh;
	flex-flow: row wrap;
	justify-content: center;
}

.frame {
	margin-top: 3%;
	width: 100%;
	height: 50%;
	position: relative;
}

.frame img {
	width: 100%;
	height: 100%;
	position: absolute;
}

.page1 {
	position: absolute;
	width: 55%;
	height: 100vh;
	min-width: 800px;
}

.page2 {
	width: 55%;
	height: 100vh;
	position: relative;
	top: 450px;
	text-align: center;
	min-width: 800px;
}

.txt {
	position: absolute;
	top: 35%;
	left: 35%;
	font-size: 40px;
	font-weight: 400;
	color: white;
	font-family: 'Do Hyeon', sans-serif;
}

.mid {
	position: absolute;
	top: 48%;
	width: 100%; /* 
	height: 20%; */
	border: 1px solid grey;
	padding-top: 5%;
	padding-bottom: 1%;
	background-color: white;
	padding-top: 5%;
	padding-bottom: 1%;
	padding-bottom: 1%;
}

.mid>.search {
	width: 80%;
	margin: 0 auto;
	text-align: center;
}

.search>div {
	display: inline-block;
	border-radius: 20%;
	background-color: dodgerblue;
	color: white;
	width: 60px;
	padding: 10px;
}

.search>input {
	width: 70%;
	height: 50px;
	font-size: 15px
}

.mid>.pretext {
	width: 80%;
	margin: 0 auto;
	display: flex;
	flex-flow: row wrap;
	justify-content: space-around;
}

.mid>.pretext>div {
	background-color: rgba(0, 0, 0, 0.3);
	border-radius: 10px;
	margin-top: 10px;
	padding: 5px;
}

a:link {
	color: dodgerblue;
	text-decoration: none;
}

a:visited {
	color: dodgerblue;
	text-decoration: none;
}

a:hover {
	color: greenyellow;
	text-decoration: underline;
}

.down {
	position: absolute;
	left: 45%;
	bottom: 10%;
	font-size: 100px;
}

.page2>span {
	font-size: 40px;
	display: inline-block;
	padding-top: 50px;
}

.p1box {
	display: flex;
	width: 100%;
	height: 60vh;
	margin: 100px auto 0px;
}

.p2box {
	margin-top: 100px;
	display: flex;
	width: 100%;
	height: 60vh;
	min-width: 800px;
}

.leftbox {
	width: 55%;
	position: relative;
}

.leftbox>img {
	position: absolute;
	left: 0;
	width: 100%;
	height: 100%;
}

.bottombox {
	display: none;
}

.rightbox {
	width: 70%;
	display: flex;
	flex-flow: row wrap;
}

.rightbox>div {
	width: 50%;
	height: 50%;
	border: 1px solid grey;
	text-align: center;
}

.rightbox>div>div:nth-child(1) {
	font-weight: bolder;
	font-size: 20px;
}

.rightbox>div>div:nth-child(3) {
	margin-left: 42%;
	width: 50px;
	border-radius: 20%;
	border: 1px solid grey;
}

.rightbox>div>div {
	margin: 30px;
}

.scrollbox {
	margin-top: 30px;
	margin-left: 500px;
	width: 10%;
	font-size: 25px;
}

.box1:hover {
	background-color: plum;
	color: white;
}

.box1:hover>div:nth-child(3) {
	background-color: white;
	color: black;
}

.box2:hover>div:nth-child(3) {
	background-color: white;
	color: black;
}

.box3:hover>div:nth-child(3) {
	background-color: white;
	color: black;
}

.box4:hover>div:nth-child(3) {
	background-color: white;
	color: black;
}

.box2:hover {
	background-color: paleturquoise;
	color: white;
}

.box3:hover {
	background-color: lightcoral;
	color: white;
}

.box4:hover {
	background-color: lightpink;
	color: white;
}

@media ( max-width :800px) {
	.page1, .page2 {
		width: 100%;
	}
}

@media ( max-width :600px) {
	.wrap {
		width: 100%;
	}
	.page1, .page2 {
		width: 100%;
		min-width: 0px;
	}
	.mid {
		width: 100%;
	}
	.search>div {
		width: 15%;
	}
	.txt {
		top: 30%;
		left: 17%;
		font-size: 40px;
		color: white;
	}
	.leftbox {
		width: 500px;
		position: relative;
	}
	.leftbox>img {
		width: 100%;
		height: 100%;
		position: absolute;
	}
	.bottombox {
		bottom: 10%;
		position: absolute;
		width: 100%;
		display: flex;
		justify-content: space-around;
	}
	.bottombox>div {
		width: 100px;
		height: 100px;
		text-align: center;
		border: 1px solid black;
		border-radius: 5px;
	}
	.rightbox {
		display: none;
	}
	.scrollbox {
		display: none;
	}
	.p2box {
		display: none;
	}
}
</style>
</head>
<body>

	<%
		if (session.getAttribute("memberPage") != null && (boolean) session.getAttribute("memberPage") == false) {
	%>
	<script>
		alert("회원전용 페이지입니다.");
	</script>
	<%
		}
	%>



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
		<div class="frame">
			<img class="slider_item active" src="img/img1.jpg" /> <img
				class="slider_item" src="img/img2.jpg" /> <img class="slider_item"
				src="img/img3.jpg" /> <img class="slider_item" src="img/img4.jpg" />
			<img class="slider_item last" src="img/img5.jpg" />
		</div>
		<div class="page1">
			<div class="txt">어디로 떠나세요?</div>
			<div class="mid">
				<div class="search">
					<input type="text">&nbsp;&nbsp;&nbsp;
					<div style="cursor: pointer">검색</div>
				</div>
				<br>
				<div class="pretext">
					<%
						Vector<TripDTO> v = (Vector<TripDTO>) request.getAttribute("place");
						for (int i = 0; i < v.size(); i++) {
					%>

					<div onclick="goCity('<%=v.get(i).getCode()%>')"
						style="cursor: pointer"><%=v.get(i).getNAME()%></div>

					<%
						}
					%>

				</div>
			</div>
			<div class="down">
				<a href="#" class="dw"><i class="fas fa-caret-down"></i></a>
			</div>
		</div>
		<div class="page2">
			<span>TRAVEL JAVA의 추천 여행지</span>
			<div class="p1box">
				<div class="leftbox">
					<%
						Vector<TripDTO> v2 = (Vector<TripDTO>) request.getAttribute("place4");
						for (int i = 0; i < v2.size(); i++) {
					%>
					<img alt="" src="img/<%=v2.get(i).getImg()%>">
					<%
						}
					%>

					<div class="bottombox">
						<%
							for (int i = 0; i < v2.size(); i++) {
						%>
						<div onclick="goCity('<%=v2.get(i).getCode()%>')" style="background: url(img/<%=v2.get(i).getImg()%>) center">
						</div>
						<%
							}
						%>
					</div>
				</div>
				<div class="rightbox">
					<%
						for (int i = 0; i < 4; i++) {
					%>
					<div class="box<%=i + 1%>">
						<div><%=v2.get(i).getNAME()%></div>
						<div><%=v2.get(i).getInfo()%></div>
						<div onclick="goCity('<%=v2.get(i).getCode()%>')"
							style="cursor: pointer">
							<i class="fas fa-plus"></i>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>

			<div class="p2box">

				<div class="leftbox">
					<img src="img/cat.jpg"> <img src="img/cheer.jpg"> <img
						src="img/raccoon.png"> <img src="img/hedge.jpg">

				</div>
				<div class="rightbox">
					<div class="box1">
						<div>name</div>
						<div>info</div>
						<div style="cursor: pointer">
							<i class="fas fa-plus"></i>
						</div>
					</div>
					<div class="box2">
						<div>name</div>
						<div>info</div>
						<div style="cursor: pointer">
							<i class="fas fa-plus"></i>
						</div>
					</div>
					<div class="box3">
						<div>name</div>
						<div>info</div>
						<div style="cursor: pointer">
							<i class="fas fa-plus"></i>
						</div>
					</div>
					<div class="box4">
						<div>name</div>
						<div>info</div>
						<div style="cursor: pointer">
							<i class="fas fa-plus"></i>
						</div>
					</div>
				</div>
			</div>

			<div class="scrollbox">
				<span style="cursor: pointer">&lt;</span>&nbsp;&nbsp;<span
					style="cursor: pointer">1</span>&nbsp;&nbsp;<span
					style="cursor: pointer">2</span>&nbsp;&nbsp;<span
					style="cursor: pointer">&gt;</span>
			</div>
		</div>

	</div>

	<script>
		/* 로고 버튼 메인으로 이동 */
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
		$(".mypage").click(function() {
			location.href = "mypage.do";
		});
		/* 회원정보수정 */
		$(".uppro").click(function() {
			location.href = "upproview.do";
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

		/* 내용 부분 */

		$(".leftbox>img").hide();
		$(".leftbox>img:nth-child(1)").show();
		$(".box1").mouseenter(function() {
			$(".leftbox>img").hide();
			$(".leftbox>img:nth-child(1)").show();
		});
		$(".rightbox>.box2").mouseenter(function() {
			$(".leftbox>img").hide();
			$(".leftbox>img:nth-child(2)").show();
		});
		$(".rightbox>.box3").mouseenter(function() {
			$(".leftbox>img").hide();
			$(".leftbox>img:nth-child(3)").show();
		});
		$(".rightbox>.box4").mouseenter(function() {
			$(".leftbox>img").hide();
			$(".leftbox>img:nth-child(4)").show();
		});

		$(".p2box").hide();
		$(".scrollbox>span:nth-child(1)").click(function() {
			$(".p2box").hide();
			$(".p1box").show();
		});
		$(".scrollbox>span:nth-child(2)").click(function() {
			$(".p2box").hide();
			$(".p1box").show();
		});
		$(".scrollbox>span:nth-child(3)").click(function() {
			$(".p1box").hide();
			$(".p2box").show();
		});
		$(".scrollbox>span:nth-child(4)").click(function() {
			$(".p1box").hide();
			$(".p2box").show();
		});

		/* 이미지 아래  */
		$("a").click(function() {
			var x = $(".page2").eq(0).offset().top;
			$("html, body").stop().animate({
				scrollTop : x
			}, 500);

		}); //페이지 다운

		var didScroll = false;
		var lastScrollTop = 0;
		var delta = 5;
		var navbarHeight = $(".top").outerHeight();

		$(window).scroll(function() {
			// 스크롤시 호출
			didScroll = true;
		})
		setInterval(function() {
			// 스크롤 상태 체크 & 메뉴바 상태 변경
			if (didScroll) {
				// TODO 스크롤 중이라면
				hasScrolled();
				didScroll = false;
			}
		}, 250);
		function hasScrolled() {
			var st = $(this).scrollTop();
			if (Math.abs(lastScrollTop - st) <= delta)
				return;
			if (st > lastScrollTop && st > navbarHeight) {
				// Scroll Down 
				$(".top").css({
					opacity : 0
				});
			} else {
				// Scroll Up
				if (st + $(window).height() < $(document).height()) {
					$(".top").css({
						top : 0,
						opacity : 1
					});
				}
			}
			lastScrollTop = st;
		}

		var cur = 0;
		var count = $('.slider_item').length;

		$('.slider_item').hide();
		$('.slider_item').eq(0).show();

		setInterval(function() {
			$('.slider_item').eq(cur).fadeOut(function() {
				$(this).removeClass('active');
				cur = (cur + 1) % count;
				$('.slider_item').eq(cur).addClass('active').fadeIn();
			});
		}, 3000);

		$(".bottombox>div:nth-child(1)").mouseenter(function() {
			$(".leftbox>img").hide();
			$(".leftbox>img:nth-child(1)").show();
		});
		$(".bottombox>div:nth-child(2)").mouseenter(function() {
			$(".leftbox>img").hide();
			$(".leftbox>img:nth-child(2)").show();
		});
		$(".bottombox>div:nth-child(3)").mouseenter(function() {
			$(".leftbox>img").hide();
			$(".leftbox>img:nth-child(3)").show();
		});
		$(".bottombox>div:nth-child(4)").mouseenter(function() {
			$(".leftbox>img").hide();
			$(".leftbox>img:nth-child(4)").show();
		});

		/* 데이터 연결 */
		function goCity(city) {
			location.href = "place.do?code=" + city;
		}
	</script>
</body>
</html>