package com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		String id = (String)session.getAttribute("loginID");
		String title = request.getParameter("title");
		String comment = request.getParameter("comment");
		String region = request.getParameter("region");
		
		TripDAO dao = new TripDAO();
		
		int n = dao.writeReview(title, comment, id, region);
		
		forward.setRedirect(false);	//redirect는 값을 안 가지고
		forward.setNextPage("review.jsp");
		
		return forward;
	}
}