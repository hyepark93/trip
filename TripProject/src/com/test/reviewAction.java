package com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class reviewAction implements Action{	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);	//redirect�� ���� �� ������
		forward.setNextPage("review.jsp");
		
		return forward;
	}
}