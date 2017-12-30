<%-- 
    Document   : signup
    Created on : Sep 15, 2017, 3:51:33 PM
    Author     : MAINHOST
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            PrintWriter pw=response.getWriter();
        String eid=request.getParameter("eid");
        String fn=request.getParameter("fname");
        String ln=request.getParameter("lname");
        String psd=request.getParameter("password");
        String cpsd=request.getParameter("cpass");
        String email=request.getParameter("email");
         String mob=request.getParameter("mob");
        
        try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/proj","root",""); 
PreparedStatement ps=con.prepareStatement("insert into stu values(?,?,?,?,?,?)");  

ps.setString(1, eid);
ps.setString(2, fn);
ps.setString(3, ln);
ps.setString(4, psd);
ps.setString(5, email);
ps.setString(6, mob);
ps.executeUpdate();
ps.close();
//con.commit(); 

RequestDispatcher rd = request.getRequestDispatcher("index.html");
rd.include(request, response);
pw.println("<html><body onload=\"alert('You have sucessfully registered.')\"></body></html>");
}catch(Exception e){System.out.println(e);
RequestDispatcher rd = request.getRequestDispatcher("logsignup.html");
rd.include(request, response);
pw.println("<html><body onload=\"alert('You have already registered.')\"></body></html>");

}
        %>
    </body>
</html>
