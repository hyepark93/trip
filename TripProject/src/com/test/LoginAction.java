package com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub	
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		TripDAO dao = new TripDAO();
		
		int n = dao.checkMember(id, pw);
		
		if(n<1){
			
		} else {
			session.setAttribute("loginID", id);
			session.setAttribute("loginPW", pw);
		}		
		
		forward.setRedirect(true);	//redirect는 값을 안 가지고
		forward.setNextPage("Main.do");
		
		return forward;
	}

}
