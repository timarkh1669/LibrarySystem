<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import = "java.util.*" session="true"%>
<%@page import="javax.naming.*, library_system.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
		<title>Library System Web Application</title>
	</head>
	<body background="images/admin_bg.jpg" vlink="#0000ff">
            <%@ page errorPage="error.jsp"%>
            <h1 align="center">Панель администратора</h1>
            <h3 align="center"><a href="adminSelectUsers.jsp">Просмотреть список всех пользователей</a></h3>
            <h3 align="center"><a href="adminSelectBooks.jsp">Просмотреть список всех книг</a></h3>
            <h3 align="center"><a href="adminSelectLibraries.jsp">Просмотреть список всех библиотек</a></h3>
            <h3 align="center"><a href="adminCreateLibrary.jsp">Добавить новую библиотеку</a></h3>
            <h3 align="center"><a href="adminCreateBooks.jsp">Добавить новую книгу</a></h3>
            <h3 align="center"><a href="adminSelectOrders.jsp">Просмотреть список всех заказов</a></h3>
            <h3 align="center"><a href="logoff.jsp">Выйти</a></h3>
	</body>
</html>
