<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.test.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>TRAVEL-JAVA > ��� �ȳ�</title>
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
/*------�ΰ�------*/
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
/*------�α����˾�------*/
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

/* ---------��ܹ� ������ �̹���---------*/
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
/* ---------�����˾�---------*/
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

/*ȸ������*/

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

/*����*/
.wrap {
	margin: 0 auto;
	width: 1024px;
	border: 1px solid white;
}

.title1 {
	margin-top: 83px;
	border: 1px solid rgba(0,0,0,0);
	text-align: center;
}
/* -----------------------------*/
.middle {
	margin: 10px auto;
	width: 100%;
	height: 100vh;
	display: flex;
	flex-flow: row wrap;
	justify-content: space-around;
}

.placebox {
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
}

.placebox:HOVER {
	cursor: pointer;
	border: 1px solid gray;
}

.placebox div {
	width: 100%;
	padding: 10px;
	position: absolute;
	bottom: 0;
	background-color: rgba(0, 0, 0, .7);
	color: white;
	border-radius: 0px 0px 10px 10px;
}
/*---------------���� �˾�!----------------*/
.info {
	width: 350px;
	height: 400px;
	background-color: aliceblue;
	position: absolute;
	margin: 0 auto;
	z-index: 1;
	padding: 10px;
	display: none;
}

.info>div {
	margin-bottom: 10px;
}

.info_close {
	background-color: dodgerblue;
	color: aliceblue;
	border: 0;
	padding: 5px;
	font-weight: 500;
	width: 50px;
	margin-bottom: 10px;
	float: right;
}

.info>div:nth-child(2) {
	margin-bottom: 20px;
}

.info>div:nth-child(3) {
	width: 250px;
	height: 200px;
	overflow: hidden;
	margin: 0 auto;
}

.info>div:nth-child(3)>img {
	margin: 0 auto;
	width: 100%;
}

.info>div:nth-child(4) {
	font-weight: 600;
	font-size: 20px;
}

.info>div:nth-child(5) {
	font-size: 12px;
}

.modal {
	position: fixed;
	width: 100%;
	height: 100vh;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.3);
	opacity: .98;
	display: none;
}
/*--------------------------------------------*/
.middle600 {
	width: 100%;
	margin: 30px auto 0px;
	position: relative;
	display: none;
}

.food {
	width: 100%;
	border: 1px solid black;
}

.place {
	display: none;
	width: 100%;
}

.placebox {
	position: relative;
}

.box1>div {
	height: 30px;
}

.box2>div {
	height: 100px;
}

.g_pname {
	display: flex;
}

