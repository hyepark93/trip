package com.test;

import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetPlaceInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

				String code = request.getParameter("code");
				
				ActionForward forward = new ActionForward();
				TripDAO dao = new TripDAO();
				
				Vector<TripDTO> v = dao.getAllPlace(code);				
				request.setAttribute("place", v);
				
				forward.setRedirect(false);				
				forward.setNextPage("Place.jsp?code="+code);
		return forward;
	}	
}

