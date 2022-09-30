<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=500px, initial-scale=1">
    <link rel="stylesheet" href="webjars/bootstrap/5.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <title>404</title>
</head>
<body class="main-container">

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<h1 class="p-2"><fmt:message key="error.pkm"/></h1>
<div class="row justify-content-md-center w-75">
    <img src="resources/img/missingno.jpg" alt="MISSINGNO">
</div>
<a class="btn-menu p-2 m-3 text-decoration-none fw-bold" href="PokedexListServlet"><fmt:message key="title.pokedex"/></a>
</body>
</html>
