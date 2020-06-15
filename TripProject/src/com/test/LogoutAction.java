package com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.nio.cs.HistoricallyNamedCharset;

public class LogoutAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		forward.setRedirect(true);	//redirect는 값을 안 가지고
		forward.setNextPage("Main.do");
		
		return forward;
	}
}
