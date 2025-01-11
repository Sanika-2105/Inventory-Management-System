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
 * Servlet implementation class UpdateRMaterial
 */
public class UpdateRMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRMaterial() {
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
		int old_quantity=0;
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("rname");
		int new_quantity=Integer.parseInt(request.getParameter("quantity"));
		System.out.println(id+""+name+""+new_quantity);
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from raw_material where id=?");
			pstmt.setInt(1,id );
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				old_quantity=rs.getInt(4);
				System.out.println(old_quantity);
			}
			new_quantity=old_quantity+new_quantity;
			System.out.println(new_quantity);
			PreparedStatement stmt=con.prepareStatement("update raw_material set quantity=? where id=?");
			stmt.setInt(1,new_quantity);
			stmt.setInt(2,id);
	
			int i=stmt.executeUpdate();
			System.out.println(i);
			if(i>0)
			{
				response.sendRedirect("viewRawM.jsp");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
