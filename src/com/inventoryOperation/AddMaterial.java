package com.inventoryOperation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inventory.Db.InventoryConnection;

/**
 * Servlet implementation class AddMaterial
 */
public class AddMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMaterial() {
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
		int sr_no=0;
		int rid=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("rname");
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		String unit=request.getParameter("unit");
		int cpu=Integer.parseInt(request.getParameter("cost"));
		//int fcost=quantity*cpu;
		System.out.println(rid+""+name+""+quantity+""+unit+""+cpu);
		if(quantity<=0 || cpu<=0)
		{
			response.sendRedirect("please.html");
		}
		else{
			
		try {
			PreparedStatement ps=con.prepareStatement("insert into raw_material values(?,?,?,?,?,?)");
			ps.setInt(1,sr_no);
			ps.setInt(2,rid);
			ps.setString(3, name);
			ps.setInt(4, quantity);
			ps.setString(5, unit);
			ps.setInt(6, cpu);
			int i=ps.executeUpdate();
			if(i>0)
			{
				//PrintWriter out=response.getWriter();
				//out.println("your material is successfully added");
				//response.sendRedirect("dashboard.html");
				response.sendRedirect("addMaterial.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
		
		
	}

}
