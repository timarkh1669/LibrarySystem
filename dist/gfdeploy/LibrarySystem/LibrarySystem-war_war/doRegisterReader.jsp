<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Library System Web Application</title>
        <style>
            #header {
                position: fixed; top: 2%; width: 100%; color: #704214;
                font-size: 50px; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #information {
                position: fixed; top: 25%; width: 100%; color: #704214;
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
        <%!
            LibrarySessionRemote ejbRef;
        %>
        <%
            InitialContext ic = new InitialContext();
            String username = request.getParameter("name");
            String userpass = request.getParameter("password");
            String nextpage = request.getParameter("nextpage");
            String nextpage_str = "";
            if (nextpage != null) {
                nextpage_str = "?nextpage="+nextpage;
            }
            
            ejbRef = (LibrarySessionRemote)ic.lookup("library_system.LibrarySessionRemote");
            int res = ejbRef.registerReader(username, userpass);
        %>
        <%if (res == 1) { 
            session.setAttribute("username", username);
            if (nextpage != null) {
                response.sendRedirect(nextpage+".jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else if (res == -1) { %>
        <div align="center" id="header">
            ������! ������������ ��� ������������: '<%=username%>'
        </div>
        <div align="center" id="information">
            <p>��� ������������ ����� ��������� ������ ����� � ��������� �����</p>
            <p>������������ �� ��� ���������������</p>
            <p><a href="registerReader.jsp<%=nextpage_str%>">���������������� �����</a></p>
        </div>
        <% } else if (res == -2) { %>
        <div align="center" id="header">
            ������! ������������ � ����� ������ ��� ����������: '<%=username%>'
        </div>
        <div align="center" id="information">
            ������������ �� ��� ���������������
            <p><a href="registerReader.jsp<%=nextpage_str%>">���������������� �����</a></p>
        </div>
        <% } else { %>
        <div align="center" id="header">
            ������! ��� ������������: '<%=username%>', ��� ������: <%=res%>
        </div>
        <div align="center" id="information">
            <p>������������ �� ��� ���������������</p>
            <p><a href="registerReader.jsp<%=nextpage_str%>">���������������� �����</a></p>
        </div>
        <% } %>
        <div align="center" id="footer">
            <a href="index.jsp">�� ��������� ��������</a>
        </div>
    </body>
</html>
