<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=500px, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/pokedex.css">
	<title>Pokedex</title>
</head>
<body>

<fmt:setBundle basename="Lang"/>
<fmt:setLocale value="${sessionScope.Lang}"/>

<div class="main-container">
	<%@include file="components/navigation_menu.jsp"%>
	<h1 class="page-name"><fmt:message key="title.pokedex"/></h1>
	<div class="pokedex">
		<div class="pokedex-row">
			<div class="pokedex-card">
				<div class="pokedex-card-inner">
					<div class="pokedex-card-front">
						<h1>Hello</h1>
					</div>
					<div class="pokedex-card-back">
						<h1>💩</h1>
					</div>
				</div>
			</div>
			<div class="pokedex-card">
				<div class="pokedex-card-inner">
					<div class="pokedex-card-front">
						<h1>World</h1>
					</div>
					<div class="pokedex-card-back">
						<h1>💩</h1>
					</div>
				</div>
			</div>
			<div class="pokedex-card">
				<div class="pokedex-card-inner">
					<div class="pokedex-card-front">
						<h1>!!!</h1>
					</div>
					<div class="pokedex-card-back">
						<h1>💩</h1>
					</div>
				</div>
			</div>
			<div class="pokedex-card">
				<div class="pokedex-card-inner">
					<div class="pokedex-card-front">
						<h1>🚀</h1>
					</div>
					<div class="pokedex-card-back">
						<h1>💩</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="script/pokedex.js"></script>
</html>