package com.test;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class mypageAction implements Action{	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		TripDAO dao = new TripDAO();
		String id = (String) session.getAttribute("loginID");
		Vector cnt = dao.myProfile(id);
		Vector cnt1 = dao.myReview(id);
		
		request.setAttribute("profile", cnt);
		request.setAttribute("review", cnt1);
		
		forward.setRedirect(false);	//redirect는 값을 안 가지고
		forward.setNextPage("mypage.jsp");
		
		return forward;
	}
}
