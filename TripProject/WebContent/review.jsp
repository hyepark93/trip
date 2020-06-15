<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.test.*, java.util.Vector"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JAVA-TRAVEL>리뷰게시판</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
*, html, body {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
/*상단바*/
.top {
	position: fixed;
	display: flex;
	justify-content: space-between;
	width: 100%;
	height: 80px;
	background-color: black;
	z-index: 10000;
}

.afterLog {
	position: relative;
	right: 0;
	display: flex;
	justify-content: flex-end;
	color: white;
	font-size: 20px;
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

/* 상단 테이블 */
.wrap {
	margin: 0 auto;
	width: 1024px;
	border: 1px solid rgba(0, 0, 0, 0);
}

.wraptop {
	margin-top: 83px;
	width: 1024px;
	border: 1px solid rgba(0, 0, 0, 0);
}

.titletop {
	margin: 20px;
	font-size: 30px;
	text-align: center;
}

.table1 {
	width: 80%;
	border-collapse: collapse;
	text-align: center;
	margin: 0 auto;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	text-align: center;
}

.table1 td {
	width: 16.6666666%;
	height: 30px;
	border-right: 1px solid rgba(0, 0, 0, 0.4);
	border-bottom: 1px solid rgba(0, 0, 0, 0.4);
	cursor: pointer;
}

.table1 td:NTH-LAST-CHILD(1) {
	border-right: 1px solid rgba(0, 0, 0, 0);
}

.btnWrap {
	width: 100px;
	margin: 10px auto 0px;
}

.search, .write {
	width: 100px;
	height: 30px;
	background-color: rgba(0, 0, 0, 0.7);
	color: white;
	border: 1px solid rgba(0, 0, 0, 0);
	border-radius: 5px;
	margin: 10px auto 0px;
}
.search:hover{
	cursor: pointer;	
}
.write:hover{
	cursor: pointer;
}

.wrapbottom {
	width: 1024px;
	border: 1px solid rgba(0, 0, 0, 0);
}

.table2 {
	width: 80%;
	border-collapse: collapse;
	text-align: center;
	margin: 0 auto;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}

.table2 td {
	width: 20%;
	height: 30px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.4);
}

.table2 tr:NTH-CHILD(1) {
	border-bottom: 2px solid black;
}

.table2 {
	width: 80%;
	border-collapse: collapse;
	text-align: center;
	margin: 0 auto;
}

.table2 tr {
	border-bottom: 1px solid rgba(0, 0, 0, 0.4);
}

.tb2_tr1, .tb2_tr2 {
	text-algin: center;
}

.hide_comment {
	display: none;
}

.hide_comment td {
	border-top: 1px solid rgba(0, 0, 0, 0.4);
	border-bottom: 1px solid rgba(0, 0, 0, 0.4);
}

.title:hover {
	cursor: pointer;
}

.fakeTd {
	display: none;
}
</style>
</head>
<body>
	<!-- 상단바 -->
	<div class="top">
		<div class="logo">
			<img src="img/logo.png">
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
	<div class="wrap">
		<div class="wraptop">
			<div class="titletop">리뷰 게시판</div>
			<table class="table1">
				<tr>
					<td>부산</td>
					<td>서울</td>
					<td>대구</td>
					<td>대전</td>
					<td>광주</td>
					<td>강원</td>
				</tr>
				<tr>
					<td>부산</td>
					<td>서울</td>
					<td>대구</td>
					<td>대전</td>
					<td>광주</td>
					<td>강원</td>
				</tr>
				<tr>
					<td>부산</td>
					<td>서울</td>
					<td>대구</td>
					<td>대전</td>
					<td>광주</td>
					<td>강원</td>
				</tr>
			</table>
			<div class="btnWrap">
				<button class="search" onclick="tagSearch()">조회</button>
			</div>
			<br> <br>
		</div>

		<div class="wrapbottom">
			<div class="reviewtb">
				<%
					TripDAO dao = new TripDAO();

					String str = request.getParameter("str");

					if (str == null) {
						str = "";
					}
					out.println(str);

					Vector<TripDTO> vec = dao.allReview(str);
				%>
				<table class="table2">
					<tr class="tb2_tr1">
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
					</tr>
					<%
						for (int i = 0; i < vec.size(); i++) {
					%>
					<tr class="tb2_tr2">
						<td><%=vec.get(i).getIdx()%></td>
						<td class="title"><%=vec.get(i).getTitle()%></td>
						<td><%=vec.get(i).getId()%></td>
						<td><%=vec.get(i).getnDate()%></td>
					</tr>
					<tr class="hide_comment">
						<td colspan="4"><%=vec.get(i).getComment()%></td>
						<td class="fakeTd"><input type="hidden" value="off"></td>
					</tr>
					<%
						}
					%>
				</table>
				<div class="btnWrap">
					<button class="write" onclick="writeReview()">글쓰기</button>
				</div>
				<!-- <button onclick="backToMain()">돌아가기</button> -->
			</div>
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

		$(".table1 tr td").click(function() {
			var str = "";
			clickStr = $(this).text();
			if (clickStr == '부산') {
				if (busanClick == 1) {
					str.replaceAll("/busan", "");
					str.replaceAll("busan", "");
					busanClick--;

				} else {
					if (str == "") {
						str = clickStr;
						busanClick++;
					} else {
						str = str + "/" + clickStr;
						busanClick++;
					}
				}
			} else if (clickStr == '서울') {
				if (seoulClick == 1) {
					str.replaceAll("/seoul", "");
					str.replaceAll("seoul", "");
					seoulClick--;
				} else {
					if (str == "") {
						str = clickStr;
						seoulClick++;
					} else {
						str = str + "/" + clickStr;
						seoulClick++;
					}
				}
			}
		});

		function tagSearch() {
			location.href = "review.jsp?str=" + str;
		}

		/* 변수값 받아와서 되는지 한 번 해보기.
		 var str = "";
		 var busanClick = 0;
		 var seoulClick = 0;

		
		 버튼을 눌리면 지역정보를 문자열에 담아 LIKE 검색
		 지역이 16곳이라고 하셨는데 몰라서 일단 주석만 남겨놓겠습니다.
		 부산과 서울만 해뒀음!!
		 눌렸을때 눌려졌다는 표시를 위해 background-color 변화를 줘도 괜찮을듯...
		
		 function busan() {
		 if (busanClick == 1) {
		 str.replaceAll("/busan", "");
		 str.replaceAll("busan", "");
		 busanClick--;
		 } else {
		 if (str == "") {
		 str = "busan";
		 busanClick++;
		 } else {
		 str = str + "/busan";
		 busanClick++;
		 }
		 }
		 }

		 function seoul() {
		 if (seoulClick == 1) {
		 str.replaceAll("/seoul", "");
		 str.replaceAll("seoul", "");
		 seoulClick--;
		 } else {
		 if (str == "") {
		 str = "seoul";
		 seoulClick++;
		 } else {
		 str = str + "/seoul";
		 seoulClick++;
		 }
		 }
		 } */

		function writeReview() {
			location.href = "write.jsp";
		}

		function backToMain() {
			location.href = "Main.do";
		}

		$(function() {
			$(".title")
					.click(
							function() {
								if ($(this).parent().next().children().next()
										.children().val() == 'off') {
									$(this).parent().next().css("display",
											"table-row");
									$(this).parent().next().children().next()
											.children().val("on");
								} else if ($(this).parent().next().children()
										.next().children().val() == 'on') {
									$(this).parent().next().css("display",
											"none");
									$(this).parent().next().children().next()
											.children().val("off");
								}
							});
			/* 
			 $(".busan").click(function() {
			 if (busanClick == 1) {
			 $(".busan").css("background-color", "skyblue");
			 } else {
			 $(".busan").css("background-color", "white");
			 }
			 }); */
		});
	</script>
</body>
</html>