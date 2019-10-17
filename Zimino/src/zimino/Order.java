package zimino;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// database URL
	static final String DB_URL = "jdbc:mysql://localhost/zimino";

	// Database credentials
	static final String USER = "root";

	static final String PASS = "Rainy22**";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Sql statements
//This selects the the customer's first and last name from the customer's table. This is used to
//display the customer's order after the customer inputs his/her information and selects the order.
String sql = "select  c.customer_id, c.first, c.last, o.drink, o.appetizers, o.main_course, o.dessert, o.tip\r\n" + 
"FROM customer c inner JOIN ordered o on c.customer_id = o.ordered_id";
//This inserts the customer's orders into the ordered table. The data for the food items are retrieved from the 
//menu table and the tip is retrieved from the customer's input.
	String isql = "INSERT ordered (drink, appetizers, main_course, dessert, tip) values (?, ?, ?, ?, ?) ";
//This inserts the customer's first and last name into the customer's table. 
String insql = "INSERT into customer (first, last) values (?,?)";		
		
		//Sets the response on the the content to html
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
//Opens up data base
		try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)) {

		//gets the input date from the form on the order.jsp
		String first = request.getParameter("first");
		String last = request.getParameter("last");
		String drink = request.getParameter("drink");
		String appetizers = request.getParameter("appetizers");
		String main_course = request.getParameter("main_course");
		String dessert = request.getParameter("dessert");


			// Get data from form and convert to double for the tip the user enters.
			double tipInput = Double.parseDouble (request.getParameter("tip"));


//These prepared statements are used for executing the sql query.
			PreparedStatement pstmt =  conn.prepareStatement(isql);
pstmt.setString (1, drink);
			pstmt.setString(2, appetizers);
			pstmt.setString(3, main_course);
			pstmt.setString(4, dessert);
pstmt.setDouble(5, tipInput);
pstmt.executeUpdate();

pstmt =  conn.prepareStatement(insql);
pstmt.setString(1, first);
			pstmt.setString(2, last);
pstmt.executeUpdate();
ResultSet rs = pstmt.executeQuery(sql); 


out.println("<!DOCTYPE HTML><html><body>");
out.println("<title>Menu</title>\r\n" + 
"<link rel=\"stylesheet\" href=\"zimino_stylesheet.css\"> \r\n" + 
"</head>\r\n" + 
"<body>\r\n" + 
"<header>\r\n" + 
"\r\n" + 
"<div class=\"topnav\">\r\n" + 
"<nav>\r\n" + 
"<ul>\r\n" + 
"  <li><a href= \"http://localhost:8080/Zimino/welcome.html\">Welcome</a></li>\r\n" + 
"  <li><a href= \"http://localhost:8080/Zimino/meun.html\" >Menu</a></li>\r\n" + 
"<!--The Reservations does not have a web page. It just links to oepntable.com-->\r\n" + 
"      <li><a href = \"https://www.opentable.com\" > Reservations  </a></li>"+
"  <li><a href=\"http://localhost:8080/Zimino/order.jsp\">Order</a></li>\r\n" + 
" <li><a href=\"http://localhost:8080/Zimino/updateOrder.jsp\">Change Order</a></li>"+
"<li><a href='http://localhost:8080/Zimino/cancel.jsp'>Cancel order</a></li>"+
"<li><a href='http://localhost:8080/Zimino/ordered'>View all orders</a></li>"+
"  <li><a href=\"\">Cancel order</a></li>\r\n" + 
"  <li><a href=\"\">View all orders</a></li>\r\n" + 
"  <li><a href=\"http://localhost:8080/Zimino/Connect.html\">Connect</a></li>\r\n" + 
"</ul>\r\n" + 
"</nav>\r\n" + 
"</div>\r\n" + 
"</header>\r\n" + 
"<br/>\r\n" + 
"<img src=\"logo.gif\" class=\"centerpic\">\r\n" + 
"<br/>\r\n" + 
"<img src=\"food3.png\" class=\"centerpic2\">\r\n" + 
"<br/><br/>"+ 
"<div class = \"center\">\r\n" + 
"<div class = \"LeftText\">"+
"<h1 style = \"font-size:100%;\" > Your order has been placed. Thank you! </h1>\r\n" + 
"<table border=1>\r\n" + 
"<tr>\r\n" + 
"<td>First Name</td><td>Last Name</td><td>Drink</td><td>Appetizer</td><td>Main course</td><td>Dessert</td>\r\n" + 
"</tr>");
//This table displays all the customer's name and all the customer's order.

while (rs.next()) {
out.println("<tr>");
out.println("<td>" + rs.getString("c.first") + "</td>");
out.println("<td>" + rs.getString("c.last") + "</td>");
out.println("<td>" + rs.getString("o.drink") + "</td>");
out.println("<td>" + rs.getString("o.appetizers") + "</td>");
out.println("<td>" + rs.getString("o.main_course") + "</td>");
out.println("<td>" + rs.getString("o.dessert") + "</td>");
out.println("</tr>");
}
rs.close();
out.println("</table>");

out.println("</div></div>\r\n" + 
"<br/>\r\n" + 
"<br/>\r\n" + 
"\r\n" + 
"<div id=\"footer\">\r\n" + 
"<p> Copyright © 2019 Zimino. All Rights Reserved for Shelly Sun, Andrew Bell, Jasper Kolp.\r\n" + 
" <a href = \"https://www.facebook.com/Antiche-Sere-Osteria-Enoteca-Bevagna-907749329293919/\">\r\n" + 
" Photography credit: Antiche Sere Osteria Enoteca, Bevagna.</a><br/><br/>\r\n" + 
"  </div>");
			out.println("</body></html>");
			
			
			

			pstmt.close();
			} catch (SQLException e) {
				// Handle errors
				e.printStackTrace();
			} 
	}
}