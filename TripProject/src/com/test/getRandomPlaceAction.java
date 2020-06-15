package com.test;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class getRandomPlaceAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		//String id = request.getParameter("id");
		TripDAO dao = new TripDAO();
		Vector<TripDTO> v = dao.getRandomPlace();		
		request.setAttribute("place", v);
		
		Vector<TripDTO> v1 = dao.getRandomPlace4();
		request.setAttribute("place4", v1);
		
		forward.setRedirect(false);	//redirect는 값을 안 가지고
		forward.setNextPage("Main.jsp");
		
		return forward;
	}
}
