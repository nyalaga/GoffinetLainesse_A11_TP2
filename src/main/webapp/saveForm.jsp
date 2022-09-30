<%@ page import="model.PkmType" %>
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
	<title>Save form</title>
</head>
<body>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="main-container">
	<%@include file="components/navigation_menu.jsp"%>
	<h1 class="page-name">
		<c:if test="${empty pkm}"><fmt:message key="data.add"/></c:if>
		<c:if test="${not empty pkm}"><fmt:message key="data.update"/></c:if>
	</h1>

	<form class="fst-italic" action="SavePkmServlet" method="get">
		<fieldset <c:if test="${not empty pkm0}">disabled="disabled"</c:if>>
			<div class="row m-3 fst-normal fw-bold">
				<c:if test="${empty pkm}"><fmt:message key="data.addSentence"/></c:if>
				<c:if test="${not empty pkm}"><fmt:message key="data.updateSentence"/></c:if>
			</div>
			<div class="row m-1">
				<label class="col-4" for="natId"><fmt:message key="card.natID"/></label>
				<input class="col-2" type="number" id="natId" name="natId" value="${pkm.nationalDex}"
					   required maxlength="4" min="1" max="905"/>
				<span class="col-1 text-danger">*</span>
			</div>
			<div class="row m-1">
				<label class="col-4" for="regId"><fmt:message key="card.regID"/></label>
				<input class="col-2" type="number" id="regId" name="regId" value="${pkm.regionalDex}"
					   required maxlength="4" min="1" max="100"/>
				<span class="col-1 text-danger">*</span>
			</div>
			<div class="row m-1">
				<label class="col-4" for="name"><fmt:message key="card.name"/></label>
				<input class="col-4" type="text" id="name" name="name" value="${pkm.name}"
					   required maxlength="25"/>
				<span class="col-1 text-danger">*</span>
			</div>
			<div class="row m-1">
				<label class="col-4" for="weight"><fmt:message key="card.weight"/></label>
				<input class="col-3" type="number" step="0.01" id="weight" name="weight" value="${pkm.weight}"
					   required maxlength="7" min="0" max="1400"/>
				<span class="col-1"><fmt:message key="card.kg"/></span>
				<span class="col-1 text-danger">*</span>
			</div>
			<div class="row m-1">
				<label class="col-4" for="height"><fmt:message key="card.height"/></label>
				<input class="col-2" type="number" step="0.01" id="height" name="height" value="${pkm.height}"
					   required maxlength="5" min="0" max="16"/>
				<span class="col-1"><fmt:message key="card.m"/></span>
				<span class="col-1 text-danger">*</span>
			</div>
			<div class="row m-1">
				<label class="col-4" for="desc"><fmt:message key="card.desc"/>
					<br>(<fmt:message key="data.100char"/>)</label>
				<textarea class="col-6" id="desc" name="desc" rows="3" cols="25" required maxlength="100">
					${pkm.description}
				</textarea>
				<span class="col-1 text-danger">*</span>
			</div>
			<div class="row m-1">
				<label class="col-4 fst-italic" for="type1"><fmt:message key="types"/></label>
				<select class="col-auto btn btn-outline-dark" id="type1" name="type1" required>
					<option></option>
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
							<c:if test="${pkm.primaryType == PkmType.FAIRY}">selected</c:if>>
						<fmt:message key="type.fairy"/>
					</option>
				</select>
				<span class="col-1 text-danger">*</span>
				<select class="col-auto btn btn-outline-dark" id="type2" name="type2">
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
				<a class="col-auto btn btn-dark btn-sm" type="button" href="PokedexListServletokedexList">
					<fmt:message key="data.cancel"/>
				</a>
			</div>
		</fieldset>
	</form>

	<c:if test="${not empty pkm0}">
		<div class="row m-3 fst-normal fw-bold">
			<fmt:message key="data.updateExist"/>
		</div>
		<div>
			<div class="pokedex">
				<div class="pokedex-row">
					<div class="pokedex-card">
						<div class="pokedex-card-inner text-white">
							<div class="pokedex-card-front">
								<div class="container">
									<div class="container-fluid mt-2">
										<div><img src="resources/img/pkm/${pkm0.nationalDex}.png" class="img-fluid"
												  alt="Image Pokemon ${pkm0.nationalDex}"></div>
									</div>
									<div class="h5" name="pkm-name">
											${pkm0.name}
									</div>
									<div>
										<span class="badge rounded-pill ${pkm0.primaryType}Color">${pkm0.primaryType}</span>
										<span class="badge rounded-pill ${pkm0.secondaryType}Color">${pkm0.secondaryType}</span>
									</div>
								</div>
							</div>
							<div class="pokedex-card-back">
								<div class="container p-2">
									<div class="h5 fw-bold text-dark" name="pkm-name">${pkm0.name}</div>
									<div class="h6 text-start">
										<div>
											<span><fmt:message key="card.natID"/> : </span>
											<span class="fw-bold text-dark">${pkm0.nationalDex}</span>
										</div>
										<div>
											<span><fmt:message key="card.regID"/> : </span>
											<span class="fw-bold text-dark">${pkm0.regionalDex}</span>
										</div>
										<div class="mt-2">
											<span><fmt:message key="card.weight"/> : </span>
											<span class="fw-bold text-dark">${pkm0.weight} <fmt:message key="card.kg"/></span>
										</div>
										<div>
											<span><fmt:message key="card.height"/> : </span>
											<span class="fw-bold text-dark">${pkm0.height} <fmt:message key="card.m"/></span>
										</div>
										<div class="mt-2">
											<span><fmt:message key="card.desc"/> : </span>
											<span class="fst-italic text-dark pkmDesc">${pkm0.description}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<form action="SavePkmServlet" method="get">
				<div class="row m-3 fst-normal fw-bold"><fmt:message key="data.updateConfirm"/> ?</div>
				<div class="row m-4 justify-content-evenly">
					<input type="hidden" name="confirm" value="y">
					<input type="hidden" name="natId" value="${pkm.nationalDex}">
					<input type="hidden" name="regId" value="${pkm.regionalDex}">
					<input type="hidden" name="name" value="${pkm.name}">
					<input type="hidden" name="weight" value="${pkm.weight}">
					<input type="hidden" name="height" value="${pkm.height}">
					<input type="hidden" name="desc" value="${pkm.description}">
					<input type="hidden" name="type1" value="${pkm.primaryType}">
					<input type="hidden" name="type2" value="${pkm.secondaryType}">
					<input class="col-auto btn btn-dark btn-sm" type="submit" value="<fmt:message key="data.yes"/>">
					<a class="col-auto btn btn-dark btn-sm" type="button" href="PokedexListServletokedexList">
						<fmt:message key="data.no"/>
					</a>
				</div>
			</form>
		</div>
	</c:if>
</div>
</body>
<footer>
</footer>
<script src="webjars/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="script/pokedex.js"></script>
</html>