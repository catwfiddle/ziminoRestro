package zimino;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ordered")
public class Ordered extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// database URL
	static final String DB_URL = "jdbc:mysql://localhost/zimino";

	// Database credentials
	static final String USER = "root";

	static final String PASS = "Rainy22**"; //put in your own database password

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// SQL statements
		String sql = "select o.ordered_id, concat(c.first, \" \", c.last) as name, o.drink, o.appetizers, o.main_course, o.dessert, o.tip from ordered o\r\n" + 
				"join customer c\r\n" + 
				"where o.customer_id = c.customer_id;";

		// Set response content type
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		// get input data from form
		//String name = request.getParameter("name");

		try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)   ) {
			// prepare select
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1,  name); 
			ResultSet rs = pstmt.executeQuery();

			// start html output
			out.println("<!DOCTYPE HTML><html><body>");
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset='ISO-8859-1'>");
			out.println("<title>View all orders</title>");
			out.println("<link rel='stylesheet' href='zimino_stylesheet.css'> ");
			out.println("</head>");
			out.println("<body>");
			out.println("<header>");
			out.println("");
			out.println("<div class='topnav'>");
			out.println("<nav>");
			out.println("<ul>");
out.println("<li><a href= 'http://localhost:8081/Zimino/welcome.html'>Welcome</a></li>");
out.println("<li><a href= 'http://localhost:8081/Zimino/menu.html' >Menu</a></li>");
out.println("<!--The Reservations does not have a web page. It just links to opentable.com-->");
out.println("<li><a href = 'https://www.opentable.com' > Reservations  </a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/order.jsp'>Order</a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/updateOrder.jsp'>Change Order</a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/cancel.html'>Cancel order</a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/ordered'>View all orders</a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/Connect.html'>Connect</a></li>");
			out.println("</ul>");
			out.println("</nav>");
			out.println("</div>");
			out.println("</header>");
			out.println("<br/>");
			out.println("<img src='logo.gif' class='centerpic'>");
			out.println("<br/>");
			out.println("<img src='food6.jpg' class='centerpic'>");
			out.println("</br>");
			out.println("<body>");
			
			// begin table and  column headings
			out.println("<div>");
			out.println("<table border=1 class='centerTable'>");
			out.println("<tr>");
			out.println("<th>Order number</th><th>Name</th>");
			out.println("<th>Drink</th><th>Appetizer</th>");
			out.println("<th>Main course</th><th>Dessert</th>");
			out.println("</tr>");
			
			// create row with data for each row from result set
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString("ordered_id") + "</td>");
				out.println("<td>" + rs.getString("name") + "</td>");
				out.println("<td>" + rs.getInt("drink") + "</td>");
				out.println("<td>" + rs.getInt("appetizers") + "</td>");
				out.println("<td>" + rs.getInt("main_course") + "</td>");
				out.println("<td>" + rs.getInt("dessert") + "</td>");
				out.println("</tr>");
			}
			rs.close();
			
			// end of table 
			out.println("</table>");
			out.println("</div>");

out.println("   <br/>  <br/>  <br/>  <br/>  <br/>  <br/>   "
+ "<div id = \"footer\" >\n" + 
"   <p>\n" + 
"  Copyright © 2019 Zimino. All Rights Reserved for Shelly Sun, Andrew Bell, Jasper Kolp.\n" + 
"   <a href = \"https://www.facebook.com/Antiche-Sere-Osteria-Enoteca-Bevagna-907749329293919/\" >\n" + 
"  Photography credit: Antiche Sere Osteria Enoteca, Bevagna. </a> <a href = \"https://github.com/catwfiddle/ziminoRestro\" >\r\n" + 
"  Our project on Github. </a> <br/>  <br/>");

			out.println("</body></html>");

			pstmt.close();
		} catch (SQLException e) {
			// Handle errors
			e.printStackTrace();
		}  
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// SQL statements
		String sql = "select o.ordered_id, concat(c.first, \" \", c.last) as name, o.drink, o.appetizers, o.main_course, o.dessert, o.tip from ordered o\r\n" + 
				"join customer c\r\n" + 
				"where o.ordered_id = c.customer_id;";

		// Set response content type
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		// get input data from form
		//String name = request.getParameter("name");

		try ( Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)   ) {
			// prepare select
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1,  name); 
			ResultSet rs = pstmt.executeQuery();

			// start html output
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset='ISO-8859-1'>");
			out.println("<title>View all orders</title>");
			out.println("<link rel='stylesheet' href='zimino_stylesheet.css'> ");
			out.println("</head>");
			out.println("<body>");
			out.println("<header>");
			out.println("");
			out.println("<div class='topnav'>");
			out.println("<nav>");
			out.println("<ul>");
out.println("<li><a href= 'http://localhost:8081/Zimino/welcome.html'>Welcome</a></li>");
out.println("<li><a href= 'http://localhost:8081/Zimino/menu.html' >Menu</a></li>");
out.println("<!--The Reservations does not have a web page. It just links to opentable.com-->");
out.println("<li><a href = 'https://www.opentable.com' > Reservations  </a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/order.jsp'>Order</a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/updateOrder.jsp'>Change Order</a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/cancel.jsp'>Cancel order</a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/ordered'>View all orders</a></li>");
out.println("<li><a href='http://localhost:8081/Zimino/Connect.html'>Connect</a></li>");
			out.println("</ul>");
			out.println("</nav>");
			out.println("</div>");
			out.println("</header>");
			out.println("<br/>");
			out.println("<img src='logo.gif' class='centerpic'>");
			out.println("<br/>\r\n" + 
			"<img src=\"food6.jpg\" class=\"centerpic2\">\r\n" + 
			"<br/><br/>");
			
			// begin table and  column headings
			out.println("<div>");
			out.println("<table border=1 class='centerTable'>");
			out.println("<tr>");
			out.println("<th>Order number</th><th>Name</th>");
			out.println("<th>Drink</th><th>Appetizer</th>");
			out.println("<th>Main course</th><th>Dessert</th>");
			out.println("</tr>");
			
			// create row with data for each row from result set
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString("ordered_id") + "</td>");
				out.println("<td>" + rs.getString("name") + "</td>");
				out.println("<td>" + rs.getString("drink") + "</td>");
				out.println("<td>" + rs.getString("appetizers") + "</td>");
				out.println("<td>" + rs.getString("main_course") + "</td>");
				out.println("<td>" + rs.getString("dessert") + "</td>");
				out.println("</tr>");
			}
			rs.close();
			
			// end of table 
			out.println("</table>");
			out.println("</div>");
out.println("   <br/>  <br/>  <br/>  <br/>  <br/>  <br/>   "
+ "<div id = \"footer\" >\n" + 
"   <p>\n" + 
"  Copyright © 2019 Zimino. All Rights Reserved for Shelly Sun, Andrew Bell, Jasper Kolp.\n" + 
"   <a href = \"https://www.facebook.com/Antiche-Sere-Osteria-Enoteca-Bevagna-907749329293919/\" >\n" + 
"  Photography credit: Antiche Sere Osteria Enoteca, Bevagna. </a> <a href = \"https://github.com/catwfiddle/ziminoRestro\" >\r\n" + 
"  Our project on Github. </a> <br/>  <br/>");
			out.println("</body></html>");

			pstmt.close();
		} catch (SQLException e) {
			// Handle errors
			e.printStackTrace();
		}  

	}
}
