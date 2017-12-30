<%-- 
    Document   : new
    Created on : Sep 11, 2017, 7:02:18 PM
    Author     : MAINHOST
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="javax.servlet.RequestDispatcher,java.io.IOException,java.sql.*,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,java.io.PrintWriter"%> 
 <!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WELCOME</title>
        <link rel="stylesheet" href="menustyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    
    <body>
        
        <header>
        <h1><center>Student portal</center></h1>
    <%!
       String username;
       %>
       <%
            try{  
//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
//Connection con=DriverManager.getConnection("jdbc:odbc:DK");  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/proj","root","");     
PreparedStatement ps=con.prepareStatement("select fname from stu where ID=?");  
String idd=session.getAttribute("userid").toString();
ps.setString(1,idd);
      PrintWriter oo=response.getWriter();
ResultSet rs=ps.executeQuery();  
    while(rs.next())
    {
             username=rs.getString(1);
    }
    
}catch(Exception e){System.out.println(e);}
            
       %>
   <div id="menu">
       <ul>
           <li><a href="home.jsp" >Home</a></li>
           
           <li><a href="#">Tutorial<i class="fa fa-chevron-down"style="margin-left: 10px;"></i></a>
                <ul>
                    <li><a href="bca.jsp">BCA</a>
                        
                    </li> 
                    <li><a href="mca.jsp">MCA</a>
                        
                    </li> 
                </ul>
           </li> 
           
       </ul>
</div>
        
        <div class="menubkcolor" id="logmenu">
            <ul>   
                <li><a href="#">Welcome <%= username.toUpperCase() %><i class="fa fa-chevron-down"style="margin-left: 1px;"></i></a>
                    <ul>
                            <li><a href="viewprofile.jsp" >View Profile</a></li>
                            <li><a href="editprofile.jsp" >Edit Profile</a></li>
                            <li><a href="changepass.jsp">Change Password</a></li>
                            <li><a href="index.html" >Log Out</a></li>
                    </ul>
                </li>
            </ul> 
        </div>
        </header>  
       </body>
</html>
