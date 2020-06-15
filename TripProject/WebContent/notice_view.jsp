<%@page import="com.test.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="EUC-KR">
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

table {
	font-size: 14px;
	width: 100%;
	text-align: center;
	border-spacing: 0;
	margin-bottom: 20px;
	border: 1px solid grey;
}

th {
	padding: 10px;
	border-bottom: 1px solid lightgrey;
}

td {
	padding: 10px;
	border-bottom: 1px solid lightgrey;
}

.cont {
	vertical-align: top;
	text-align: left;
	width: 50%;
	height: 500px;
}

.btn {
	text-align: center;
	font-size: 15px;
	background-color: lightgrey;
	width: 100px;
	height: 30px;
}

@media ( max-width :800px) {
	.myre {
		width: 100%;
	}
	@media ( max-width :600px) {
		.myre {
			width: 100%;
		}
		table {
			height: 60%;
			border: none;
		}
		.cont {
			width: 100%
		}
		th {
			text-align: left;
		}
		td {
			text-align: left;
		}
	}
}
}
</style>
</head>
<body>
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
	
	<div class="wrap" >
			
<%
	String idx = request.getParameter("num");
	TripDAO dao =new TripDAO();
	TripDTO dto=dao.postview(idx);
%> 
		

			<div class="myre">
			<div>NOTICE</div>
			<form class="box">
			<br>
				<table>
				
					<tr>
						<th>SUBJECT</th>
						<td>
							 <%=dto.getSubject()%> 
						</td>
					</tr>
					<tr>
						<th>WRITER</th>
						<td>
							 <%=dto.getWriter()%> 
						</td>
					</tr>
					<tr>
						<th style="vertical-align: top">CONTENT</th>
						<th></th>
					</tr>
					<tr>
						<td class="cont">
							 <%=dto.getL_content()%> 
						</td>
					</tr>

				</table>
				</form>
				<div class="btn" style="cursor: pointer">LIST</div>
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
    $(".btn").click(function(){
    	location.href = "notice.do"; 
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