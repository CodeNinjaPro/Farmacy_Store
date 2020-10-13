<%-- 
    Document   : logout
    Created on : Oct 13, 2020, 4:08:51 PM
    Author     : Roshan Withanage
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
    session.invalidate();
    response.sendRedirect("index.jsp");
    %>
</html>
