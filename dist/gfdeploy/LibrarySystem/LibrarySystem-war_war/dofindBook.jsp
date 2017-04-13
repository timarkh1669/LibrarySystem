<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <title>Library System Web Application</title>
    </head>
    <%@page import="javax.naming.*, library_system.*" %>
    <%@ page errorPage="error.jsp"%>
    <%
        String checkMatch = "";
        if (request.getParameter("Match") != null) {
            checkMatch = "Match=" + request.getParameter("Match") + "&";
        }
        String author = "";
        if (request.getParameter("author") != null) {
            author = "author=" + request.getParameter("author") + "&";
        }
        String title = "";
        if (request.getParameter("title") != null) {
            title = "title=" + request.getParameter("title");
        }
        String res = checkMatch + author + title;
        if (res.charAt(res.length() - 1) == '&') {
            res = res.substring(0, res.length() - 1);
        }
    %>
    <frameset rows="*,90" frameborder="no">
        <frame src="frame_dofindBook.jsp?<%=res%>"/>
	<frame src="frame_toIndex.html"/>
    </frameset>
</html>

