<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=500px, initial-scale=1">
    <link rel="stylesheet" href="webjars/bootstrap/5.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/pokedex.css">
    <title>Pokemon result</title>
</head>
<body>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="main-container">
    <%@include file="components/navigation_menu.jsp"%>
    <h1 class="page-name"><fmt:message key="title.result"/></h1>
    <%@include file="components/pokedex_card.jsp"%>
</div>
<footer>
</footer>
<script src="webjars/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
<script src="script/pokedex.js"></script>
</html>
