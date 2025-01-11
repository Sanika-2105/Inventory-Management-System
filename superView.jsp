
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.inventory.Db.InventoryConnection"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.inventoryOperation.VendorInfo"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Inventory Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/morris.css" type="text/css"/>
<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery-2.1.4.min.js"></script>
<!-- //jQuery -->
<!-- tables -->
<link rel="stylesheet" type="text/css" href="css/table-style.css" />
<link rel="stylesheet" type="text/css" href="css/basictable.css" />
<script type="text/javascript" src="js/jquery.basictable.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#table').basictable();

      $('#table-breakpoint').basictable({
        breakpoint: 768
      });

      $('#table-swap-axis').basictable({
        swapAxis: true
      });

      $('#table-force-off').basictable({
        forceResponsive: false
      });

      $('#table-no-resize').basictable({
        noResize: true
      });

      $('#table-two-axis').basictable();

      $('#table-max-height').basictable({
        tableWrapper: true
      });
    });
</script>
<!-- //tables -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->
</head> 
<body>



<style>
	.agile-tables{
		margin-left:300px;
		margin-right:60px;
	}
</style>



   <div class="page-container">
   <!--/content-inner-->
		
							<!--search-box-->
								<div class="w3-search-box">
									<form action="#" method="post">
										<input type="text" placeholder="Search..." required="">	
										<input type="submit" value="">					
									</form>
								</div><!--//end-search-box-->
							<div class="clearfix"> </div>
						 </div>
						
						
				</div>
<!--heder end here
<ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a><i class="fa fa-angle-right"></i>Tabels</li>
            </ol>
<div class="agile-grids">	
				 tables -->
