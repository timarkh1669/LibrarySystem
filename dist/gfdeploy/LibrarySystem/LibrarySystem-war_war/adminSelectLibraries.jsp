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
            LibraryAdministrationRemote ejbRef;
            InitialContext ic = new InitialContext();

            ejbRef = (LibraryAdministrationRemote)ic.lookup("library_system.LibraryAdministrationRemote");
            List<Libraries> libraries = ejbRef.findAllLibraries();
        %>
        <h1 align="center">Панель администратора</h1>
        <h2 align="center">Список библиотек:</h2>
        <table BORDER="1" CELLPADDING="3" CELLSPACING="1" align="center">
            <tr>
                <td align="center" width="20%">Номер библиотеки</td>
                <td align="center" width="40%">Адрес</td>
                <td width="20%"></td>
            </tr>
            <%
                for (int i = 0; i < libraries.size(); i++ ) {
            %>
                <tr>
                    <td align="center"><%=libraries.get(i).getLibraryid()%></td>
                    <td align="center"><%=libraries.get(i).getAddress()%></td>
                    <td align="center">
                        <a href="adminDeleteLibrary.jsp?libraryID=<%=libraries.get(i).getLibraryid()%>">Удалить библиотеку</a>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
        <h4 align="center"><a href="adminCreateLibrary.jsp">Добавить новую библиотеку</a></h4>
        <h4 align="center"><a href="adminIndex.jsp">На главную страницу администратора</a></h4>
        <h3 align="center"><a href="logoff.jsp">Выйти</a></h3>
    </body>
</html>
