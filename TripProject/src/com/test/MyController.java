package com.test;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



/**
 * Servlet implementation class MyController
 */
@WebServlet("/MyController")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyController() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		String command = requestURI.substring(cmdIdx);
		String viewPage = null;
		
		Action action = null;
		ActionForward forward = null;
		
		System.out.println(command);
				// *.do 처음값 
		
		try{			
			if(command.equals("Main.do")){				
				action = new getRandomPlaceAction();
				forward = action.execute(request, response);
			}else if(command.equals("city.do")){				
				action = new GetCityInfo();
				forward = action.execute(request, response);
			}else if(command.equals("place.do")){
				action = new GetPlaceInfo();
				forward = action.execute(request, response);
			}else if(command.equals("korea.do")){
				action = new koreaAction();
				forward = action.execute(request, response);
			}else if(command.equals("busan.do")){
				action = new gotoAction();
				forward = action.execute(request, response);
			}else if(command.equals("seoul.do")){
				action = new gotoAction();
				forward = action.execute(request, response);
			}else if(command.equals("jeju.do")){
				action = new gotoAction();
				forward = action.execute(request, response);
			}else if(command.equals("incheon.do")){
				action = new gotoAction();
				forward = action.execute(request, response);
			}else if(command.equals("daegu.do")){
				action = new gotoAction();
				forward = action.execute(request, response);
			}else if(command.equals("daejeon.do")){
				action = new gotoAction();
				forward = action.execute(request, response);
			}else if(command.equals("gwangju.do")){
				action = new gotoAction();
				forward = action.execute(request, response);
			}else if(command.equals("ulsan.do")){
				action = new gotoAction();
				forward = action.execute(request, response);
			}else if(command.equals("regist.do")){
				action = new registAction();
				forward = action.execute(request, response);
			}else if(command.equals("login.do")){
				action = new LoginAction();
				forward = action.execute(request, response);
			}else if(command.equals("logout.do")){
				action = new LogoutAction();
				forward = action.execute(request, response);
			}else if(command.equals("review.do")){
				action = new reviewAction();
				forward = action.execute(request, response);
			}else if(command.equals("mypage.do")){
				action = new mypageAction();
				forward = action.execute(request, response);
			}else if(command.equals("cs.do")){
				action = new csAction();
				forward = action.execute(request, response);
			}else if(command.equals("uppro.do")){
				action = new upproAction();
				forward = action.execute(request, response);
			}else if(command.equals("upproview.do")){
				action = new upproviewAction();
				forward = action.execute(request, response);
			}else if(command.equals("notice.do")){
				action = new noticeAction();
				forward = action.execute(request, response);
			}else if(command.equals("notice_view.do")){
				action = new postviewAction();
				forward = action.execute(request, response);
			}else if(command.equals("insert.do")){
				action = new InsertAction();
				forward = action.execute(request, response);
			}else{			
				response.sendRedirect("Main.do");
			}		
			if(forward!=null){
				if(forward.isRedirect()){
					response.sendRedirect(forward.getNextPage()); //값을 가져갈 필요가 없어서 바로 sendRedirect.
				}else{
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getNextPage());
					dispatcher.forward(request, response);	
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}












/*package com.test;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import com.test.testDAO;


*//**
 * Servlet implementation class MyController
 *//*
@WebServlet("/MyController")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;   
       
    *//**
     * @see HttpServlet#HttpServlet()
     *//*
    public MyController() {
        super();
        try{
        	Context init = new InitialContext();
        	ds = (DataSource)init.lookup("java:comp/env/jdbc/TestDB");
        }catch(NamingException e){
        	e.printStackTrace();
        }
        // TODO Auto-generated constructor stub
    }

	*//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}
	
	public int getCount(){
		String sql = "SELECT count(*) FROM idpw";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch ( SQLException e){
			e.printStackTrace();
		} finally {
			try{
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e){
				e.printStackTrace();
			}
		}
		return count;
	}
	
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestURI = request.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		String command = requestURI.substring(cmdIdx);
		String viewPage = null;
		
		Action action = null;
		ActionForward forward = null;
		
		System.out.println(command);	
		try{
			if(command.equals("main.do")){
				action = new GetCountAction();
				forward = action.execute(request, response);
				
				viewPage = "main.jsp";
				request.setAttribute("aa",getCount());
				
			}else{
				response.sendRedirect("main.do");
			}
			else if(command.equals("login.do")){
				
				viewPage = "login.jsp";
				request.setAttribute("aa", "login");
				
			}else if(command.equals("register.do")){
				
				viewPage = "register.jsp";
				request.setAttribute("aa", "register");
				
			}			
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getNextPage());
			dispatcher.forward(request, response);
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
*/