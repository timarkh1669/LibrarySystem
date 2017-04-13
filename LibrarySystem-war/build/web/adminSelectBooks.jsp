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
            LibrarySessionRemote ejbRef;
            InitialContext ic = new InitialContext();

            ejbRef = (LibrarySessionRemote)ic.lookup("library_system.LibrarySessionRemote");
            List<Books> books = ejbRef.findBooks("", "");
        %>
        <h1 align="center">Панель администратора</h1>
        <h2 align="center">Список книг:</h2>
        <table BORDER="1" CELLPADDING="3" CELLSPACING="1" align="center">
            <tr>
                <td align="center" width="20%">Автор</td>
                <td align="center" width="20%">Название</td>
                <td align="center" width="25%">Адрес библиотеки</td>
                <td align="center" width="15%">Свободных экземпляров</td>
                <td width="15%"></td>
            </tr>
            <%
                for (int i = 0; i < books.size(); i++ ) {
                    String address = ejbRef.findLibraryAddressByID(books.get(i).getLibraryid());
            %>
                <tr>
                    <td align="center"><%=books.get(i).getAuthor()%></td>
                    <td align="center"><%=books.get(i).getTitle()%></td>
                    <td align="center"><%=address%></td>
                    <td align="center"><%=books.get(i).getCountfree()%></td>
                    <td align="center">
                        <a href="adminDeleteBook.jsp?bookID=<%=books.get(i).getBookid()%>">Удалить книгу</a>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
        <h4 align="center"><a href="adminCreateBooks.jsp">Добавить новую книгу</a></h4>
        <h4 align="center"><a href="adminIndex.jsp">На главную страницу администратора</a></h4>
        <h3 align="center"><a href="logoff.jsp">Выйти</a></h3>
    </body>
</html>

