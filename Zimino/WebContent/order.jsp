 <%@page language = "java" contentType = "text/html; charset=ISO-8859-1"
  pageEncoding = "ISO-8859-1" %>
   <%@ page import = "java.sql.*" %>
   <% ResultSet resultset = null;%>
   
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset = "ISO-8859-1">
   <title> Order </title>
   <%--This uses the zimino_stylesheet.css--%>
   <link rel = "stylesheet" href = "zimino_stylesheet.css">
   </head>
   <body>
   
   <header>
   <%--This is the navigation bar.--%>

 <div class="topnav">
<nav>
<ul>
 <li><a href= "http://localhost:8080/Zimino/welcome.html">Welcome</a></li>
  <li><a href= "http://localhost:8080/Zimino/menu.html" >Menu</a></li>
   <!--The Reservations does not have a web page. It just links to opentable.com-->
      <li><a href = "https://www.opentable.com" > Reservations  </a></li>
  <li><a href="http://localhost:8080/Zimino/order.jsp">Order</a></li>
  <li><a href="http://localhost:8080/Zimino/updateOrder.jsp">Change Order</a></li>
  <li><a href="http://localhost:8080/Zimino/cancel.html">Cancel order</a></li>
  <li><a href="http://localhost:8080/Zimino/viewAllOrders.html">View all orders</a></li>
  <li><a href="http://localhost:8080/Zimino/Connect.html">Connect</a></li>
</ul>
</nav>
</div>
   </header>
   <br/>

   <%--This is places the logo at the center of the page.--%>
   <img src = "logo.gif" class = "centerpic">

   <%--This sets all content in center and LeftText div tags in
  the center of the website.--%>
   <div class = "center">
   <div class = "LeftText">

   <h1 style = "font-size:138%;" > Place Order </h1>
   <%--This is the place order table.The post uses Order.java.--%>
   <form action = "Order" method = "POST" >
   <%--This does not give the table an border outline.--%>
   <table border = "0">

   <%--This is the first name row of the table, that uses a text 
 input box for user's first name.The limited input for chars is 20.--%>

 <tr>
 <td> First name </td>
 <td align = "left">  <input type = "text" name = "first" size = "20"
  maxlength = "20">  </td>
   </tr>
 <tr>
 <td> Last name </td>
 <td align = "left" >  <input type = "text" name = "last" size = "20"
  maxlength = "20" >  </td>
   </tr>

   <%--This opens the data base and implements the sql statement.
  The sql select statement gets all the not null data in from the menu table 
 from the description_drink  column.--%>
   <%
  try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/zimino", "root", "Rainy22**");
    Statement s = conn.createStatement();
    ResultSet rs = s.executeQuery("select * from menu where description_drink IS NOT NULL");
     %>
     <tr>
     <tr>  <%--This displays all the retrieved data from the description_drink column in the menu table
    in a drop down list.--%>
     <td> Drink </td>  <td align = "left" >
       <select name = "drink" id = "drink" style = "width:177px" >
       <% while (rs.next()) {
         %>
         <option><%= rs.getString("description_drink") %></option>
         <%--This closes the database connection.--%>
         <%
      }
      rs.close();
     %>
     </select>  </td>  </tr>

     <%
  } catch (Exception e) {
    //This prints out the Exception e error.
    out.println(e);
  }
   %>

   <%
  try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/zimino", "root", "Rainy22**");
    Statement s = conn.createStatement();
    ResultSet rs = s.executeQuery("select * from menu where description_appetizers IS NOT NULL");
     %>
    
     <tr>
     <td> Appetizers </td>  <td align = "left" >
       <select name = "appetizers" id = "appetizers" style = "width:177px" >
       <% while (rs.next()) {
         %>
         <option><%= rs.getString("description_appetizers") %></option>
         <%
      }
      rs.close();
     %>
     </select></td>  </tr>

     <%
  } catch (Exception e) {
    out.println(e);
  }
   %>
   <%
  try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/zimino", "root", "Rainy22**");
    Statement s = conn.createStatement();
    ResultSet rs = s.executeQuery("select * from menu where description_main_course IS NOT NULL");
     %>
     
     <tr>
     <td> Main Course </td>  <td align = "left" >
       <select name = "main_course" id = "main_course" style = "width:177px" >
       <% while (rs.next()) {
         %>
         <option><%= rs.getString("description_main_course") %></option>
         <%
      }
      rs.close();
     %>
     </select>  </td>  </tr>

     <%
  } catch (Exception e) {
    out.println(e);
  }
   %>
   <%
  try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/zimino", "root", "Rainy22**");
    Statement s = conn.createStatement();
    ResultSet rs = s.executeQuery("select * from menu where description_dessert IS NOT NULL");
     %>
     
     <tr>
     <td> Dessert </td>  <td align = "left" >
       <select name = "dessert" id = "dessert" style = "width:177px;" >
       <% while (rs.next()) {
         %>
         <option><%= rs.getString("description_dessert") %></option>
         <%
      }
      rs.close();
     %>
     </select>  </td>  </tr>

     <%
  } catch (Exception e) {
    out.println(e);
  }
   %>

   <tr>
   <td> Tip </td>
   <td align = "left" >  <input type = "number" size = "25" name = "tip" maxlength = "10" >  </td>
   </tr>

   <tr>
   <td colspan = "2" align = "right" >  <input type = "submit"  value = "Submit" >  </td>
   </tr>

   </table>
   </form>

   </div>
   </div>
   <br/>  <br/>  <br/>  <br/>  <br/>  <br/>
   <%--This is the footer which includes a link for the photograph on some of the webpages for this
   factitious Zimino Restaurant database website.--%>
   <div id = "footer" >
   <p>
  Copyright © 2019 Zimino.All Rights Reserved for Shelly Sun, Andrew Bell, Jasper Kolp.
   <a href = "https://www.facebook.com/Antiche-Sere-Osteria-Enoteca-Bevagna-907749329293919/" >
  Photography credit: Antiche Sere Osteria Enoteca, Bevagna. </a>  <br/>  <br/>
 </div>
 </body>
</html>
