<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page isErrorPage="true" %>
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
            #information {
                position: fixed; top: 25%; width: 100%; color: #704214;
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
        <div align="center" id="header">
            Упс... Возникла какая-то ошибка...
        </div>
        <div align="center" id="information">
            <p><b>Описание ошибки:</b></p>
            <p style="color: red">${pageContext.errorData.throwable.message}</p>
        </div>
        <div align="center" id="footer">
            <a href="index.jsp">Вернуться на домашнюю страницу</a>
        </div>
    </body>
</html>