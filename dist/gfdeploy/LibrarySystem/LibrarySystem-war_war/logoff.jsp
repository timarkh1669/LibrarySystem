<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import="javax.naming.*, library_system.*" %>
<%@page import = "java.util.*" session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Library System Web Application</title>
    </head>
    <body background="images/index_bg.jpg">
        <%@ page errorPage="error.jsp"%>
        <%
            LibrarySessionRemote ejbRef;
            InitialContext ic = new InitialContext();
            session.setAttribute("username", null);
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
