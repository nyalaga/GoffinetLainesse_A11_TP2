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

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="main-container">
	<%@include file="components/navigation_menu.jsp"%>
	<h1 class="page-name"><fmt:message key="title.pokedex"/></h1>

	<div class="mt-2">
		<form action="Servlet_filters" method="get">
			<label class="fst-italic" for="partialName"><fmt:message key="search.name"/>  </label>
			<input class="m-1" type="text" id="partialName" name="partialName">
			<input class="btn btn-outline-dark btn-sm" type="submit" value="<fmt:message key="search"/>">
		</form>
	</div>

	<div class="mt-2">
		<form action="Servlet_filters" method="get">
			<label class="m-1 fst-italic" for="typeChoice"><fmt:message key="search.type"/>  </label>
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
		<form class="row" action="Servlet_filters" method="get">
			<label class="col-auto fst-italic" for="heightChoice"><fmt:message key="search.height"/>  </label>
			<input class="col-auto btn btn-dark btn-sm rounded-pill" type="button" value="-" onclick="subtract_one_m()">
			<input class="col-auto" type="range" id="heightChoice" name="heightChoice" min="0" max="15" oninput="this.nextElementSibling.value">
			<input readonly class="col-auto form-control-plaintext text-center width20" type="text"  id="minHeightValue" name="minHeightValue">
			<label class="col-auto align-self-center" for="minHeightValue">-</label>
			<input readonly class="col-auto form-control-plaintext text-center width20" type="text"  id="maxHeightValue" name="maxHeightValue">
			<label class="col-auto align-self-center" for="maxHeightValue"><fmt:message key="card.m"/> </label>
			<input class="col-auto btn btn-dark btn-sm rounded-pill" type="button" value="+" onclick="add_one_m()">
			<input class="col-auto ms-2 btn btn-outline-dark btn-sm" type="submit" value="<fmt:message key="search"/>">
		</form>
	</div>

	<div class="mt-2">
		<form class="row" action="Servlet_filters" method="get">
			<label class="col-auto fst-italic" for="weightChoice"><fmt:message key="search.weight"/>  </label>
			<input class="col-auto btn btn-dark btn-sm rounded-pill" type="button" value="-" onclick="subtract_one_kg()">
			<input class="col-auto" type="range" id="weightChoice" name="weightChoice" min="0" max="1400" oninput="this.nextElementSibling.value">
			<input readonly class="col-auto form-control-plaintext text-center width40" type="text"  id="minWeightValue" name="minWeightValue">
			<label class="col-auto align-self-center" for="minWeightValue">-</label>
			<input readonly class="col-auto form-control-plaintext text-center width40" type="text"  id="maxWeightValue" name="maxWeightValue">
			<label class="col-auto align-self-center" for="maxWeightValue"><fmt:message key="card.kg"/> </label>
			<input class="col-auto btn btn-dark btn-sm rounded-pill" type="button" value="+" onclick="add_one_kg()">
			<input class="col-auto ms-2 btn btn-outline-dark btn-sm" type="submit" value="<fmt:message key="search"/>">
		</form>
	</div>

	<div class="mt-5">
		<select class="m-1 btn btn-outline-dark" id="dataMan" name="dataMan" onchange="followLink()">
			<option selected disabled><fmt:message key="data.management"/></option>
			<option class="" value="addForm.jsp"><fmt:message key="data.add"/></option>
			<option class="" value="updateForm.jsp"><fmt:message key="data.update"/></option>
			<option class="" value="deleteForm.jsp"><fmt:message key="data.delete"/></option>
		</select>
	</div>

	<div class="checkoutZone">
		<a href="${pageContext.request.contextPath}/checkout.jsp" class="btn btn-outline-danger btn-menu btn-menu-disabled btn-checkout">Checkout Team</a>
	</div>

	<div>
		<%@include file="components/pokedex_card.jsp"%>
	</div>

</div>

<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="script/pokedex.js"></script>
</html>