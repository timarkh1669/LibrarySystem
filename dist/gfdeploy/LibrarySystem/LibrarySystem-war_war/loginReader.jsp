<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import = "java.util.*" session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Library System Web Application</title>
        <style>
            #header {
                position: fixed; top: 3%; width: 100%; color: #704214;
                font-size: 5vw; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #input {
                position: fixed; top: 20%; width: 100%; color: #704214;
                font-size: 2.5vw; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #register {
                position: fixed; top: 60%; width: 100%; color: #704214;
                font-size: 2.5vw; font-weight: bold; font-family: 'Comic Sans MS';
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
            String nextpage = request.getParameter("nextpage");
        %>
        <div align="center" id="header">
            Вход в систему
        </div>
        <div align="center" id="input">
            <form action="doLoginReader.jsp?nextpage=<%=nextpage%>" method="POST">
                <table align="center" BORDER="0" CELLPADDING="2" CELLSPACING="1">
                <tr>
                    <td>Логин: </td>
                    <td>
                        <input type="text" name="name" value="" style="background: #dbdbdb; font-size: 25px"/>
                    </td>
                </tr>
                <tr>
                    <td>Пароль: </td>
                    <td>
                        <input type="password" name="password" value="" style="background: #dbdbdb; font-size: 25px;"/>
                    </td>
                </tr>
                </table>
                <button type="submit">
                    <img src="images/login_button.jpg" width="100%" height="100%">
                </button>
            </form>
        </div>
        <% if (nextpage != null && nextpage.equals("orderBook")) { %>
            <div align = "center" id = "register">
                или <a href="registerReader.jsp?nextpage=orderBook">зарегистрироваться</a>
            </div>
        <%}%>
        <div align="center" id="footer">
            <a href="index.jsp">На домашнюю страницу</a>
        </div>
    </body>
</html>
