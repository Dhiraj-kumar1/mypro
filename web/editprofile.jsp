<%-- 
    Document   : editprofile
    Created on : 7 Oct, 2017, 6:38:54 AM
    Author     : dhiraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="new.jsp"/>
<%@page import="javax.servlet.RequestDispatcher,java.io.IOException,java.sql.*,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,java.io.PrintWriter"%> 
<!DOCTYPE html>
<html>
    <head>
        <style>
            #viewfrmstyle{
                margin-top: 120px;
                background-color: #9f6b5a;
                width: 380px;
                border-radius: 12px;
            }
             .bd:hover
            {
                background-color: #cb0707;
            }
            .bd
            {
                
                background-color: #2a9623;
                border-color: #006600;
                color:white;
                border-radius: 12px;
                width: 85px;
                height: 42px;
            }
            </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{  
//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
//Connection con=DriverManager.getConnection("jdbc:odbc:DK");  
String id=session.getAttribute("userid").toString();
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/proj","root","");     
PreparedStatement ps=con.prepareStatement("select * from stu where ID=?");  
ps.setString(1,id); 
ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
            uid=rs.getString(1);
            fname=rs.getString(2);
            lname=rs.getString(3);
            email=rs.getString(5);
            mob=rs.getString(6);
    }
}catch(Exception e){System.out.println(e);}
            %>
        <center>
            <form id="viewfrmstyle" action="pedit.jsp" method="post">
            
            <table>
            <tr>
                <td>Enrollment Id</td><td><input type="text" name="enid" value="<%= uid %>" readonly></td>
            </tr>
            <tr>
                <td>First Name </td><td>   <input type="text" name="fname" value="<%= fname %>"></td>
            </tr>
            <tr>
                <td>Last Name </td><td>   <input type="text" name="lname" value="<%= lname %>"></td>
            </tr>
            <tr> 
                <td>Email   </td><td><input type="text" name="mail" value="<%= email %>"></td>
            </tr>
            <tr>
                <td>Mobile </td><td> <input type="text" name="ph" value="<%= mob %>"y></td>
            </tr>
            </table>
            <table>
            <tr>
                <td><input class="bd" type="submit" name="b" value="Update"></td>
            </tr>
            </table>
            
        </form>
        </center>
            <%!
                String uid;
                String fname;
                String lname;
                String email;
                String mob;
                %>
    </body>
</html>
