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
		<form action="Servlet_Search">
			<label for="partialName">Find by name :</label>
			<input type="text" id="partialName" name="partialName">
			<input type="submit" value="Search">
		</form>
	</div>
	<div class="pokedex">
		<div class="pokedex-row">
			<c:forEach var="pkm" items="${requestScope.pkmList}">
				<div class="pokedex-card">
					<div class="pokedex-card-inner">
						<div class="pokedex-card-front">
                            <div class="container">
                                <div class="container-fluid">
                                    <div><img src="resources/img/pkm/${pkm.nationalDex}.png" class="img-fluid"
                                              alt="Image Pokemon ${pkm.nationalDex}"></div>
                                </div>
                                <div class="h6">
                                    <div>Name: ${pkm.name}</div>
                                </div>
                            </div>
						</div>
						<div class="pokedex-card-back">
							<div class="container">
								<div class="h6">
									<div>National index: ${pkm.nationalDex}</div>
									<div>Régional index: ${pkm.regionalDex}</div>
									<div>Name: ${pkm.name}</div>
									<div>Weight: ${pkm.weight}</div>
									<div>Height: ${pkm.height}</div>
									<div>Description: ${pkm.description}</div>
									<div>Primary type: ${pkm.primaryType}</div>
									<div>Secondary type: ${pkm.secondaryType}</div>
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