<% Connection con=InventoryConnection.connect();
//String vemail=VendorInfo.getEmail();
//System.out.println(vemail);
PreparedStatement pstmt=con.prepareStatement("select * from vapply_raw");
//pstmt.setString(1,vemail);
ResultSet rs=pstmt.executeQuery();
%>

				<div class="agile-tables">
					<div class="w3l-table-info">
					  <h2> Vendor Requests for Raw Material</h2>
					    <table id="table">
						<thead>
						  <tr>
						    <th>Serial Number</th>
							<th>Vendor-email</th>
							<th>Vendor-name</th>
							<th>Product-id</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Unit</th>
							<th>Cost Per Unit</th>
							<th>Approve Product</th>
						  </tr>
						</thead>
						<%while(rs.next()){ %>
						<tbody>
						  <tr>
						    <td><%=rs.getInt(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getInt(4)%></td>
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getInt(6)%></td>
							<td><%=rs.getString(7)%></td>
							<td><%=rs.getInt(8)%></td>
					 <td><a href="superApproved.jsp?srno=<%=rs.getInt(1)%>">approve</a></td>
						  </tr>
						</tbody>
						 <%} %>
					  </table>
					</div>
				  
			</div>
<!-- script-for sticky-nav -->
		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script>
		<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">

</div>
<!--inner block end here-->
<!--copy rights start here-->
<!--<div class="copyrights">
	 <p>© 2016 Pooled . All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
</div>	
COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
		<!--/sidebar-menu-->
				<div class="sidebar-menu">
		<header class="logo1">
			<a href="#" class="sidebar-icon">Aakar Furnitures <span class="fa fa-bars"></span> </a> 
		</header>
			<div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
			   <div class="menu">
						<ul id="menu" >
							<!--<li><a href="index.html"><i class="fa fa-tachometer"></i> <span>Dashboard</span><div class="clearfix"></div></a></li>
							
							
							 <li id="menu-academico" ><a href="inbox.html"><i class="fa fa-envelope nav_icon"></i><span>Inbox</span><div class="clearfix"></div></a></li>
						<li><a href="gallery.html"><i class="fa fa-picture-o" aria-hidden="true"></i><span>Gallery</span><div class="clearfix"></div></a></li>
						<li id="menu-academico" ><a href="charts.html"><i class="fa fa-bar-chart"></i><span>Charts</span><div class="clearfix"></div></a></li>-->									 
						
							  
							  <li id="menu-academico" ><a href="superView.jsp"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><span> View Vendor Requests</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
							  <li id="menu-academico" ><a href="SuperApprovedRequest.jsp"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><span> View Approved Vendor Requests</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>	
							   <!--  <ul id="menu-academico-sub" >
							   <li id="menu-academico-avaliacoes" ><a href="addMaterial.html">Add Raw Material</a></li>
								<li id="menu-academico-avaliacoes" ><a href="viewRawM.jsp">View Raw Material</a></li>
								<li id="menu-academico-avaliacoes" ><a href="updateRMaterial.html">Update Raw Material</a></li>
							  </ul>
							</li>
							<li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span> Processed items</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
								<ul id="menu-academico-sub" >
								<li id="menu-academico-avaliacoes" ><a href="addPMaterial.html">Add Processed items </a></li>
								 <li id="menu-academico-avaliacoes" ><a href="viewProcessedM.jsp">View Processed items</a></li>
								 <li id="menu-academico-avaliacoes" ><a href="updatePMaterial.html">Update Processed items</a></li>
							   </ul>
							 </li>
						<li id="menu-academico" ><a href="logs_raw.html"><i class="fa fa-angle-right" aria-hidden="true"></i><span>Issue Raw Material</span><div class="clearfix"></div></a></li>
						<li id="menu-academico" ><a href="viewLogsRaw2.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i><span>View Logs Raw </span><div class="clearfix"></div></a></li>
						<li id="menu-academico" ><a href="logs_processed.html"><i class="fa fa-angle-right" aria-hidden="true"></i><span>Issue Processed Material</span><div class="clearfix"></div></a></li>
						<li id="menu-academico" ><a href="viewLogsProcessed.jsp"><i class="fa fa-angle-right" aria-hidden="true"></i><span>View Logs Processed</span><div class="clearfix"></div></a></li>
						  <li id="menu-academico" ><a href="#"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><span> Show Unavailable Items</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
							   <ul id="menu-academico-sub" >
							   <li id="menu-academico-avaliacoes" ><a href="UnavailableRaw.jsp">Raw</a></li>
								<li id="menu-academico-avaliacoes" ><a href="UnavailableProcessed.jsp">Processed</a></li>
							  </ul>
							</li>
						 <!--<li><a href="tabels.html"><i class="fa fa-table"></i>  <span>Tables</span><div class="clearfix"></div></a></li>
						<!--<li><a href="maps.html"><i class="fa fa-map-marker" aria-hidden="true"></i>  <span>Maps</span><div class="clearfix"></div></a></li>
						<li id="menu-academico" ><a href="#"><i class="fa fa-file-text-o"></i>  <span>Pages</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
							 <ul id="menu-academico-sub" >
								<li id="menu-academico-boletim" ><a href="calendar.html">Calendar</a></li>
								<li id="menu-academico-avaliacoes" ><a href="signin.html">Sign In</a></li>
								<li id="menu-academico-avaliacoes" ><a href="signup.html">Sign Up</a></li>
								

							  </ul>
						 </li>
						<li><a href="#"><i class="fa fa-check-square-o nav_icon"></i><span>Forms</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
						  <ul>
							<li><a href="input.html"> Input</a></li>
							<li><a href="validation.html">Validation</a></li>
						</ul>
						</li>-->
					  </ul>
					</div>
				  </div>
				  <div class="clearfix"></div>		
				</div>
							
							<script>
							var toggle = true;
										
							$(".sidebar-icon").click(function() {                
							  if (toggle)
							  {
								$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
								$("#menu span").css({"position":"absolute"});
							  }
							  else
							  {
								$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
								setTimeout(function() {
								  $("#menu span").css({"position":"relative"});
								}, 400);
							  }
											
											toggle = !toggle;
										});
							</script>
<!--js -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   

</body>
</html>