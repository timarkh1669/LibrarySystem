<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import="javax.naming.*, library_system.*" %>
<%@page import = "java.util.*" session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Creating new book record</title>
    </head>
    <body background="images/admin_bg.jpg" vlink="#0000ff">
        <h1 align="center">Панель администратора</h1>
        <%
            InitialContext ic = new InitialContext();
            LibraryAdministrationRemote ejbRef;
            ejbRef = (LibraryAdministrationRemote)ic.lookup("library_system.LibraryAdministrationRemote");
            List<Libraries> libraries = ejbRef.findAllLibraries();
            if (libraries.size() > 0) {
        %>
        <h2 align="center">Добавление книг в библиотеку</h2>
        <form action="adminDoCreateBooks.jsp" method="POST">
            <p align="center">Автор: <input type="text" name="author" value=""/></p>
            <p align="center">Название: <input type="text" name="title" value=""/></p>
            <p align="center">Количество: <input type="text" name="count" value="1"/></p>
            <p align="center">
                <select name="libraryId" size="1">
                <% for (int i = 0; i < libraries.size(); i++) { %>
                    <option value="<%=libraries.get(i).getLibraryid()%>"><%=libraries.get(i).getAddress()%></option>
                <% } %>
            </select></p>
            <p align="center"><input type="submit" value="Добавить" align="center"/></p>
        </form>
        <% } else {%>
        <h2 align="center">Необходимо <a href="adminCreateLibrary.jsp">добавить</a> хотя бы одну библиотеку</h2>
        <% } %>
        <h4 align="center"><a href="adminIndex.jsp">На главную страницу администратора</a></h4>
        <h3 align="center"><a href="logoff.jsp">Выйти</a></h3>
    </body>
</html>
