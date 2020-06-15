package com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class noticeAction implements Action{	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);	//redirect는 값을 안 가지고
		forward.setNextPage("notice.jsp");
		
		return forward;
	}
}
