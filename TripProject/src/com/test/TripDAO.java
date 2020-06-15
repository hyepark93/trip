package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TripDAO {
	private DataSource ds;

	public TripDAO(){
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Vector<TripDTO> getAllCity(){
		Vector<TripDTO> v=new Vector<TripDTO>();
		String query = "select name, img from spot1";
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TripDTO dto = new TripDTO();
				dto.setNAME(rs.getString(1));
				dto.setImg(rs.getString(2));
				v.add(dto);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{			
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}

	public Vector<TripDTO> getAllPlace(String city){
		Vector<TripDTO> v=new Vector<TripDTO>();

		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "";
		query = "select code, region, region_e, grouping, name, address, info, img from spot1 where code = ?";
		
		/*if(grouping.equals("food")){
			query = "select name, img, region_e,code from spot1 where code = ? and grouping = 'food'";
		}else if(grouping.equals("attrac")){
			query = "select name, img, region_e,code from spot1 where code = ? and grouping = 'attraction'";
		}else if(grouping.equals("all")){
			
		}
*/
		int iCity = Integer.parseInt(city);

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, iCity);
			rs = pstmt.executeQuery();			


			while(rs.next()){
				TripDTO dto = new TripDTO();
				dto.setCode(rs.getString(1));
				dto.setRegion(rs.getString(2));
				dto.setRegion_e(rs.getString(3));
				dto.setGrouping(rs.getString(4));
				dto.setNAME(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setInfo(rs.getString(7));
				dto.setImg(rs.getString(8));
				v.add(dto);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{			
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}


	public Vector<TripDTO> getRandomPlace(){

		Vector<TripDTO> v= new Vector<TripDTO>();
		String query = "select NAME, code, img, info from spot1 order by rand() limit 7";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TripDTO dto = new TripDTO();
				dto.setNAME(rs.getString(1));
				dto.setCode(rs.getString(2));
				dto.setImg(rs.getString(3));
				dto.setInfo(rs.getString(4));
				v.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{			
			try {
				if(rs!=null){
					rs.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(conn!=null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
		}
		return v;
	} 

	public Vector<TripDTO> getRandomPlace4(){

		Vector<TripDTO> v= new Vector<TripDTO>();
		String query = "select NAME, code, img, info from spot1 order by rand() limit 4";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TripDTO dto = new TripDTO();
				dto.setNAME(rs.getString(1));
				dto.setCode(rs.getString(2));
				dto.setImg(rs.getString(3));
				dto.setInfo(rs.getString(4));
				v.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{			
			try {
				if(rs!=null){
					rs.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(conn!=null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();			
			}
		}
		return v;
	} 

	public Vector selectAll(){
		ResultSet rs=null;
		String query = "select * from spot1";
		Connection conn = null;
		PreparedStatement pstmt = null;
		Vector<TripDTO> v = new Vector();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			while(rs.next()){
				TripDTO dto = new TripDTO();
				dto.setIdx(rs.getString(1));
				dto.setCode(rs.getString(2));
				dto.setRegion(rs.getString(3));
				dto.setRegion_e(rs.getString(4));
				dto.setGrouping(rs.getString(5));
				dto.setNAME(rs.getString(6));
				dto.setAddress(rs.getString(7));
				dto.setInfo(rs.getString(8));
				dto.setImg(rs.getString(9));
				dto.setLeftx(rs.getString(10));
				dto.setTopy(rs.getString(11));
				v.add(dto);
				//System.out.println(rs.getString("id")+":"+rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}

	public Vector selectRegion(String c){
		ResultSet rs=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "select * from spot1 where code=?";
		Vector<TripDTO> v = new Vector();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c);
			rs=pstmt.executeQuery();
			while(rs.next()){
				TripDTO dto = new TripDTO();
				dto.setIdx(rs.getString(1));
				dto.setCode(rs.getString(2));
				dto.setRegion(rs.getString(3));
				dto.setRegion_e(rs.getString(4));
				dto.setGrouping(rs.getString(5));
				dto.setNAME(rs.getString(6));
				dto.setAddress(rs.getString(7));
				dto.setInfo(rs.getString(8));
				dto.setImg(rs.getString(9));
				dto.setLeftx(rs.getString(10));
				dto.setTopy(rs.getString(11));
				v.add(dto);
				//System.out.println(rs.getString("id")+":"+rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}

	public int inLocation(String x_locate, String y_locate){
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnectionMgr pool = DBConnectionMgr.getInstance();

		String query = "insert into location_xy values(?, ?)";

		try{
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, x_locate);
			pstmt.setString(2, y_locate);
			result = pstmt.executeUpdate();
		}catch(Exception e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt);
		}

		return result;
	}

	public int checkMember(String id, String pw){
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = DBConnectionMgr.getInstance();

		String query = "select * from member where id=? and pw=?";

		try{
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if(rs.next()){
				result = 1;
			} else {
				result = 0;
			}
		}catch(Exception e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return result;
	}

	public int registerMember(String id, String pw, String name, String email, String sex, String age){
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		DBConnectionMgr pool = DBConnectionMgr.getInstance();

		String query = "insert into member values(?,?,?,?,?,?)";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, sex);
			pstmt.setString(6, age);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt);
		}
		return result;
	}		


	public Vector<TripDTO> takeReview(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnectionMgr pool = DBConnectionMgr.getInstance();
		Vector<TripDTO> vec = new Vector<TripDTO>();
		ResultSet rs = null;

		String query = "select * from writes";		

		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();			
			while(rs.next()){
				TripDTO dto = new TripDTO();				
				dto.setId(rs.getString(1));
				dto.setnDate(rs.getString(2));
				dto.setComment(rs.getString(3));
				dto.setImg(rs.getString(4));

				vec.add(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}

		return vec;
	}
	public Vector<TripDTO> allReview(String region){
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnectionMgr pool = DBConnectionMgr.getInstance();
		Vector<TripDTO> vec = new Vector<TripDTO>();
		ResultSet rs = null;

		String[] arr = region.split("/");
		String subQuery = "";

		for(int i=0 ; i<arr.length ; i++){
			if(i==0){
				subQuery = "where region like '%"+arr[i]+"%'";
			} else {
				subQuery = subQuery + " or region like '%"+arr[i]+"%'";
			}
		}

		String query = "select * from reviewtable "+subQuery;		

		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();			
			while(rs.next()){
				TripDTO dto = new TripDTO();				
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setComment(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setRegion(rs.getString(5));
				dto.setnDate(rs.getString(6));
				vec.add(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt, rs);
		}

		return vec;
	}

	public int writeReview(String title, String comment, String id, String region){
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnectionMgr pool = DBConnectionMgr.getInstance();

		String query = "insert into reviewtable values(null, ?, ?, ?, ?, now())";

		try{
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, comment);
			pstmt.setString(3, id);
			pstmt.setString(4, region);
			result = pstmt.executeUpdate();
		}catch(Exception e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt);
		}

		return result;
	}

	
	public	TripDTO postview(String num) {
		
		TripDTO dto= new TripDTO();
		String query = "select * from notice where num=?";
		Connection conn;
		PreparedStatement pstmt=null;
		ResultSet rs = null;		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setNum(rs.getInt(1));
				dto.setSubject(rs.getString(2));
				dto.setL_content(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setDate(rs.getString(5));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{			
			try {
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dto;
	} 
	
	public Vector selectNotice(){
		Vector<TripDTO> vn=new Vector<TripDTO>();
		String query = "select * from notice order by num desc";
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TripDTO dto = new TripDTO();
				
				dto.setNum(rs.getInt(1));
				dto.setSubject(rs.getString(2));
				dto.setL_content(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setDate(rs.getString(5));
				vn.add(dto);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{			
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return vn;
	}
	
	public Vector myProfile(String id){
		ResultSet rs=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "select id, name, sex, birth from member where id=?";
		Vector<TripDTO> v = new Vector();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				TripDTO dto = new TripDTO();
				dto.setP_id(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setSex(rs.getString(3));
				dto.setBirth(rs.getString(4));
				v.add(dto);
				//System.out.println(rs.getString("id")+":"+rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}
	
	public Vector myReview(String id){
		ResultSet rs=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "select title, comment, nDate from reviewtable where id=?";
		Vector<TripDTO> v = new Vector();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				TripDTO dto = new TripDTO();
				dto.setTitle(rs.getString(1));
				dto.setComment(rs.getString(2));
				dto.setnDate(rs.getString(3));
				v.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}
	
	public int updateMember(String id, String pw, String name, String email){
		int result = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnectionMgr pool = DBConnectionMgr.getInstance();

		String query = "update member set pw=?, name=?, email=? where id=?";

		try{
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			result = pstmt.executeUpdate();
		}catch(Exception e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(conn, pstmt);
		}

		return result;
	}
	
	public Vector upProfile(String id){
		ResultSet rs=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "select id, pw, name, email, birth from member where id=?";
		Vector<TripDTO> v = new Vector();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				TripDTO dto = new TripDTO();
				dto.setP_id(rs.getString(1));
				dto.setPw(rs.getString(2));
				dto.setNAME(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setBirth(rs.getString(5));
				v.add(dto);
				//System.out.println(rs.getString("id")+":"+rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return v;
	}
}






