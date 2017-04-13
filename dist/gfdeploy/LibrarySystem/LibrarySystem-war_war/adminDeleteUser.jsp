<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import="javax.naming.*, library_system.*" %>
<%@page import = "java.util.*" session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head/>
    <body background="images/admin_bg.jpg" vlink="#0000ff">
        <%@ page errorPage="error.jsp"%>
        <%
            InitialContext ic = new InitialContext();
            LibraryAdministrationRemote ejbRef;
            ejbRef = (LibraryAdministrationRemote)ic.lookup("library_system.LibraryAdministrationRemote");
            int userID = Integer.parseInt(request.getParameter("userID"));
            ejbRef.deleteUser(userID);

            response.sendRedirect("adminSelectUsers.jsp");
        %>
    </body>
</html>