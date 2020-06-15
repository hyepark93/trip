<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TRAVEL-JAVA > 고객센터</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	z-index: 2;
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

.mypage{
	cursor: pointer;
}
.list>div {
	padding: 7px 10px;
	cursor: pointer;
}

.list>div:hover {
	background-color: rgba(0, 0, 0, 0.05);
}
/* -----------------------------*/
.my {
	margin-top: 83px;
}

.myre {
	width: 100%;
	height: calc(100vh - 85px);
	border: 1px solid blue;
}

.mypl {
	width: 100%;
	height: calc(100vh - 85px);
	border: 1px solid green;
}

.question {
	position: absolute;
	top: 100px;
	width: 70%;
	min-width: 500px;
	left: 15%;
}

.question>table {
	width: 100%;
	border-collapse: collapse;
	border-top: 2px solid dodgerblue;
	border-bottom: 2px solid dodgerblue;
}

th {
	border-bottom: 2px solid dodgerblue;
	font-size: 25px;
	font-weigt: bold;
	padding: 15px;
}

td {
	border-bottom: 1px solid dodgerblue;
	padding: 10px;
}

td>div {
	display: none;
	margin: 20px;
}

.call {
	position: absolute;
	width: 30%;
	min-width: 400px;
	height: 10vh;
	min-height: 100px;
	left: 35%;
	top: 80%;
	border: 2px solid dodgerblue;
	border-radius: 10px;
	text-align: center;
	vertical-align: middle;
	padding-top: 2vh;
}

.call>p>span {
	font-weight: bolder;
	font-size: 20px;
}

@media ( max-width :800px) {
	.call {
		left: 15%;
	}
}

@media ( max-width :600px) {
	.call {
		left: 10%;
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

		<div class="question">
			<table>
				<tr>
					<th>
						<p>자주 묻는 질문</p>
					</th>
				</tr>
				<tr>
					<td>
						<p>로그인/회원가입에 문제가 있어요.</p>
						<div>trAVel_JAVA@gmail.com 으로 문제점에 대해 메일 보내주시면 바로 시정될 수 있도록
							하겠습니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<p>이미지가 뜨질 않아요.</p>
						<div>trAVel_JAVA@gmail.com 으로 문제점에 대해 메일 보내주시면 바로 시정될 수 있도록
							하겠습니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<p>제가 쓴 리뷰를 볼 수 없어요.</p>
						<div>trAVel_JAVA@gmail.com 으로 문제점에 대해 메일 보내주시면 바로 시정될 수 있도록
							하겠습니다.</div>
					</td>
				</tr>
				<tr>
					<td>
						<p>장소나 맛집의 설명에 틀린 부분이 있어요.</p>
						<div>trAVel_JAVA@gmail.com 으로 문제점에 대해 메일 보내주시면 바로 시정될 수 있도록
							하겠습니다.</div>
					</td>
				</tr>
			</table>


		</div>

		<div class="call">
			<p>
				문의사항은 <span>1599-XXXX</span>로 연락주시기 바랍니다.
			</p>
			<p>
				콜센터 운영시간 <span>10시 ~ 17시</span>
			</p>
		</div>
	</div>

	<script>
		/* 비회원  */
	<%if ((String) session.getAttribute("loginID") == null) {
				session.setAttribute("memberPage", false);
				response.sendRedirect("Main.do");
				//alert("회원 전용 페이지 입니다.")
			} else {
				session.setAttribute("memberPage", true);
			}%>
		/* 로고 버튼 메인으로 이동 */
		$(".logo").click(function() {
			location.href = "Main.do";
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

		$(function() {
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
		$(".question table td p").click(function() {
			$(this).parent().children("div").toggle();
		});
	</script>
</body>
</html>