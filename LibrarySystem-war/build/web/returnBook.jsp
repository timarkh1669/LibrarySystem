<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import = "java.util.*" session="true"%>
<%@page import="javax.naming.*, library_system.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Library System Web Application</title>
        <style>
            #header {
                position: fixed; top: 12%; width: 100%; color: #704214;
                font-size: 5vw; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #greeting {
                position: fixed; top: 2%; width: 100%; color: #704214;
                font-size: 4vw; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #information {
                position: fixed; top: 25%; width: 99%; color: #704214;
                font-size: 1.5vw; font-family: 'Comic Sans MS';
            }
            #footer {
                position: fixed; bottom: 3%; width: 100%; background: #e6d4c1;
                font-size: 5vw; font-weight: bold; font-family: 'Comic Sans MS';
                opacity: 0.75;
            }
        </style>
    </head>
    <body background="images/index_bg.jpg" vlink="#0000ff">
        <%
            InitialContext ic = new InitialContext();
            LibrarySessionRemote ejbRef = (LibrarySessionRemote)ic.lookup("library_system.LibrarySessionRemote");
            String username = (String)session.getAttribute("username");
            if (username != null) {
        %>
            <div align="center" id="greeting">
                Здравствуйте, <%=username%>!
                <a href="logoff.jsp">Выйти</a>
            </div>
            <div align="center" id="header">
                Возврат книги в библиотеку
            </div>
            <div align="center" id="information">
                Заказанные книги:
                <table BORDER="1" CELLPADDING="3" CELLSPACING="1" bgcolor="#ffffff">
                <%
                    List<Orders> orders = ejbRef.findOrderedBooks(username);
                %>
                <tr>
                    <td align="center" width="8%">№ заказа</td>
                    <td align="center" width="20%">Автор</td>
                    <td align="center" width="25%">Название</td>
                    <td align="center" width="25%">Адрес библиотеки</td>
                    <td width="8%"></td>
                </tr>
                <%
                    for (int i = 0; i < orders.size(); i++ )
                    {
                        int orderID = orders.get(i).getOrderid();
                %>
                    <tr>
                        <td align="center"><%=orderID%></td>
                        <td align="center"><%=ejbRef.findAuthorByOrderID(orderID)%></td>
                        <td align="center"><%=ejbRef.findTitleByOrderID(orderID)%></td>
                        <td align="center"><%=ejbRef.findLibraryAddressByOrderID(orderID)%></td>
                        <td align="center">
                            <a href="doreturnBook.jsp?orderID=<%=orderID%>">Вернуть!</a>
                        </td>
                    </tr>

                <%
                    }
                %>
            </table>
            </div>
        <%} else {%>
            <div align="center" id="greeting">
                Введите номер заказа, логин и пароль:
            </div>
            <div align="center" id="information">
            <form action="doreturnBook.jsp" method="POST">
                <table align="center" BORDER="0" CELLPADDING="2" CELLSPACING="1">
                <tr>
                    <td>Номер заказа: </td>
                    <td>
                        <input type="text" name="orderID" value="" style="background: #dbdbdb; font-size: 25px"/>
                    </td>
                </tr>
                <tr>
                    <td>Логин: </td>
                    <td>
                        <input type="text" name="login" value="" style="background: #dbdbdb; font-size: 25px"/>
                    </td>
                </tr>
                <tr>
                    <td>Пароль: </td>
                    <td>
                        <input type="text" name="password" value="" style="background: #dbdbdb; font-size: 25px"/>
                    </td>
                </tr>
                </table>
                <button type="submit">
                    <img src="images/return_button.jpg" width="100%" height="100%">
                </button>
            </form>
            <p>Или <a href="loginReader.jsp?nextpage=returnBook">авторизуйтесь</a> в системе</p>
            </div>
        <%}%>
        <div align="center" id="footer">
            <a href="index.jsp">На домашнюю страницу</a>
        </div>
    </body>
</html>