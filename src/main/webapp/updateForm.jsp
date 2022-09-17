<%@ page import="model.PkmType" %>
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
	<title>Update form</title>
</head>
<body>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="main-container">
	<%@include file="components/navigation_menu.jsp"%>
	<h1 class="page-name"><fmt:message key="data.update"/></h1>

	<form class="fst-italic" action="Servlet_pkmById" method="get">
		<div class="row border border-2 border-danger rounded m-2 p-3">
			<label class="col-auto" for="searchNatId"><fmt:message key="card.natID"/></label>
			<input class="col-auto" type="text" id="searchNatId" name="searchNatId" value="${pkm.nationalDex}"/>
			<input class="col-auto ms-2 btn btn-dark btn-sm" type="submit" value="<fmt:message key="search"/>">
		</div>
	</form>
	<form class="fst-italic" action="Servlet_updatePkm" method="get">
		<div class="row m-3 fst-normal fw-bold">
			<fmt:message key="data.updateSentence"/>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="updateNatId"><fmt:message key="card.natID"/></label>
			<span class="col-auto text-danger">*  </span>
			<input class="col-auto" type="text" id="updateNatId" name="updateNatId" value="${pkm.nationalDex}"/>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="updateRegId"><fmt:message key="card.regID"/></label>
			<input class="col-auto" type="text" id="updateRegId" name="updateRegId" value="${pkm.regionalDex}"/>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="updateName"><fmt:message key="card.name"/></label>
			<input class="col-auto" type="text" id="updateName" name="updateName" value="${pkm.name}"/>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="updateWeight"><fmt:message key="card.weight"/></label>
			<input class="col-2" type="text" id="updateWeight" name="updateWeight" value="${pkm.weight}"/>
			<span class="col-auto"><fmt:message key="card.kg"/></span>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="updateHeight"><fmt:message key="card.height"/></label>
			<input class="col-2" type="text" id="updateHeight" name="updateHeight" value="${pkm.height}"/>
			<span class="col-auto"><fmt:message key="card.m"/></span>
		</div>
		<div class="row m-1">
			<label class="col-auto" for="updateDesc"><fmt:message key="card.desc"/></label>
			<span class="col-auto"> (<fmt:message key="data.100char"/>)</span>
			<textarea class="col-auto" id="updateDesc" name="updateDesc" rows="3" cols="25">${pkm.description}</textarea>
		</div>

		<div class="row m-1">
			<label class="col-auto fst-italic" for="updateType1"><fmt:message key="types"/></label>
			<select class="col-auto btn btn-outline-dark me-1" id="updateType1" name="updateType1">
				<option class="NORMALColor" value="normal"
						<c:if test="${pkm.primaryType == PkmType.NORMAL}">selected</c:if>>
					<fmt:message key="type.normal"/>
				</option>
				<option class="FIREColor" value="fire"
						<c:if test="${pkm.primaryType == PkmType.NORMAL}">selected</c:if>>
					<fmt:message key="type.fire"/>
				</option>
				<option class="WATERColor" value="water"
						<c:if test="${pkm.primaryType == PkmType.WATER}">selected</c:if>>
					<fmt:message key="type.water"/>
				</option>
				<option class="GRASSColor" value="grass"
						<c:if test="${pkm.primaryType == PkmType.GRASS}">selected</c:if>>
					<fmt:message key="type.grass"/>
				</option>
				<option class="ELECTRICColor" value="electric"
						<c:if test="${pkm.primaryType == PkmType.ELECTRIC}">selected</c:if>>
					<fmt:message key="type.electric"/>
				</option>
				<option class="ICEColor" value="ice"
						<c:if test="${pkm.primaryType == PkmType.ICE}">selected</c:if>>
					<fmt:message key="type.ice"/>
				</option>
				<option class="FIGHTINGColor" value="fighting"
						<c:if test="${pkm.primaryType == PkmType.FIGHTING}">selected</c:if>>
					<fmt:message key="type.fighting"/>
				</option>
				<option class="POISONColor" value="poison"
						<c:if test="${pkm.primaryType == PkmType.POISON}">selected</c:if>>
					<fmt:message key="type.poison"/>
				</option>
				<option class="GROUNDColor" value="ground"
						<c:if test="${pkm.primaryType == PkmType.GROUND}">selected</c:if>>
					<fmt:message key="type.ground"/>
				</option>
				<option class="FLYINGColor" value="flying"
						<c:if test="${pkm.primaryType == PkmType.FLYING}">selected</c:if>>
					<fmt:message key="type.flying"/>
				</option>
				<option class="PSYCHICColor" value="psychic"
						<c:if test="${pkm.primaryType == PkmType.PSYCHIC}">selected</c:if>>
					<fmt:message key="type.psychic"/>
				</option>
				<option class="BUGColor" value="bug"
						<c:if test="${pkm.primaryType == PkmType.BUG}">selected</c:if>>
					<fmt:message key="type.bug"/>
				</option>
				<option class="ROCKColor" value="rock"
						<c:if test="${pkm.primaryType == PkmType.ROCK}">selected</c:if>>
					<fmt:message key="type.rock"/>
				</option>
				<option class="GHOSTColor" value="ghost"
						<c:if test="${pkm.primaryType == PkmType.GHOST}">selected</c:if>>
					<fmt:message key="type.ghost"/>
				</option>
				<option class="DARKColor" value="dark"
						<c:if test="${pkm.primaryType == PkmType.DARK}">selected</c:if>>
					<fmt:message key="type.dark"/>
				</option>
				<option class="DRAGONColor" value="dragon"
						<c:if test="${pkm.primaryType == PkmType.DRAGON}">selected</c:if>>
					<fmt:message key="type.dragon"/>
				</option>
				<option class="STEELColor" value="steel"
						<c:if test="${pkm.primaryType == PkmType.STEEL}">selected</c:if>>
					<fmt:message key="type.steel"/>
				</option>
				<option class="FAIRYColor" value="fairy"
						<c:if test="${pkm.primaryType == PkmType.NORMAL}">selected</c:if>>
					<fmt:message key="type.fairy"/>
				</option>
			</select>
			<select class="col-auto btn btn-outline-dark" id="updateType2" name="updateType2">
				<option <c:if test="${pkm.secondaryType == null}">selected</c:if>>
				</option>
				<option class="NORMALColor" value="normal"
						<c:if test="${pkm.secondaryType == PkmType.NORMAL}">selected</c:if>>
					<fmt:message key="type.normal"/>
				</option>
				<option class="FIREColor" value="fire"
						<c:if test="${pkm.secondaryType == PkmType.NORMAL}">selected</c:if>>
					<fmt:message key="type.fire"/>
				</option>
				<option class="WATERColor" value="water"
						<c:if test="${pkm.secondaryType == PkmType.WATER}">selected</c:if>>
					<fmt:message key="type.water"/>
				</option>
				<option class="GRASSColor" value="grass"
						<c:if test="${pkm.secondaryType == PkmType.GRASS}">selected</c:if>>
					<fmt:message key="type.grass"/>
				</option>
				<option class="ELECTRICColor" value="electric"
						<c:if test="${pkm.secondaryType == PkmType.ELECTRIC}">selected</c:if>>
					<fmt:message key="type.electric"/>
				</option>
				<option class="ICEColor" value="ice"
						<c:if test="${pkm.secondaryType == PkmType.ICE}">selected</c:if>>
					<fmt:message key="type.ice"/>
				</option>
				<option class="FIGHTINGColor" value="fighting"
						<c:if test="${pkm.secondaryType == PkmType.FIGHTING}">selected</c:if>>
					<fmt:message key="type.fighting"/>
				</option>
				<option class="POISONColor" value="poison"
						<c:if test="${pkm.secondaryType == PkmType.POISON}">selected</c:if>>
					<fmt:message key="type.poison"/>
				</option>
				<option class="GROUNDColor" value="ground"
						<c:if test="${pkm.secondaryType == PkmType.GROUND}">selected</c:if>>
					<fmt:message key="type.ground"/>
				</option>
				<option class="FLYINGColor" value="flying"
						<c:if test="${pkm.secondaryType == PkmType.FLYING}">selected</c:if>>
					<fmt:message key="type.flying"/>
				</option>
				<option class="PSYCHICColor" value="psychic"
						<c:if test="${pkm.secondaryType == PkmType.PSYCHIC}">selected</c:if>>
					<fmt:message key="type.psychic"/>
				</option>
				<option class="BUGColor" value="bug"
						<c:if test="${pkm.secondaryType == PkmType.BUG}">selected</c:if>>
					<fmt:message key="type.bug"/>
				</option>
				<option class="ROCKColor" value="rock"
						<c:if test="${pkm.secondaryType == PkmType.ROCK}">selected</c:if>>
					<fmt:message key="type.rock"/>
				</option>
				<option class="GHOSTColor" value="ghost"
						<c:if test="${pkm.secondaryType == PkmType.GHOST}">selected</c:if>>
					<fmt:message key="type.ghost"/>
				</option>
				<option class="DARKColor" value="dark"
						<c:if test="${pkm.secondaryType == PkmType.DARK}">selected</c:if>>
					<fmt:message key="type.dark"/>
				</option>
				<option class="DRAGONColor" value="dragon"
						<c:if test="${pkm.secondaryType == PkmType.DRAGON}">selected</c:if>>
					<fmt:message key="type.dragon"/>
				</option>
				<option class="STEELColor" value="steel"
						<c:if test="${pkm.secondaryType == PkmType.STEEL}">selected</c:if>>
					<fmt:message key="type.steel"/>
				</option>
				<option class="FAIRYColor" value="fairy"
						<c:if test="${pkm.secondaryType == PkmType.FAIRY}">selected</c:if>>
					<fmt:message key="type.fairy"/>
				</option>
			</select>
		</div>
		<div class="row m-4">
			<div class="text-danger">* <fmt:message key="data.required"/></div>
		</div>
		<div class="row m-4 justify-content-evenly">
			<input class="col-auto btn btn-dark btn-sm" type="submit" value="<fmt:message key="data.confirm"/>">
			<a class="col-auto btn btn-dark btn-sm" type="button" href="Servlet_pokedexList">
				<fmt:message key="data.cancel"/>
			</a>
		</div>
	</form>

</div>
</body>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>