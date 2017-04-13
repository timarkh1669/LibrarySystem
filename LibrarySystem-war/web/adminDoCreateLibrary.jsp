<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import="javax.naming.*, library_system.*" %>
<%@page import = "java.util.*" session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Create New Library Application</title>
    </head>
    <body background="images/admin_bg.jpg" vlink="#0000ff">
        <%@ page errorPage="error.jsp"%>
        <%
            LibraryAdministrationRemote ejbRef;
            InitialContext ic = new InitialContext();
            ejbRef = (LibraryAdministrationRemote)ic.lookup("library_system.LibraryAdministrationRemote");
            String address = request.getParameter("address");
            if (ejbRef.checkLibrarySyntax(address)) {
         %>
            <h1 align="center">Ошибка в адресе!</h1>
         <%
            } else {
                int res = ejbRef.createNewLibrary(address);
                if (res != 0)
                    response.sendRedirect("adminSelectLibraries.jsp");
                else { %>
                    <h1 align="center">Ошибка! Такая библиотека уже существует</h1>
        <%      }
            } %>
        <h2 align="center"><a href="adminCreateLibrary.jsp">Попробовать еще раз</a></h2>
        <h4 align="center"><a href="adminIndex.jsp">На главную страницу администратора</a></h4>
        <h3 align="center"><a href="logoff.jsp">Выйти</a></h3>
    </body>
</html>
