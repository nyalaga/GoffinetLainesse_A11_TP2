<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=500px, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <title>Pokemon</title>
</head>
<body>

<fmt:setBundle basename="Lang"/>
<fmt:setLocale value="${sessionScope.Lang}"/>

<div class="main-container">
    <%@include file="components/navigation_menu.jsp"%>
    <h4 class="page-name p-3"><fmt:message key="welcome"/></h4>
</div>
<div class="main-container">
    <img src="resources/img/Pokemons.png" class="rounded-3 img-fluid" alt="Image d'accueil">
</div>
</body>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>