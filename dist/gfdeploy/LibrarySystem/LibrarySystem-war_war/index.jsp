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
                position: fixed; top: 3%; width: 100%; color: #704214;
                font-size: 4vw; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #greeting {
                position: fixed; top: 20%; width: 100%; color: #704214;
                font-size: 40px; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #pic1of4 {
                position: fixed; left: 20%; top: 20%; width: 100%;
                opacity: 0.75;
            }
            #pic2of4 {
                position: fixed; left: 55%; top: 20%; width: 100%;
                opacity: 0.75;
            }
            #pic3of4 {
                position: fixed; left: 20%; top: 55%; width: 100%;
                opacity: 0.75;
            }
            #pic4of4 {
                position: fixed; left: 55%; top: 55%; width: 100%;
                opacity: 0.75;
            }
        </style>
    </head>
    <body background="images/index_bg.jpg" vlink="#0000ff">
        <%@ page errorPage="error.jsp"%>
        <%
            String username = (String)session.getAttribute("username");
        %>
        <div align="center" id="header">
            Добро пожаловать в электронную библиотеку
        </div>

        <%if (username != null) { %>
        <div align="center" id="greeting">
            Здравствуйте, <%=username%>!
            <a href="logoff.jsp">Выйти</a>
        </div>
        <%} else {%>                
            <div id="pic1of4">
                <a href="loginReader.jsp?nextpage=index">
                    <img src="images/login.jpg" width="27%" height="20%">
                </a>
            </div>
            <div id="pic2of4">
                <a href="registerReader.jsp">
                    <img src="images/registerReader.jpg" width="27%" height="20%">
                </a>
            </div>
        <%}%>
            <div id="pic3of4">
                <a href="findBook.jsp">
                    <img src="images/findBook.jpg" width="27%" height="20%">
                </a>
            </div>
            <div id="pic4of4">
                <a href="returnBook.jsp">
                    <img src="images/returnBook.jpg" width="27%" height="20%">
                </a>
            </div>
        <%
            if (username != null && username.equals("admin")) {
                response.sendRedirect("adminIndex.jsp");
            }
        %>
    </body>
</html>
