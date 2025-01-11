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
 * Servlet implementation class VendorLogin
 */
public class VendorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorLogin() {
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
		String email1=null;
		String pass1=null;
		String email=request.getParameter("email");
		
		VendorInfo.setEmail(email);
		
		String pass=request.getParameter("password");
		System.out.println(email);
		System.out.println(pass);
		try {
			PreparedStatement stmt=con.prepareStatement("select * from vendorlogin where email=? and password=?");
			stmt.setString(1, email);
			stmt.setString(2,pass);
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
				 email1=rs.getString(2);
				 pass1=rs.getString(3);
				 System.out.println(email1);
				 System.out.println(pass1);
			}
			if(email.equals(email1)&&pass.equals(pass1))
			{
				System.out.println("login completed");
				response.sendRedirect("vendorDashboard.html");
			}
			else
			{
				response.sendRedirect("vendorLogin.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
