<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.test.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String x_locate = request.getParameter("x_locate");
		String y_locate = request.getParameter("y_locate");
		
		TripDAO dao = new TripDAO();
		int n = dao.inLocation(x_locate, y_locate);
	%>
	
	<script>
		location.href="getLocation.jsp";
	</script>
</body>
</html>