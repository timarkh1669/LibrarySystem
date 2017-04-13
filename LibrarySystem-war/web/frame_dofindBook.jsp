<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Library System Web Application</title>
        <style>
            h1 {
                color: #704214; font-size: 5vw; font-weight: bold; font-family: 'Comic Sans MS';
            }
            h3 {
                color: #704214; font-size: 4vw; font-weight: bold; font-family: 'Comic Sans MS';
            }
            p {
                color: #704214; font-size: 2.5vw; font-family: 'Comic Sans MS';
            }
        </style>
    </head>
    <body background="images/index_bg.jpg" vlink="#0000ff">
        <%@page import="javax.naming.*, library_system.*" %>
        <%@ page import="java.util.List" %>
        <%@ page errorPage="error.jsp"%>
        <%
            LibrarySessionRemote ejbRef;
            InitialContext ic = new InitialContext();

            ejbRef = (LibrarySessionRemote)ic.lookup("library_system.LibrarySessionRemote");

            String username = (String)session.getAttribute("username");
            if (username != null) {
        %>
        <h3 align="center">
            Здравствуйте, <%=username%>!
            <a href="logoff.jsp" target="_parent">Выйти</a>
        </h3>
        <%}%>
        <h1 align="center">
            Результаты поиска книг:
        </h1>
        <%
            String checkMatch = request.getParameter("Match");
            String searchmode;
            if (checkMatch != null && checkMatch.equals("FullMatch")) {
                searchmode = "точное совпадение параметров";
            } else {
                searchmode = "поиск подстрок";
            }
        %>
        <p align="center">
            По запросу: <%=searchmode%>:
             автор: '<font color="#ff0000"><%=request.getParameter("author")%></font>',
             название: '<font color="#ff0000"><%=request.getParameter("title")%></font>'
        </p>

        <table align="center" BORDER="1" CELLPADDING="2" CELLSPACING="1" bgcolor="#ffffff" style="color: #704214; font-size: 20px; font-family: 'Comic Sans MS'">
            <%
                List<Books> books;
                if (checkMatch != null && checkMatch.equals("FullMatch")) {
                    books = ejbRef.findBooksFullMatch(request.getParameter("author"), request.getParameter("title"));
                } else {
                    books = ejbRef.findBooks(request.getParameter("author"), request.getParameter("title"));
                }
            %>
            <tr>
                <td align="center" width="20%">Автор</td>
                <td align="center" width="20%">Название</td>
                <td align="center" width="15%">Количество</td>
                <td align="center" width="25%">Адрес</td>
                <td width="15%"></td>
            </tr>
            <%
                for (int i = 0; i < books.size(); i++ ) {
                    if (books.get(i).getCountfree() > 0) {
                        String address = ejbRef.findLibraryAddressByID(books.get(i).getLibraryid());
            %>
                <tr>
                    <td align="center"><%=books.get(i).getAuthor()%></td>
                    <td align="center"><%=books.get(i).getTitle()%></td>
                    <td align="center"><%=books.get(i).getCountfree()%></td>
                    <td align="center"><%=address%></td>
                    <td align="center">
                        <a href="orderBook.jsp?bookID=<%=books.get(i).getBookid()%>" target="_parent">Заказать!</a>
                    </td>
                </tr>

            <%
                    }
                }
            %>
        </table>
        <p align="center"><a href="findBook.jsp" target="_parent">Новый поиск</a></p>
    </body>
</html>

