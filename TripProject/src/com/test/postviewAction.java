package com.test;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class postviewAction implements Action{	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		TripDAO dao = new TripDAO();
		String num = request.getParameter("num");
		TripDTO dto = dao.postview(num);	
		request.setAttribute("postview", dto);
		forward.setRedirect(false);	//redirect는 값을 안 가지고
		forward.setNextPage("notice_view.jsp");
		
		return forward;
	}
}
