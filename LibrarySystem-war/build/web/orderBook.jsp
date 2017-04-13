<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Library System Web Application</title>
        <style>
            #header {
                position: fixed; top: 12%; width: 100%; color: #704214;
                font-size: 50px; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #greeting {
                position: fixed; top: 2%; width: 100%; color: #704214;
                font-size: 40px; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #information {
                position: fixed; top: 45%; width: 100%; color: #704214;
                font-size: 35px; font-family: 'Comic Sans MS';
            }
            #footer {
                position: fixed; bottom: 3%; width: 100%; background: #e6d4c1;
                font-size: 50px; font-weight: bold; font-family: 'Comic Sans MS';
                opacity: 0.75;
            }
        </style>
    </head>
    <body background="images/index_bg.jpg" vlink="#0000ff">
        <%@page import="javax.naming.*, library_system.*" %>
        <%@ page errorPage="error.jsp"%>
        <%
            LibrarySessionRemote ejbRef;
            InitialContext ic = new InitialContext();
            String bookID_str = request.getParameter("bookID");
            int bookID = 0;
            if (bookID_str != null) {
                bookID = Integer.parseInt(bookID_str);
            }
            if (bookID == 0) {
                bookID = (Integer)session.getAttribute("bookID");
            }
            String username = (String)session.getAttribute("username");

            if (username == null) {
                session.setAttribute("bookID", bookID);
                response.sendRedirect("loginReader.jsp?nextpage=orderBook");
            } else {
                ejbRef = (LibrarySessionRemote)ic.lookup("library_system.LibrarySessionRemote");
                int orderID = ejbRef.orderBook(username, bookID);
        %>
                <div align="center" id="greeting">
                    Здравствуйте, <%=username%>!
                    <a href="logoff.jsp">Выйти</a>
                </div>
        <%      if (orderID != 0) { %>
                <div align="center" id="header">
                    <p>Книга заказана!</p>
                    <p>Номер Вашего заказа: <%=orderID%></p>
                </div>
        <%      } else { %>
                <div align="center" id="header">
                    <p>Ой, возникла какая-то странная ошибка..</p>
                    <p>Книга не была заказана</p>
                </div>
                <div align="center" id="information">
                    <a href="findBook.jsp">Искать новую книгу</a>
                </div>
        <%
                }
            }
        %>
        <div align="center" id="footer">
            <a href="index.jsp">На начальную страницу</a>
        </div>
    </body>
</html>
