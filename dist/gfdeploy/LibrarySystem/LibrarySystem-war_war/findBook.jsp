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
                /*alignment-adjust:  middle;*/
                position: fixed; top: 12%; width: 100%; color: #704214;
                font-size: 50px; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #greeting {
                position: fixed; top: 2%; width: 100%; color: #704214;
                font-size: 40px; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #input {
                position: fixed; top: 25%; width: 100%; color: #704214;
                font-size: 25px; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #footer {
                position: fixed; bottom: 3%; width: 100%; background: #e6d4c1;
                font-size: 50px; font-weight: bold; font-family: 'Comic Sans MS';
                opacity: 0.75;
            }
        </style>
    </head>
    <body background="images/index_bg.jpg" vlink="#0000ff">
        <%
            String username = (String)session.getAttribute("username");
            if (username != null) {
        %>
            <div align="center" id="greeting">
                Здравствуйте, <%=username%>!
                <a href="logoff.jsp">Выйти</a>
            </div>
        <%}%>
        <div align="center" id="header">
            Поиск книги по названию и автору
        </div>
        <div align="center" id="input">
            <form action="dofindBook.jsp" method="POST">
                <table align="center" BORDER="0" CELLPADDING="2" CELLSPACING="1">
                <tr>
                    <td>Автор: </td>
                    <td>
                        <input type="text" name="author" value="" style="background: #dbdbdb; font-size: 25px"/>
                    </td>
                </tr>
                <tr>
                    <td>Название: </td>
                    <td>
                        <input type="text" name="title" value="" style="background: #dbdbdb; font-size: 25px"/>
                    </td>
                </tr>
                </table>
                <p><input type="checkbox" name="Match" value="FullMatch" style="transform: scale(2);"/> Искать по точному совпадению</p>
                <button type="submit">
                    <img src="images/find_button.jpg" width="100%" height="100%">
                </button>
            </form>
        </div>
        <div align="center" id="footer">
            <a href="index.jsp">На начальную страницу</a>
        </div>
    </body>
</html>