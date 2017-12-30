<%-- 
    Document   : index
    Created on : Sep 11, 2017, 6:46:14 PM
    Author     : MAINHOST
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 <%@page import="javax.servlet.RequestDispatcher,java.io.IOException,java.sql.*,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,java.io.PrintWriter"%>       
        <%
            PrintWriter pp=response.getWriter();
            String valid="";
        String userid=request.getParameter("id");
        String psd=request.getParameter("pass");
        session.setAttribute("userid",userid);
        boolean sta=false;
        try{  
//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
//Connection con=DriverManager.getConnection("jdbc:odbc:DK");  
//Class.forName("oracle.jdbc.driver.OracleDriver");  
//Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","dk");     
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/proj","root",""); 
PreparedStatement ps=con.prepareStatement("select * from stu where ID=? and pass=?");  
ps.setString(1,userid);  
ps.setString(2,psd); 
      
ResultSet rs=ps.executeQuery();  
    sta=rs.next();  
}catch(Exception e){System.out.println(e);}  
        if(sta)
        {
            RequestDispatcher rd = request.getRequestDispatcher("new.jsp");
            rd.forward(request, response);
        }
        else
        {
            
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            rd.include(request, response);
            
            pp.println("<html>"+"<head>"+"<style>"+"h2{ color: red;margin-top: -200px;margin-left:900px;}"+"</style>"+"<body>"+"<center>"+"<h2>incorrect user id or pass!</h2>"+"</body>"+"</head>"+"</html>");   
        }
         %>
    </body>
</html>
