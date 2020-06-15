package com.test;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		TripDAO dao = new TripDAO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		
		int n = dao.registerMember(id, pw, name, email, sex, age);		
		
		forward.setRedirect(true);	//redirect는 값을 안 가지고
		forward.setNextPage("Main.do");
		
		return forward;
	}
}