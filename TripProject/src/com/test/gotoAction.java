package com.test;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class gotoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		TripDAO dao = new TripDAO();
		String code = request.getParameter("code");
		Vector cnt = dao.selectRegion(code);
		request.setAttribute("open", cnt);
		
		forward.setRedirect(false);
		if(code.equals("051")){
			forward.setNextPage("busan.jsp");
		}else if(code.equals("02")){
			forward.setNextPage("seoul.jsp");
		}else if(code.equals("064")){
			forward.setNextPage("jeju.jsp");
		}else if(code.equals("032")){
			forward.setNextPage("incheon.jsp");
		}else if(code.equals("053")){
			forward.setNextPage("daegu.jsp");
		}else if(code.equals("042")){
			forward.setNextPage("daejeon.jsp");
		}else if(code.equals("062")){
			forward.setNextPage("gwangju.jsp");
		}else if(code.equals("052")){
			forward.setNextPage("ulsan.jsp");
		}
		
		return forward;
	}

}
