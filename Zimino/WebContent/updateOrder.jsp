 <%@page language = "java" contentType = "text/html; charset=ISO-8859-1"
  pageEncoding = "ISO-8859-1" %>
   <%@ page import = "java.sql.*" %>
   <% ResultSet resultset = null;%>
   
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset = "ISO-8859-1">
   <title> Update Order </title>
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
   <!--The Reservations does not have a web page. It just links to oepntable.com-->
      <li><a href = "https://www.opentable.com" > Reservations  </a></li>
  <li><a href="http://localhost:8080/Zimino/order.jsp">Order</a></li>
  <li><a href="http://localhost:8080/Zimino/updateOrder.jsp">Change Order</a></li>
  <li><a href="">Cancel order</a></li>
  <li><a href="">View all orders</a></li>
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

   <h1 style = "font-size:138%;" > Change your order </h1>
   <h1 style = "font-size:100%;" > Please enter your placed order and add your new order.  </h1>
   <%--This is the place order table.The post uses Order.java.--%>
   <form action = "updatedOrder" method = "post" >
 
   
  
   <%--This does not give the table an border outline.--%>
   <table border = "0">
    <tr>
     <tr>
     
   <td> First Name </td>
   <td align = "left" >  <input type = "first" size = "26"  name = "first"  placeholder = "Name used for placed order"maxlength = "20" >  </td>
   </tr>
   <td> Last name </td>
   <td align = "left" >  <input type = "last" size = "26"   name = "last"  placeholder = "Name used for placed order" maxlength = "20" >  </td>
   </tr>
   <td> Ordered Drink </td>
   <td align = "left" >  <input type = "drink" size = "26"  name = "drink" placeholder = "Placed drink order" maxlength = "30" >  </td>
   </tr>
   <td> Ordered appetizer </td>
   <td align = "left" >  <input type = "appetizers" size = "26" name = "appetizers" placeholder = "Placed appetizer" maxlength = "30" >  </td>
   </tr>
   <td> Ordered main course </td>
   <td align = "left" >  <input type = "main_course" size = "26" name = "main_course" placeholder = "Placed main course" maxlength = "30" >  </td>
   </tr>
   <td> Dessert </td>
   <td align = "left" >  <input type = "dessert" size = "26" name = "dessert"  placeholder = "Placed dessert" maxlength = "30" >  </td>
   </tr>
   <td> Tipped </td>
   <td align = "left" >  <input type = "tip" size = "26" name = "tipped" placeholder = "Amount tipped" maxlength = "10" >  </td>
   </tr>
   


   <%--This is the first name row of the table, where the user
can input their first name.The limited input for chars is 20.--%>

  <%
  try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/zimino", "root", "Rainy22**");
    Statement s = conn.createStatement();
    ResultSet rs = s.executeQuery("select * from customer where first IS NOT NULL");
     %> <tr>
     <tr>
       <%----%>
     <td> First name </td>  <td align = "left" >
       <select name = "New_first_name" id = "New_first_name" style = "width:177px" >
       <% while (rs.next()) {
         %>
         <option><%= rs.getString("first") %></option>
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
    ResultSet rs = s.executeQuery("select * from customer where last IS NOT NULL");
     %>
     <tr>
     <tr>  <%----%>
     <td> Last name </td>  <td align = "left" >
       <select name = "New_last_name" id = "New_last_name" style = "width:177px" >
       <% while (rs.next()) {
         %>
         <option><%= rs.getString("last") %></option>
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

   <%--This opens the data base and implements the sql statement.
  The sql select statement selects all data from the menu table
  where the value in the description_drink is not a null value.--%>
   <%
  try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/zimino", "root", "Rainy22**");
    Statement s = conn.createStatement();
    ResultSet rs = s.executeQuery("select * from menu where description_drink IS NOT NULL");
     %>
     <tr>
     <tr>  <%--This is the row for the Drink in the table.It displays
    all the retrieved data from the description_drink column in the menu table
    in a drop down list.This id correspondences to the desc_drink that is
    initialized in the Order.java.--%>
     <td> Update Drink </td>  <td align = "left" >
       <select name = "New_drink" id = "New_drink" style = "width:177px" >
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
     <tr>
     <td> Update Appetizer </td>  <td align = "left" >
       <select name = "New_appetizers" id = "New_appetizers" style = "width:177px" >
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
     <tr>
     <td> Update Main Course </td>  <td align = "left" >
       <select name = "New_main_course" id = "New_main_course" style = "width:177px" >
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
     <tr>
     <td> Update Dessert </td>  <td align = "left" >
       <select name = "New_dessert" id = "New_dessert" style = "width:177px;" >
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
   <td align = "left" >  <input type = "number" size = "26" name = "New_tip" maxlength = "10" >  </td>
   </tr>

   <tr>
   <td colspan = "2" align = "right" >  <input type = "submit"  value = "Submit" >  </td>
   </tr>

   </table>
   </form>

   </div>
   </div>
   <br/>  <br/>  <br/>  <br/>  <br/>  <br/>
   <%--This is the footer.--%>
   <div id = "footer" >
   <p>
  Copyright © 2019 Zimino.All Rights Reserved for Shelly Sun, Andrew Bell, Jasper Kolp.
   <a href = "https://www.facebook.com/Antiche-Sere-Osteria-Enoteca-Bevagna-907749329293919/" >
  Photography credit: Antiche Sere Osteria Enoteca, Bevagna. </a>  <br/>  <br/>
 </div>
 </body>
</html>
