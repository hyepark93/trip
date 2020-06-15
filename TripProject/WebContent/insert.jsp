<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.test.*" %>
<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("utf-8");
    
	/* 태그 구현은 region 을 받은걸로 처리하는데 일단 임시임 */
    String title = request.getParameter("title");
    String comment = request.getParameter("comment");
    String id = request.getParameter("id");
    String region = request.getParameter("region");
    
    TripDAO dao = new TripDAO();
    
    int n = dao.writeReview(title, comment, id, region);      
%>

<script>
	/* 
	게시판으로 가게 해뒀음
	필요에 따라 수정해야함
	*/
	location.href="review.jsp";
</script>