.pname {
	font-size: 15px;
	font-weight: bolder;
	padding-top: 10px;
	margin: 10px;
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
	.wrap_login {
		display: none;
	}
}
</style>
</head>
<body>
	<!-- ��ܹ� -->
	<div class="top">
		<div class="logo">
			<img src="img/logo.png">
		</div>
		<!-- �α��� �� ��ܹ� -->

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

		<!--  �α��� �� ��ܹ� -->
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
						<div>����������</div>
					</div>
				</div>
				<div class="list">
					<div class="uppro">ȸ����������</div>
					<div class="logout">�α׾ƿ�</div>
					<hr>
					<div class="notice">��������</div>
					<div class="review">����Խ���</div>
					<div class="cs">������</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ȸ������ -->
	<form action="regist.do" method="post">
		<div class="new">
			<i class="fas fa-times fa-2x" id="x"></i>
			<div class="tijoin">ȸ������</div>
			<table>
				<tr>
					<th>���̵�</th>
					<th><input type="text" name="id" class="id1"></th>
				</tr>
				<tr>
					<th>�н�����</th>
					<th><input type="password" name="pw" class="pw1"></th>
				</tr>
				<tr>
					<th>�г���</th>
					<th><input type="text" name="name" class="name1"></th>
				</tr>
				<tr>
					<th>�̸���</th>
					<th><input type="email" name="email" class="email1"></th>
				</tr>
				<tr>
					<th>����</th>
					<th><input type="radio" name="sex" value="man">�� <input
						type="radio" name="sex" value="woman">��</th>
				</tr>
				<tr>
					<th>�������</th>
					<th><input type="date" name="age" class="birth1"></th>
				</tr>
			</table>
			<input class="gab" type="submit" value="����"> <input
				type="button" class="can" value="���">
		</div>
	</form>

	<!-- ���� -->

	<div class="wrap">
		<%
			Vector<TripDTO> place = (Vector<TripDTO>) request.getAttribute("place");
		%>
		<div class="title1">
			<div><%=place.get(0).getRegion() %></div>
			<div>
				<input type="text">�˻�
				<input
			onclick="goMap('<%=place.get(0).getRegion_e()%>','<%=place.get(0).getCode()%>')"
			class="gomap" type="button" name="gomap" value="������ �̵�">
			<input
			onclick="goCityList()"
			class="gomap" type="button" name="gomap" value="��ü ���� ����">
			</div>
		</div>
		
		
		<div class="middle">

			<%
				for (int i = 0; i < place.size(); i++) {
			%>
			<div class="placebox"
				style="background-image: url('img/<%=place.get(i).getImg()%>');">
				<div><%=place.get(i).getNAME()%></div>
			</div>
			<div class="info">
				<button class="info_close">�ݱ�</button>
				<div>
					<span><%=place.get(i).getRegion()%></span> > <span><%=place.get(i).getGrouping()%></span>
				</div>
				<div>
					<img src="files/<%=place.get(i).getImg()%>" alt="">
				</div>
				<div>
					<span><%=place.get(i).getNAME()%></span>
				</div>
				<div>
					<span><%=place.get(i).getAddress()%></span>
				</div>
				<div>
					<span><%=place.get(i).getInfo()%></span>
				</div>
			</div>
			<%
				}
			%>
		</div>


		<div class="middle600">
			<div class="g_pname">
				<%-- <div class="attrac">���</div>
				<div class="food"
					onclick="viewFood('<%=place.get(0).getCode()%>','food')">����</div> --%>
			</div>
			<div class="box1">
				<%
					for (int i = 0; i < place.size(); i++) {
				%>
				<div><%=place.get(i).getNAME()%></div>
				<div><%=place.get(i).getAddress()%></div>
				<div><%=place.get(i).getInfo()%></div>
				<div style="height:200px;"><img src="img/<%=place.get(i).getImg()%>" style="width:200px;"></div>
				<hr>
				<%
					}
				%>
			</div>


			<%-- <div class="box2">
				<%
					for (int i = 0; i < place.size(); i++) {
				%>
				<div><%=place.get(i).getNAME()%></div>
				<%
					}
				%>
			</div> --%>
		</div>
	</div>
	<div class="modal"></div>
	<script>
		/* �ΰ� ��ư �������� �̵� */
		$(".logo").click(function() {
			location.href = "Main.do";
		});

		$(function() {
			$(".login").click(function() { /* �α��� ��ư */
				if ($('.logpop').css('display') == 'none') {
					$('.logpop').show();
				} else {
					$('.logpop').hide();
				}
			});
			$(".proimg").click(function() { /* �α��� �� ������ ��ư */
				if ($('.wrap_login').css('display') == 'none') {
					$('.wrap_login').show();
				} else {
					$('.wrap_login').hide();
				}
			});

		});
		/* �α��� ��/�� ��ư  */
	<%if ((String) session.getAttribute("loginID") != null) {%>
		$(".beforeLog").css("display", "none");
		$(".afterLog").css("display", "block");
	<%}%>
		/* ȸ������ */
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
		/* ���������� */
		$(".mypage").click(function() {
			location.href = "mypage.do";
		});
		/* ȸ���������� */
		$(".uppro").click(function() {
			location.href = "uppro.do";
		});
		/* �α׾ƿ� */
		$(".logout").click(function() {
			location.href = "logout.do";
		});
		/* �������� */
		$(".notice").click(function() {
			location.href = "notice.do";
		});
		/* ���� */
		$(".review").click(function() {
			location.href = "review.do";
		});
		/* ������ */
		$(".cs").click(function() {
			location.href = "cs.do";
		});

		$(".logo").click(function() {
			location.href = "Main.do";
		});

		function goMap(region_e, code) {
			location.href = region_e + ".do?code=" + code;
		}
		function goCityList() {
			location.href = "city.do";
		}

		$(".food").click(function() {
			$(".food").css('display', 'block');
			$(".place").css('display', 'none');
			function viewFood(code, grouping) {
				location.href = "place.do?code=" + code;
			}
			function viewAtrrac() {

			}
		});

		$(".attrac").click(
				function() {
					$(".food").css('display', 'block');
					$(".place").css('display', 'none');
					function viewFood(code, grouping) {
						location.href = "place.do?code=" + code + "&grouping="
								+ grouping;
					}
				});

		$(".placebox").click(function() {
			var index = $(".placebox").index(this);
			$(".modal").fadeIn(300, function() {
				$(".info").eq(index).fadeIn(500);
			});
			$(".info").eq(index).draggable();
		});

		$(".info_close").click(function() {
			$(".info").fadeOut(300, function() {
				$(".modal").fadeOut(300)
			});
		});
	</script>
</body>
</html>