<%-- 
    Document   : newjsp
    Created on : Oct 15, 2023, 3:04:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="newjsp.jsp">
        <input type="text" name="name">
        <input type="submit" name="abc" value="chose">
        </form>
        <%=request.getParameter("name")%>   
    </body>
</html>
