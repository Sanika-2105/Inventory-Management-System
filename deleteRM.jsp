<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.inventory.Db.InventoryConnection"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inventory Management System</title>
</head>
<body>
<%Connection con=InventoryConnection.connect();

int sid=Integer.parseInt(request.getParameter("sid"));
PreparedStatement pstmt=con.prepareStatement("delete from raw_material where sr_no=?");
pstmt.setInt(1, sid);
int i=pstmt.executeUpdate();
//System.out.println("Reminder deleted");
if(i>0)
{
	// PrintWriter out1=response.getWriter();
	//out1.println("Reminder deleted successfully");
    response.sendRedirect("viewRawM.jsp");
}
else
{
	PrintWriter out1=response.getWriter();
	out1.println("Material not deleted");
}
%>

</body>
</html>