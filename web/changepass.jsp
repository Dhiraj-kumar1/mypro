<%-- 
    Document   : changepass
    Created on : 8 Oct, 2017, 9:11:32 PM
    Author     : dhiraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="new.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
    <center>
        <form action="chngepassedit.jsp" method="post">
            <table>
                <tr><td><input type="text" name="oldpass" placeholder="Enter Old Password*" required></td></tr>
            <tr><td><input name="newpass" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must have at least 6 characters' : ''); if(this.checkValidity()) form.cnewpass.pattern = this.value;" placeholder="Enter New Password*" required></td></tr>
            <tr><td><input name="cnewpass" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');" placeholder="Confirm New Password*" required></td></tr>
            <tr><td><input type="submit" name="b" value="Change"></tr></td>
        </form>
        </center>
    </body>
</html>
