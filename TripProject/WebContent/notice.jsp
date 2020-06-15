<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="com.test.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>TRAVEL-JAVA > 공지사항</title>
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
.wrap {
	border: 1px solid white;
	margin: 0 auto;
	display: flex;
	flex-flow: row wrap;
	justify-content: center;
}

.myre {
	width: 55%;
	margin-top: 83px;
	height: calc(100vh - 85px);
	text-align: center;
	font-size: 35px;
}

.myre>div {
	padding: 25px;
}

table {
	font-size: 14px;
	width: 100%;
	text-align: center;
	border-spacing: 0;
	margin-bottom: 20px;

}

td {
font-weight: 600;
	padding: 12px;
	border-bottom: 1px solid lightgrey;
}
th {
	padding: 10px;
	border-bottom: 1px solid lightgrey;
}
td:nth-child(1),th:nth-child(1) {
	width:20%;
}

td:nth-child(2),th:nth-child(2) {
	text-align: left
}
@media ( max-width :800px) {
	.myre {
		width: 100%;
	}
}

@media ( max-width :600px) {
	.myre {
		width: 100%;
	}
}
</style>
</head>
<body>

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
						<div>아이디</div>
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
	<div class="wrap" >
			
			<div class="myre">
			<div>NOTICE</div>
			<table class="tb"  cellspacing="0">
				<tr>
					<th>NO</th>
					<th>SUBJECT</th>
					<th>WRITER</th>
					<th>DATE</th>	
				</tr>
				
			<%  TripDAO dao=new TripDAO();
			Vector<TripDTO> v= dao.selectNotice();
			for(int i=0;i<v.size();i++){%>
			<tr>
				<td><%= v.get(i).getNum()%></td>
				<td><a onclick="view(<%= v.get(i).getNum()%>)" style="cursor: pointer"><%= v.get(i).getSubject()%></a></td>
				<td><%= v.get(i).getWriter()%></td>
				<td><%= v.get(i).getDate()%></td>
			</tr>
		<%	}%>	
				
			</table>
			</div>
	</div>



	<script>
	/* 로고 버튼 메인으로 이동 */
	$(".logo").click(function() {
		location.href = "Main.do";
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
    
	$(function(){
		$(".proimg").click(function() {
			if ($('.wrap_login').css('display') == 'none') {
				$('.wrap_login').show();
			} else {
				$('.wrap_login').hide();
			}
		});

	});
	function view(idx) {
		location.href="notice_view.jsp?num="+idx;
	}
	<%
	if((String)session.getAttribute("loginID")!=null){
	%>
		$(".beforeLog").css("display", "none");
		$(".afterLog").css("display", "block");
	<%
	}		
	%>
	
</script>
</body>
</html>