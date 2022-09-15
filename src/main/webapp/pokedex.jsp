<%@ page contentType="text/html;charset=UTF-8"%>
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


	<div class="mt-2">
		<form action="Servlet_filters" method="get">
			<label class="fst-italic" for="partialName"><fmt:message key="search.name"/>  </label>
			<input type="text" id="partialName" name="partialName">
			<input class="btn btn-outline-dark btn-sm" type="submit" value="<fmt:message key="search"/>">
		</form>
	</div>

	<div class="mt-2">
		<form action="Servlet_filters" method="get">
			<label class="fst-italic" for="typeChoice"><fmt:message key="search.type"/>  </label>
			<select class="btn btn-outline-dark" id="typeChoice" name="typeChoice" onchange="this.form.submit()">
				<option selected disabled><fmt:message key="type"/></option>
				<option class="NORMALColor" value="normal"><fmt:message key="type.normal"/></option>
				<option class="FIREColor" value="fire"><fmt:message key="type.fire"/></option>
				<option class="WATERColor" value="water"><fmt:message key="type.water"/></option>
				<option class="GRASSColor" value="grass"><fmt:message key="type.grass"/></option>
				<option class="ELECTRICColor" value="electric"><fmt:message key="type.electric"/></option>
				<option class="ICEColor" value="ice"><fmt:message key="type.ice"/></option>
				<option class="FIGHTINGColor" value="fighting"><fmt:message key="type.fighting"/></option>
				<option class="POISONColor" value="poison"><fmt:message key="type.poison"/></option>
				<option class="GROUNDColor" value="ground"><fmt:message key="type.ground"/></option>
				<option class="FLYINGColor" value="flying"><fmt:message key="type.flying"/></option>
				<option class="PSYCHICColor" value="psychic"><fmt:message key="type.psychic"/></option>
				<option class="BUGColor" value="bug"><fmt:message key="type.bug"/></option>
				<option class="ROCKColor" value="rock"><fmt:message key="type.rock"/></option>
				<option class="GHOSTColor" value="ghost"><fmt:message key="type.ghost"/></option>
				<option class="DARKColor" value="dark"><fmt:message key="type.dark"/></option>
				<option class="DRAGONColor" value="dragon"><fmt:message key="type.dragon"/></option>
				<option class="STEELColor" value="steel"><fmt:message key="type.steel"/></option>
				<option class="FAIRYColor" value="fairy"><fmt:message key="type.fairy"/></option>
			</select>
		</form>
	</div>

	<div class="mt-2">
		<form action="Servlet_filters" method="get">
			<label class="fst-italic" for="heightChoice"><fmt:message key="search.height"/>  </label>
			<input class="btn btn-dark btn-sm rounded-pill" type="button" value="-" onclick="subtract_one_m()">
			<input type="range" id="heightChoice" name="heightChoice" min="0" max="15" oninput="this.nextElementSibling.value">
			<span>
				<span id="heightValue"></span>
				<span> m </span>
			</span>
			<input class="btn btn-dark btn-sm rounded-pill" type="button" value="+" onclick="add_one_m()">
			<input class="btn btn-outline-dark btn-sm" type="submit" value="<fmt:message key="search"/>">
		</form>
	</div>

	<div class="mt-2">
		<form action="Servlet_filters" method="get">
			<label class="fst-italic" for="weightChoice"><fmt:message key="search.weight"/>  </label>
			<input class="btn btn-dark btn-sm rounded-pill" type="button" value="-" onclick="subtract_one_kg()">
			<input type="range" id="weightChoice" name="weightChoice" min="0" max="1400" oninput="this.nextElementSibling.value">
			<span>
				<span id="weightValue"></span>
				<span> kg </span>
			</span>
			<input class="btn btn-dark btn-sm rounded-pill" type="button" value="+" onclick="add_one_kg()">
			<input class="btn btn-outline-dark btn-sm" type="submit" value="<fmt:message key="search"/>">
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