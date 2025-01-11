package com.inventoryOperation;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class LogsRaw
 */
public class LogsRaw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogsRaw() {
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
		int prev_quantity=0,id=0;
		
		int item_id=Integer.parseInt(request.getParameter("item_id"));
		String item_name=request.getParameter("item_name");
		int issuer_id=0;
		String issuer_name=request.getParameter("iname");
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		String date=request.getParameter("date");
	    String time=request.getParameter("time");
		//System.out.println(item_id+" "+item_name+" "+issuer_name+" "+quantity+" "+date+" "+time);
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from raw_material where id=? and rname=?");
		    pstmt.setInt(1, item_id);
		    pstmt.setString(2, item_name);
		    System.out.println(item_id+""+item_name);
		    ResultSet rs2=pstmt.executeQuery();
		    
		       if(rs2.next())
		       {
		    	
		    	//PrintWriter out=response.getWriter();
		    	//out.println("item found ");
		    	prev_quantity=rs2.getInt(4);
		    	id=rs2.getInt(2);
		    	if(quantity>0)
		    	{
		    		if(prev_quantity>=quantity)
		    		{
		    			
		    		
		    		PreparedStatement stmt=con.prepareStatement("insert into logs_raw values (?,?,?,?,?,?,?)");
					stmt.setInt(1,issuer_id);
					stmt.setString(2,issuer_name);
					stmt.setInt(3,item_id);
					stmt.setString(4,item_name);
					stmt.setInt(5, quantity);
					stmt.setString(6,date);
					stmt.setString(7,time);
					int i=stmt.executeUpdate();
					  if(i>0)
					  {
						response.sendRedirect("viewLogsRaw2.jsp");
						System.out.println(i);
					  }
					
					    int new_quantity=prev_quantity-quantity; 
					    System.out.println(new_quantity);
					    PreparedStatement pstmt2=con.prepareStatement("update raw_material set quantity=? where id=?");
			            pstmt2.setInt(1,new_quantity);
			            pstmt2.setInt(2,id );
			            int j=pstmt2.executeUpdate();
			            System.out.println(j+"quantity updated");
		    		}   
			        else
			        {
			            	response.sendRedirect("insufficient_quantity.html");
			        }
			            
					       
		    	}
		    	else{
			    	//PrintWriter out=response.getWriter();
			    	//out.println(" Insufficient Quanatity ");
			    	 response.sendRedirect("please.html");
		    		}
		    	}
	
		    else
		    {
		    	response.sendRedirect("itemnotfound.html");
		    }
		    
		   /* int new_quantity=prev_quantity-quantity; 
		    System.out.println(new_quantity);
		    PreparedStatement pstmt2=con.prepareStatement("update raw_material set quantity=? where id=?");
            pstmt2.setInt(1,new_quantity);
            pstmt2.setInt(2,id );
            int j=pstmt2.executeUpdate();
            System.out.println(j+"quantity updated");*/
		       
		       
		       
		    
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
		
		
		
		
	}

}
