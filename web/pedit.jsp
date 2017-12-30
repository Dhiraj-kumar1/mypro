<%-- 
    Document   : edit
    Created on : 7 Oct, 2017, 7:48:06 PM
    Author     : dhiraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.RequestDispatcher,java.io.IOException,java.sql.*,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,java.io.PrintWriter"%> 
<%
        String i=request.getParameter("enid");
        String n=request.getParameter("fname");
        String ln=request.getParameter("lname");
        String e=request.getParameter("mail");
        String m=request.getParameter("ph");
        String idd=session.getAttribute("userid").toString();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            PrintWriter pw=response.getWriter();
            
        try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/proj","root",""); 
PreparedStatement ps=con.prepareStatement("update stu set fname=?,lname=?,email=?,mob=? where id=?");  

ps.setString(1, n);
ps.setString(2,ln);
ps.setString(3, e);
ps.setString(4, m);
ps.setString(5, idd);
ps.executeUpdate();

pw.println("<html><body onload=\"alert('Profile Updated Successfully!')\"></body></html>");
RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
rd.include(request, response);
        }
catch(Exception eee)
{
        
}
%>

    </body>
</html>
