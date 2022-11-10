<%--
  Created by IntelliJ IDEA.
  User: hamidemir
  Date: 10/11/2022
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="erreur" class="java.lang.String" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title")%></title>
</head>
<body>


<div class="alert alert-danger" role="alert" style="margin-top: 10px">
    <% if(erreur.equals("note")){%>
    Erreur : La note que vous avez saisi doit être compris entre 0 et 20
    <% }%>
</div>


</body>
</html>
