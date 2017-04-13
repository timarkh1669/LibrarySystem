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
                /*alignment-adjust:  middle;*/
                position: fixed; top: 12%; width: 100%; color: #704214;
                font-size: 50px; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #greeting {
                position: fixed; top: 2%; width: 100%; color: #704214;
                font-size: 40px; font-weight: bold; font-family: 'Comic Sans MS';
            }
            #information {
                position: fixed; top: 45%; width: 100%; color: #704214;
                font-size: 25px; font-family: 'Comic Sans MS';
            }
            #footer {
                position: fixed; bottom: 3%; width: 100%; background: #e6d4c1;
                font-size: 50px; font-weight: bold; font-family: 'Comic Sans MS';
                opacity: 0.75;
            }
        </style>
    </head>
    <body background="images/index_bg.jpg" vlink="#0000ff">
        <%@ page errorPage="error.jsp"%>
        <%
        LibrarySessionRemote ejbRef;
        InitialContext ic = new InitialContext();
        ejbRef = (LibrarySessionRemote)ic.lookup("library_system.LibrarySessionRemote");
        
        String username = (String)session.getAttribute("username");
        if (username != null) {
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            ejbRef.returnBook(orderID);
        %>
            <div align="center" id="greeting">
                ������������, <%=username%>!
                <a href="logoff.jsp">�����</a>
            </div>
            <div align="center" id="header">
                ������� ����� � ���������� ��������
            </div>
        <% } else {
            //if username == null => user entered login, pass and orderID
            try {
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                username = request.getParameter("login");
                String userpass = request.getParameter("password");

                if (ejbRef.loginReader(username, userpass)) {
                    boolean returned = ejbRef.returnBook(orderID);
                    if (returned) { %>
                        <div align="center" id="header">������� ����� � ���������� ��������</div>
        <%          } else { %>
                        <div align="center" id="greeting">
                            ������
                        </div>
                        <div align="center" id="header">
                            �� ����� ������������ ����� ������
                        </div>
                        <div align="center" id="information">
                            <a href="returnBook.jsp">������ ������ �����</a>
                            <p><a href="loginReader.jsp?nextpage=returnBook">����� � �������</a></p>
                        </div>
        <%          }
                } else { %>
                    <div align="center" id="greeting">
                        ������
                    </div>
                    <div align="center" id="header">
                        <p>�� ����� ������������ ��� ������������ ��� ������</p>
                    </div>
                    <div align="center" id="information">
                        <p><a href="returnBook.jsp">������ ������ �����</a></p>
                        <p><a href="loginReader.jsp?nextpage=index">����� � �������</a></p>
                    </div>
        <%      }
            } catch (Exception e) { %>
                <div align="center" id="greeting">
                    ������
                </div>
                <div align="center" id="header">
                    <p>�� ����� ������������ ����� ������</p>
                </div>
                <div align="center" id="information">
                    <a href="returnBook.jsp">������ ������ �����</a>
                    <p><a href="loginReader.jsp?nextpage=returnBook">����� � �������</a></p>
                </div>
        <%  }
        } %>
        <div align="center" id="footer">
            <a href="index.jsp">�� ��������� ��������</a>
        </div>
    </body>
</html>