package com.inventoryOperation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inventory.Db.InventoryConnection;

/**
 * Servlet implementation class ApplyRaw
 */
public class ApplyRaw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyRaw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Connection con=InventoryConnection.connect();
		int srno=0;
		String status="Not Applied";
		String vemail=request.getParameter("vemail");
		String vname=request.getParameter("vname");
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("rname");
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		String unit=request.getParameter("unit");
		int cpu=Integer.parseInt(request.getParameter("cost"));
		
		System.out.println(id+""+name+""+quantity+""+unit+""+cpu+""+vemail+""+vname);
		try {
			PreparedStatement pstmt=con.prepareStatement("insert into vapply_raw values(?,?,?,?,?,?,?,?,?)");
		    pstmt.setInt(1,srno);
		    pstmt.setString(2,vemail);
		    pstmt.setString(3, vname);
		    pstmt.setInt(4, id);
		    pstmt.setString(5, name);
		    pstmt.setInt(6, quantity);
		    pstmt.setString(7, unit);
		    pstmt.setInt(8, cpu);
		    pstmt.setString(9, status);
		    int i=pstmt.executeUpdate();
		    if(i>0)
		    {
		    	System.out.println("applied raw material");
		    	response.sendRedirect("ViewAppliedRaw.jsp");
		    }
		    
		    
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
