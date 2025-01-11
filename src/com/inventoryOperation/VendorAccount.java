package com.inventoryOperation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inventory.Db.InventoryConnection;

/**
 * Servlet implementation class VendorAccount
 */
public class VendorAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorAccount() {
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
		
		String vname=request.getParameter("vname");
		//VendorInfo.setName(vname);
		String email=request.getParameter("email");
		VendorInfo.setEmail(email);
		String pass=request.getParameter("password");
		System.out.println(email);
		System.out.println(pass);
		try {
			PreparedStatement stmt=con.prepareStatement("insert into vendorlogin values(?,?,?)");
			stmt.setString(1, vname);
			stmt.setString(2, email);
			stmt.setString(3,pass);
			int i=stmt.executeUpdate();
			if(i>0)
			{
				System.out.println(i+"account created");
				response.sendRedirect("vendorLogin.html");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
