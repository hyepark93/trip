<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.test.*,java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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

.map {
	width: 60%;
	margin: 100px auto;
	min-width: 500px;
}

.buttons {
	display: flex;
	padding-left: 15%;
}

.whole {
	width: 70px;
	height: 80px;
	cursor: pointer;
	text-align: center;
	font-size: 10px;
	border-radius: 10px;
	border: 1px solid gray;
}
.bumap{
    width: 70%;
    margin: 0 auto;
    position: relative;
}
.busan{
    position: absolute;
    cursor: pointer;
}
.busan>div{
    display: none;
}
.busan:hover>div{
    font-size: 15px;
    display: inline-block;
    width: 200px;
    font-weight: bolder;
}
img{
    width: 100%;
}
.buinfo{
    width: 350px;
    height: 400px;
    background-color: aliceblue;
    position: absolute;
    left: 28%;
    top: 18%;
    display: none;
    z-index: 1;
    padding: 10px;
}
.buinfo>div{
    margin-bottom: 10px;
}
.buinfo_close{
    background-color: dodgerblue;
    color: aliceblue;
    border: 0;
    padding: 5px;
    font-weight: 500;
    width: 50px;
    margin-bottom: 10px;
    float: right;
}
.buinfo>div:nth-child(2){
    margin-bottom: 20px;
}
.buinfo>div:nth-child(3){
    width: 250px;
    height: 200px;
    overflow: hidden;
    margin: 0 auto;
}
.buinfo>div:nth-child(3)>img{
    margin: 0 auto;
}
.buinfo>div:nth-child(4){
    font-weight: 600;
    font-size: 20px;
}
.buinfo>div:nth-child(5){
    font-size: 12px;
}
.modal{
    position: fixed;
    width: 100%;
    height: 100vh;
    top: 0;
    left: 0;
    background-color: rgba(0,0,0,0.3);
    opacity: .98;
    display: none;
}

@media(max-width:800px){
    .whole{
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
	<form action="loginProc.jsp" name="myForm">
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
			<input class="gab" type="submit" value="가입" onclick="myfunction()">
			<input type="button" class="can" value="취소">
		</div>
	</form>

	<!-- 
	//로그인되었는지 보여주기// -->
	<div class="search">
		<input type="text" value=<%=(String) session.getAttribute("loginID")%>>&nbsp;&nbsp;&nbsp;
		<div style="cursor: pointer">검색</div>
		
           	<%
            	Vector<TripDTO> v = (Vector<TripDTO>)request.getAttribute("open");
       		%>
            <div class="map">
            	<div class="buttons">
                    <div class="whole"><img src="files/map.png" alt="">전체지도</div>
                    </div>
                <div class="bumap">
                    <img src="files/bumap.png" alt="">
                    <% for(int i=0;i<v.size();i++){  %>
                    
                    <div class="busan" style="left:<%= v.get(i).getLeftx() %>; top:<%= v.get(i).getTopy() %>;
                    color:aqua;">
                    <i class="fas fa-circle"></i><div><%= v.get(i).getNAME() %></div></div>
                    <div class="buinfo">
            			<button class="buinfo_close">닫기</button>
            			<div>
            				<span><%= v.get(i).getRegion() %></span> > <span><%= v.get(i).getGrouping() %></span>
            			</div>
            			<div><img src="files/<%= v.get(i).getImg() %>" alt=""></div>
            			<div><span><%= v.get(i).getNAME() %></span></div>
            			<div><span><%= v.get(i).getAddress() %></span></div>
            		<div><span><%= v.get(i).getInfo() %></span></div> 
        			</div>
                    <% } %>
                </div>
                
            </div>
        </div>
        <div class="modal"></div>
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
    $(".whole").click(function(){
    	location.href="korea.do";
    });
    $(".busan").click(function(){
    	var index = $( ".busan" ).index( this );
    	$(".modal").fadeIn(300,function(){$(".buinfo").eq(index).fadeIn(500);});
       	$(".buinfo").eq(index).draggable();
    });
    	
    $(".buinfo_close").click(function(){
        $(".buinfo").fadeOut(300,function(){$(".modal").fadeOut(300)});
    });
    </script>
    		
</body>
</html>