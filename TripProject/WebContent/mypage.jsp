<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="com.test.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>TRAVEL-JAVA > MY PAGE</title>
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
	border: 1px solid red;
}
/*------�ΰ�------*/
.logo {
	width: 100px;
	right: 88%;
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
	border :1px solid white;
	margin: 0 auto;
	width: 1024px;
}
.my{
	margin-top: 83px;
}

.my>div{
	padding: 10px;
}

.my>div>span,p{
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 10px;
}
.myre{
	width: 100%;
	height: 200px;
}
th{
	font-size: 20px;
	text-align: left;
	padding: 4px;
}
td{
	font-size: 18px;
	padding-left: 20px;
}
td>img{
	width: 400px;
	height: 400px;
}
.mypl{
	width: 100%;
}

</style>
</head>
<body>

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
						<div><%= (String)session.getAttribute("loginID") %></div>
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
	
	
	<div class="wrap">
		<div class="my">
			<div class="myre"><span>MY Profile</span>
				<%
				Vector<TripDTO> v = (Vector<TripDTO>) request.getAttribute("profile");
					for (int i = 0; i < v.size(); i++) {
				%>
				<table>
					<tr>
						<th>&nbsp;I &nbsp;&nbsp;&nbsp;&nbsp; D</th>
						<td><%= v.get(i).getP_id()%></td>
					</tr>
					<tr>
						<th>�� &nbsp;&nbsp;&nbsp; ��</th> 
						<td><%= v.get(i).getName()%></td>
					</tr>
					<tr>
						<th>�� &nbsp;&nbsp;&nbsp; ��</th>
						<td><%= v.get(i).getSex()%></td>
					</tr>
					<tr>
						<th>����⵵</th> 
						<td><%= v.get(i).getBirth()%></td>
					</tr>
				</table>
				<% } %>
			</div>
			<hr style="border:2px solid gray; width:120%; margin-left:-10%;">
			<div class="mypl"><p>MY PLAN</p>
			<%
				Vector<TripDTO> v1 = (Vector<TripDTO>) request.getAttribute("review");
				for (int i = 0; i < v1.size(); i++) {
			%>
				<table>
					<tr><th colspan="2" style="font-size: 30px;">&nbsp;<%=i+1%></th></tr>
					<tr>
						<th>��������</th>
						<td><%= v1.get(i).getnDate()%></td>
					</tr>
					<tr>
						<th>�� &nbsp;&nbsp;&nbsp; ��</th>
						<td><%= v1.get(i).getTitle()%></td>
					</tr>
					<tr>
						<th>�� &nbsp;&nbsp;&nbsp; </th> 
						<td><%= v1.get(i).getComment()%></td>
					</tr>
				</table>
				<hr>
			<% } %>
			</div>
		</div>
		
	
	</div>

	

	<script>
	/* �ΰ� ��ư �������� �̵� */
	$(".logo").click(function() {
		location.href = "Main.do";
	});
	/* ���������� */
    $(".mypage").click(function(){
    	location.href="mypage.do";
    });
    /* ȸ���������� */
    $(".uppro").click(function(){
    	location.href="uppro.do";
    });
	/* �α׾ƿ� */
	$(".logout").click(function(){
    	location.href="logout.do";
    });
	/* �������� */
	$(".notice").click(function(){
    	location.href="notice.do";
    });
    /* ���� */
    $(".review").click(function(){
    	location.href="review.do";
    });
    /* ������ */
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