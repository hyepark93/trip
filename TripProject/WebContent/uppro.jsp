<!-- ㅜnull값이 기본값임. -->



<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="com.test.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>TRAVEL-JAVA > 회원정보수정</title>
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
	border: 1px solid rgba(0,0,0,0);
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
/* -----------------------------*/
.wrap {
	border: 1px solid white;
	margin: 0 auto;
	width: 1024px;
}

.my {
	margin-top: 83px;
	width: 100%;
	border:1px solid rgba(0,0,0,0);
}

.myre {
	width: 100%;
	height: calc(100vh - 85px);
	margin: 0 auto;
}
span{
	color : blue;
}
.title1{
	text-align:center;
	width:500px;
	margin: 30px auto;
	font-size: 20px;

}
table{
	margin: 0 auto;
	width:80%;
	border-top:2px solid gray;
	border-collapse: collapse;
}
tr{
	height : 80px;
	
}
th{
	width : 50%;
	font-weight: bold;
	border-bottom:2px solid gray;
	text-align:center;
}
td{
	text-align:center;
	border-bottom:2px solid gray;

}
.btn{
	margin: 0 auto;
	width : 300px;
	display: flex;
	justify-content:center;
}
.btn > input{
	width : 100px;
	height : 30px;
	border-radius: 5px;
	border:2px solid gray;
	background-color: white;
	margin : 30px 10px;
}
.

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
						<div><%= (String)session.getAttribute("loginID") %></div>
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
	<div class="wrap">
		<div class="my">
		<form action="uppro.do">
			<div class="title1">내 정보를 <span>최신 정보</span>로 관리해 주세요.</div>
			<div class="myre">
			<% 
				TripDAO dao = new TripDAO();
				String id = (String) session.getAttribute("loginID");
				Vector<TripDTO> v = dao.upProfile(id);
				for(int i=0;i<v.size();i++){
				System.out.print(v.size());
			%>
				<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" class="id1" value=<%=session.getAttribute("loginID") %> disabled></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" name="pw" class="pw1" value="<%= v.get(0).getPw() %>"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="name" class="name1" value="<%= v.get(0).getNAME() %>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" class="email1" value="<%= v.get(0).getEmail() %>"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="sex" value="man" disabled>남 <input
						type="radio" name="sex" value="woman" disabled>여</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="age" class="birth1" disabled></td>
				</tr>
			</table>
			<% } %>
			<div class="btn">
				<input class="gab" type="submit" value="수정">
				<input type="button" class="can" value="취소" onclick="backPage()">
			
			</div>
			</div>
			</form>
			<hr>
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
	
	$(".gab").click(function() {
		alert("수정이 완료되었습니다.");
	})
	function backPage() {
		history.go(-1);
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