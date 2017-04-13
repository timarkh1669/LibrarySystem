<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import="javax.naming.*, library_system.*" %>
<%@page import = "java.util.*" session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Creating new library</title>
    </head>
    <body background="images/admin_bg.jpg" vlink="#0000ff">
        <h1 align="center">Панель администратора</h1>
        <h2 align="center">Добавление новой библиотеки</h1>
        <form action="adminDoCreateLibrary.jsp" method="POST">
            <p align="center" style="font-size: 20px">Адрес: <input type="text" name="address" value="" size="40"/></p>
            <p align="center"><input type="submit" value="Добавить" align="center"/></p>
        </form>
        <h4 align="center"><a href="adminIndex.jsp">На страницу администратора</a></h4>
        <h3 align="center"><a href="logoff.jsp">Выйти</a></h3>
    </body>
</html>
