package com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class upproAction implements Action{	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		TripDAO dao = new TripDAO();
		
		
		String id = (String)session.getAttribute("loginID");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");		
		
		int n = dao.updateMember(id, pw, name, email);		
		if(n<1){
			
		} else {
			forward.setRedirect(true);	
			forward.setNextPage("uppro.jsp");
		}
		
		return forward;
	}
}
