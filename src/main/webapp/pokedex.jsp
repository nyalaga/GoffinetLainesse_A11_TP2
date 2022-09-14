<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<label for="partialName">Find by name :</label>
			<input type="text" id="partialName" name="partialName">
			<input type="submit" value="Search">
		</form>
	</div>

	<div>
		<form action="Servlet_filters" method="get">
			<label for="typeChoice">Search by type :</label>
			<select id="typeChoice" name="typeChoice" onchange="this.form.submit()">
				<option selected disabled>type</option>
				<option value="normal">normal</option>
				<option value="fire">fire</option>
				<option value="water">water</option>
				<option value="grass">grass</option>
				<option value="electric">electric</option>
				<option value="ice">ice</option>
				<option value="fighting">fighting</option>
				<option value="poison">poison</option>
				<option value="ground">ground</option>
				<option value="flying">flying</option>
				<option value="psychic">psychic</option>
				<option value="bug">bug</option>
				<option value="rock">rock</option>
				<option value="ghost">ghost</option>
				<option value="dark">dark</option>
				<option value="dragon">dragon</option>
				<option value="steel">steel</option>
				<option value="fairy">fairy</option>
			</select>
		</form>
	</div>

	<div>
		<form action="Servlet_filters" method="get">
			<label for="heightChoice">Search by height :</label>
			<input type="button" value="-" onclick="subtract_one_m()">
			<input type="range" id="heightChoice" name="heightChoice" min="0" max="15" oninput="this.nextElementSibling.value">
			<span>
				<span id="heightValue"></span>
				<span> m </span>
			</span>
			<input type="button" value="+" onclick="add_one_m()">
			<input type="submit" value="Search">
		</form>
	</div>

	<div>
		<form action="Servlet_filters" method="get">
			<label for="weightChoice">Search by height :</label>
			<input type="button" value="-" onclick="subtract_one_kg()">
			<input type="range" id="weightChoice" name="weightChoice" min="0" max="1400" oninput="this.nextElementSibling.value">
			<span>
				<span id="weightValue"></span>
				<span> kg </span>
			</span>
			<input type="button" value="+" onclick="add_one_kg()">
			<input type="submit" value="Search">
		</form>
	</div>

	<div class="pokedex">
		<div class="pokedex-row">
			<c:forEach var="pkm" items="${requestScope.pkmList}">
				<div class="pokedex-card">
					<div class="pokedex-card-inner text-white">
						<div class="pokedex-card-front">
                            <div class="container">
                                <div class="container-fluid mt-2">
                                    <div><img src="resources/img/pkm/${pkm.nationalDex}.png" class="img-fluid"
                                              alt="Image Pokemon ${pkm.nationalDex}"></div>
                                </div>
                                <div class="h5">
                                    ${pkm.name}
                                </div>
								<div>
									<span class="badge rounded-pill ${pkm.primaryType}Color">${pkm.primaryType}</span>
									<span class="badge rounded-pill ${pkm.secondaryType}Color">${pkm.secondaryType}</span>
								</div>
                            </div>
						</div>
						<div class="pokedex-card-back">
							<div class="container p-2">
								<div class="h5 fw-bold text-dark">${pkm.name}</div>
								<div class="h6 text-start">
									<div>
										<span>National index : </span>
										<span class="fw-bold text-dark">${pkm.nationalDex}</span>
									</div>
									<div>
										<span>Régional index: </span>
										<span class="fw-bold text-dark">${pkm.regionalDex}</span>
									</div>
									<div class="mt-2">
										<span>Weight : </span>
										<span class="fw-bold text-dark">${pkm.weight} kg</span>
									</div>
									<div>
										<span>Height : </span>
										<span class="fw-bold text-dark">${pkm.height} m</span>
									</div>
									<div class="mt-2">
										<span>Description: </span>
										<span class="fst-italic text-dark">${pkm.description}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="script/pokedex.js"></script>
</html>