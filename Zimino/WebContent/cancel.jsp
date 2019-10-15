<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import="zimino.Cancel" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancel order</title>
<link rel="stylesheet" href="zimino_stylesheet.css"> 
</head>
<body>
<header>

<div class="topnav">
<nav>
<ul>
 <li><a href= "http://localhost:8080/Zimino/welcome.html">Welcome</a></li>
  <li><a href= "http://localhost:8080/Zimino/menu.html" >Menu</a></li>
   <!--The Reservations does not have a web page. It just links to opentable.com-->
      <li><a href = "https://www.opentable.com" > Reservations  </a></li>
  <li><a href="http://localhost:8080/Zimino/order.jsp">Order</a></li>
  <li><a href="http://localhost:8080/Zimino/updateOrder.jsp">Change Order</a></li>
  <li><a href="http://localhost:8080/Zimino/cancel.jsp">Cancel order</a></li>
  <li><a href="http://localhost:8080/Zimino/ordered">View all orders</a></li>
  <li><a href="http://localhost:8080/Zimino/Connect.html">Connect</a></li>
</ul>
</nav>
</div>
</header>
<br/>
<img src="logo.gif" class="centerpic">

<div class = "center">
<div class = "LeftText">
<h2>Cancel Order</h2>

<form action="Select_cancel" method = "POST">
<table>
	<tr>
	<td>First Name : </td>
	<td> <input type = "text" name = "first" size = "20" maxlength = "20"> </td>
	</tr>
	<tr>
		<td>Last Name : </td>
	<td><input type = "text" name = "last" size = "20" maxlength = "20"> </td>
	</tr>
	<tr>
   <td colspan = "2" align = "right" >  <input type = "submit"  value = "Submit" >  </td>
   </tr>
</table>
</form>

</div>
</div>

<div id="footer">
<p> Copyright © 2019 Zimino. All Rights Reserved for Shelly Sun, Andrew Bell, Jasper Kolp.
 <a href = "https://www.facebook.com/Antiche-Sere-Osteria-Enoteca-Bevagna-907749329293919/">
 Photography credit: Antiche Sere Osteria Enoteca, Bevagna.</a><br/><br/>
  </div>
<body>

</body>
</html>