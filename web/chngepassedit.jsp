<%-- 
    Document   : chngepassedit
    Created on : 8 Oct, 2017, 9:31:01 PM
    Author     : dhiraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            PrintWriter pw=response.getWriter();
            String idd=session.getAttribute("userid").toString();
            String newpsd=request.getParameter("newpass");
            String upsd=request.getParameter("oldpass");
            String psd="";
            
                try{  
//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
//Connection con=DriverManager.getConnection("jdbc:odbc:DK");  
String id=session.getAttribute("userid").toString();
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/proj","root","");     
PreparedStatement ps=con.prepareStatement("select pass from stu where ID=?");  
ps.setString(1,idd); 
ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
            psd=rs.getString(1);
    }
}catch(Exception e){System.out.println(e);}
                if(!(upsd.equals(psd)))
                {
                    RequestDispatcher rd = request.getRequestDispatcher("changepass.jsp");
                    rd.include(request, response);
pw.println("<html><body onload=\"alert('Old Password does not match!')\"></body></html>");
                }
                else
                {
                            try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/proj","root",""); 
PreparedStatement ps=con.prepareStatement("update stu set pass=? where id=?");  

ps.setString(1,newpsd);
ps.setString(2, idd);
ps.executeUpdate();
pw.println("<html><body onload=\"alert('Password Updated Successfully!')\"></body></html>");
RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
rd.include(request, response);
        }
catch(Exception eee)
{
        
}
                }
            %>
    </body>
</html>
