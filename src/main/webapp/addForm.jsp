<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=500px, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/stats.css">
	<title>Add form</title>
</head>
<body>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="main-container">
	<%@include file="components/navigation_menu.jsp"%>
	<h1 class="page-name"><fmt:message key="data.add"/></h1>

	<form class="fst-italic" action="Servlet_addPkm" method="get">
		<div class="row mt-5 mb-3 ms-3">
				<fmt:message key="data.addSentence"/>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="addNatId"><fmt:message key="card.natID"/></label>
			<span class="col-auto text-danger">*  </span>
			<input class="col-auto" type="text" id="addNatId" name="addNatId"/>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="addRegId"><fmt:message key="card.regID"/></label>
			<span class="col-auto text-danger">*  </span>
			<input class="col-auto" type="text" id="addRegId" name="addRegId"/>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="addName"><fmt:message key="card.name"/></label>
			<span class="col-auto text-danger">*  </span>
			<input class="col-auto" type="text" id="addName" name="addName"/>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="addWeight"><fmt:message key="card.weight"/></label>
			<span class="col-auto text-danger">*  </span>
			<input class="col-auto" type="text" id="addWeight" name="addWeight"/>
			<span class="col-auto"><fmt:message key="card.kg"/></span>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="addHeight"><fmt:message key="card.height"/></label>
			<span class="col-auto text-danger">*  </span>
			<input class="col-auto" type="text" id="addHeight" name="addHeight"/>
			<span class="col-auto"><fmt:message key="card.m"/></span>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="addDesc"><fmt:message key="card.desc"/></label>
			<span class="col-auto"> (<fmt:message key="data.100char"/>)</span>
			<span class="col-auto text-danger">*  </span>
			<textarea class="col-auto" id="addDesc" name="addDesc" rows="3" cols="25"></textarea>
		</div>
		<div class="row m-1">
			<label class="col-auto fst-italic" for="addType1"><fmt:message key="types"/></label>
			<span class="col-auto text-danger">*  </span>
			<select class="col-auto btn btn-outline-dark" id="addType1" name="addType1">
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
			<select class="col-auto btn btn-outline-dark" id="addType2" name="addType2">
				<option value=""><fmt:message key="type"/></option>
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
		</div>
		<div class="row m-4">
			<div class="text-danger">* <fmt:message key="data.required"/></div>
		</div>
		<div class="row m-3 justify-content-between">
			<input class="col-auto btn btn-outline-dark btn-sm" type="submit" value="<fmt:message key="data.confirm"/>">
			<a class="col-auto btn btn-outline-dark btn-sm" type="button" href="Servlet_pokedexList"><fmt:message key="data.cancel"/></a>
		</div>
	</form>

</div>
</body>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>