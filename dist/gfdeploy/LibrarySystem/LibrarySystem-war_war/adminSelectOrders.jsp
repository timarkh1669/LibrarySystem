<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Library System Web Application</title>
    </head>
    <body background="images/admin_bg.jpg" vlink="#0000ff">
        <%@page import="javax.naming.*, library_system.*" %>
        <%@ page import="java.util.List" %>
        <%@ page errorPage="error.jsp"%>
        <%
            InitialContext ic = new InitialContext();
            LibrarySessionRemote ejbRef = (LibrarySessionRemote)ic.lookup("library_system.LibrarySessionRemote");
            
            LibraryAdministrationRemote ejbRef_admin;
            ejbRef_admin = (LibraryAdministrationRemote)ic.lookup("library_system.LibraryAdministrationRemote");
            List<Orders> orders = ejbRef_admin.findAllOrders();
        %>
        <h1 align="center">Панель администратора</h1>
        <h2 align="center">Список заказов:</h2>
        <table BORDER="1" CELLPADDING="3" CELLSPACING="1" align="center">
            <tr>
                <td align="center" width="20%">Номер заказа</td>
                <td align="center" width="20%">id книги</td>
                <td align="center" width="20%">id пользователя</td>
                <td align="center" width="20%">имя пользователя</td>
            </tr>
            <%
                for (int i = 0; i < orders.size(); i++ ) {
            %>
                <tr>
                    <td align="center"><%=orders.get(i).getOrderid() %></td>
                    <td align="center"><%=orders.get(i).getBookid()%></td>
                    <td align="center"><%=orders.get(i).getUserid()%></td>
                    <td align="center"><%=ejbRef.findUserByID(orders.get(i).getUserid()).getUsername()%></td>
                </tr>
            <%
                }
            %>
        </table>
        <h4 align="center"><a href="adminIndex.jsp">На главную страницу администратора</a></h4>
        <h3 align="center"><a href="logoff.jsp">Выйти</a></h3>
    </body>
</html>

