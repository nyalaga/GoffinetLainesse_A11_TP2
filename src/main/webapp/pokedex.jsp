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

	<div>
		<form action="Servlet_filters" method="get">
			<label for="partialName">Find by name </label>
			<input type="text" id="partialName" name="partialName">
			<input class="btn btn-outline-dark btn-sm" type="submit" value="Search">
		</form>
	</div>

	<div>
		<form action="Servlet_filters" method="get">
			<label for="typeChoice">Search by type </label>
			<select class="btn btn-outline-dark" id="typeChoice" name="typeChoice" onchange="this.form.submit()">
				<option selected disabled>type</option>
				<option class="NORMALColor" value="normal">normal</option>
				<option class="FIREColor" value="fire">fire</option>
				<option class="WATERColor" value="water">water</option>
				<option class="GRASSColor" value="grass">grass</option>
				<option class="ELECTRICColor" value="electric">electric</option>
				<option class="ICEColor" value="ice">ice</option>
				<option class="FIGHTINGColor" value="fighting">fighting</option>
				<option class="POISONColor" value="poison">poison</option>
				<option class="GROUNDColor" value="ground">ground</option>
				<option class="FLYINGColor" value="flying">flying</option>
				<option class="PSYCHICColor" value="psychic">psychic</option>
				<option class="BUGColor" value="bug">bug</option>
				<option class="ROCKColor" value="rock">rock</option>
				<option class="GHOSTColor" value="ghost">ghost</option>
				<option class="DARKColor" value="dark">dark</option>
				<option class="DRAGONColor" value="dragon">dragon</option>
				<option class="STEELColor" value="steel">steel</option>
				<option class="FAIRYColor" value="fairy">fairy</option>
			</select>
		</form>
	</div>

	<div>
		<form action="Servlet_filters" method="get">
			<label for="heightChoice">Search by height </label>
			<input class="btn btn-dark btn-sm" type="button" value="-" onclick="subtract_one_m()">
			<input type="range" id="heightChoice" name="heightChoice" min="0" max="15" oninput="this.nextElementSibling.value">
			<span>
				<span id="heightValue"></span>
				<span> m </span>
			</span>
			<input class="btn btn-dark btn-sm" type="button" value="+" onclick="add_one_m()">
			<input class="btn btn-outline-dark btn-sm" type="submit" value="Search">
		</form>
	</div>

	<div>
		<form action="Servlet_filters" method="get">
			<label for="weightChoice">Search by weight </label>
			<input class="btn btn-dark btn-sm" type="button" value="-" onclick="subtract_one_kg()">
			<input type="range" id="weightChoice" name="weightChoice" min="0" max="1400" oninput="this.nextElementSibling.value">
			<span>
				<span id="weightValue"></span>
				<span> kg </span>
			</span>
			<input class="btn btn-dark btn-sm" type="button" value="+" onclick="add_one_kg()">
			<input class="btn btn-outline-dark btn-sm" type="submit" value="Search">
		</form>
	</div>

	<div>
		<%@include file="components/pokedex_card.jsp"%>
	</div>

</div>

<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="script/pokedex.js"></script>
</html>