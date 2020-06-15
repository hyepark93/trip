package com.test;

import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCityInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
				ActionForward forward = new ActionForward();
				TripDAO dao = new TripDAO();
				Vector<TripDTO> v = dao.getAllCity();
				request.setAttribute("code", v);
				
				forward.setRedirect(false);
				forward.setNextPage("City.jsp");
				
		return forward;
	}	
}

