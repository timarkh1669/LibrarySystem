<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import="javax.naming.*, library_system.*" %>
<%@page import = "java.util.*" session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Create New Book Application</title>
    </head>
    <body background="images/admin_bg.jpg" vlink="#0000ff">
        <%@ page errorPage="error.jsp"%>
        <%
            LibraryAdministrationRemote ejbRef;
            InitialContext ic = new InitialContext();
            ejbRef = (LibraryAdministrationRemote)ic.lookup("library_system.LibraryAdministrationRemote");
            String author = request.getParameter("author");
            String title = request.getParameter("title");
            String libraryId_s = request.getParameter("libraryId");
            if (ejbRef.checkAuthorSyntax(author)) { %>
                <h1 align="center">Ошибка в имени автора!</h1>
         <% } else if (ejbRef.checkTitleSyntax(title)) { %>
                <h1 align="center">Ошибка в названии книги!</h1>
         <% } else if (libraryId_s == null) { %>
                <h1 align="center">Вы не выбрали библиотеку!</h1>
         <% } else {
            try {
                int count = Integer.parseInt(request.getParameter("count"));
                int libraryId = Integer.parseInt(libraryId_s);
                ejbRef.createNewBooks(author, title, count, libraryId);
                response.sendRedirect("adminSelectBooks.jsp");
            }
            catch (Exception e) {
        %>
            <h1 align="center">Ошибка! Вы неправильно ввели количество книг</h1>
            <p>Сообщение об ошибке: <%=e.getMessage()%></p>
        <%  }
         } %>
        <h4 align="center"><a href="adminIndex.jsp">На главную страницу администратора</a></h4>
        <h3 align="center"><a href="logoff.jsp">Выйти</a></h3>
    </body>
</html>
