<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@page import="javax.naming.*, library_system.*" %>
<%@page import = "java.util.*" session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Library System Web Application</title>
        <style>
            #header {
                position: fixed; top: 12%; width: 100%; color: #704214;
                font-size: 3.5vw; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #information {
                position: fixed; top: 60%; width: 100%; color: #704214;
                font-size: 2.5vw; font-family: 'Comic Sans MS';
            }
            #footer {
                position: fixed; bottom: 3%; width: 100%; background: #e6d4c1;
                font-size: 5vw; font-weight: bold; font-family: 'Comic Sans MS';
                opacity: 0.75;
            }
        </style>
    </head>
    <body background="images/index_bg.jpg" vlink="#0000ff">
        <%@ page errorPage="error.jsp"%>
        <%!
            LibrarySessionRemote ejbRef;
        %>
        <%
            InitialContext ic = new InitialContext();
            String username = request.getParameter("name");
            String userpass = request.getParameter("password");
            String nextpage = request.getParameter("nextpage");

            ejbRef = (LibrarySessionRemote)ic.lookup("library_system.LibrarySessionRemote");
            boolean registered = ejbRef.loginReader(username, userpass);
            
            if (registered == true) {
                session.setAttribute("username", username);
                if (username.equals("admin")) {
                    response.sendRedirect("adminIndex.jsp");
                } else {
                    response.sendRedirect(nextpage+".jsp");
                }
            } else {
        %>
        <div align="center" id="header">
            Ошибка
            <p>Вы ввели неправильное имя пользователя или пароль</p>
        </div>
        <div align="center" id="information">
            <a href="loginReader.jsp?nextpage=<%=nextpage%>">Попробовать снова</a>
        </div>
        <% } %>
        <div align="center" id="footer">
            <a href="index.jsp">На начальную страницу</a>
        </div>
    </body>
</html>