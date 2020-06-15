<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JAVA-TRAVL > 리뷰 작성</title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx%>/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["ir1"].exec("PASTE_HTML", [ "" ]);
			},
			fCreator : "createSEditor2"
		});

		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
</script>
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
	border: 1px solid rgba(0, 0, 0, 0);
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
	border: 1px solid rgba(0, 0, 0, 0);
}

span {
	color: blue;
}

.title1 {
	text-align: center;
	width: 500px;
	margin: 10px auto;
	font-size: 20px;
}

table {
	margin: 0 auto;
	width: 80%;
	border-top: 2px solid gray;
	border-collapse: collapse;
}

td {
	border-top: 1px solid gray;
	padding: 5px;
}

td:NTH-CHILD(1) {
	width: 100px;
	text-align: center;
}

tr:NTH-LAST-CHILD(1) {
	border-bottom: 2px solid gray;
}

.btn {
	margin: 0 auto;
	width: 300px;
	display: flex;
	justify-content: center;
}

.btn>input {
	width: 100px;
	height: 30px;
	background-color: rgba(0, 0, 0, 0.7);
	color: white;
	border: 1px solid rgba(0, 0, 0, 0);
	border-radius: 5px;
	margin: 10px auto 0px;
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

	<div class="wrap">
		<div class="my">
			<div class="title1"><span> <%=(String) session.getAttribute("loginID")%></span> 님의 여행 리뷰를 작성해 보세요.</div>
			<form id="frm" action="insert.do" method="post">
				<table width="100%">
					<tr>
						<td>제목</td>
						<td><input type="text" id="title" name="title"
							style="width: 650px" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="30" id="ir1" name="comment"
								style="width: 650px; height: 350px;"></textarea></td>
					</tr>
					<tr>
						<td>태그</td>
						<td><input type="text" id="region" name="region"
							style="width: 650px" /></td>
					</tr>
					<tr>
						<td>체크</td>
						<td><input type="checkbox" class="busanCheck">부산 <input
							type="checkbox" class="ulsanCheck">울산 <input
							type="checkbox" class="seoulCheck">서울 <input
							type="checkbox">4 <input type="checkbox">5 <input
							type="checkbox">6 <input type="checkbox">7 <input
							type="checkbox">8 <input type="checkbox">9 <input
							type="checkbox">10 <input type="checkbox">11 <input
							type="checkbox">12 <input type="checkbox">13 <input
							type="checkbox">14 <input type="checkbox">15 <input
							type="checkbox">16</td>
					</tr>
				</table>
				<div class="btn">
					<input type="button" id="save" value="저장" /> <input type="button"
						value="취소" onclick="history.go(-1);" />
				</div>
			</form>
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
		/* 리뷰게시판은 회원만 접근 가능. */
		$(".proimg").click(function() { /* 로그인 후 프로필 버튼 */
			if ($('.wrap_login').css('display') == 'none') {
				$('.wrap_login').show();
			} else {
				$('.wrap_login').hide();
			}
		});
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
		
		<%
		if((String)session.getAttribute("loginID")!=null){
		%>
			$(".beforeLog").css("display", "none");
			$(".afterLog").css("display", "block");
		<%
		}		
		%>
		
		
		var str = "";
		var busan = 0;
		var ulsan = 0;
		var seoul = 0;
		$(function() {
			$(".busanCheck").click(function() {
				if (busan == 0) {
					str = str + ("#busan ");
					busan++;
					$("#region").val(str);
				} else {
					str = str.replace("#busan ", "");
					busan--;
					$("#region").val(str);
				}
			});

			$(".ulsanCheck").click(function() {
				if (ulsan == 0) {
					str = str + ("#ulsan ");
					ulsan++;
					$("#region").val(str);
				} else {
					str = str.replace("#ulsan ", "");
					ulsan--;
					$("#region").val(str);
				}
			});

			$(".seoulCheck").click(function() {
				if (seoul == 0) {
					str = str + ("#seoul ");
					seoul++;
					$("#region").val(str);
				} else {
					str = str.replace("#seoul ", "");
					seoul--;
					$("#region").val(str);
				}
			});
		});
	</script>

</body>
</html>