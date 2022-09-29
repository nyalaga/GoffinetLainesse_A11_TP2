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
	<title>Delete form</title>
</head>
<body>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="main-container">
	<%@include file="components/navigation_menu.jsp"%>
	<h1 class="page-name"><fmt:message key="data.delete"/></h1>

	<form class="fst-italic" action="Servlet_pkmById" method="get">
		<div class="row border border-2 border-danger rounded m-2 p-3">
			<label class="col-auto" for="searchNatId"><fmt:message key="card.natID"/></label>
			<input class="col-auto" type="text" id="searchNatId" name="searchNatId" value="${pkm.nationalDex}"/>
			<input type="hidden" name="dest" value="deleteForm.jsp"/>
			<input class="col-auto ms-2 btn btn-dark btn-sm" type="submit" value="<fmt:message key="search"/>">
		</div>
	</form>

	<c:if test="${not empty pkm.nationalDex}">
		<div>
			<div class="pokedex">
				<div class="pokedex-row">
					<div class="pokedex-card">
						<div class="pokedex-card-inner text-white">
							<div class="pokedex-card-front">
								<div class="container">
									<div class="container-fluid mt-2">
										<div><img src="resources/img/pkm/${pkm.nationalDex}.png" class="img-fluid"
												  alt="Image Pokemon ${pkm.nationalDex}"></div>
									</div>
									<div class="h5" name="pkm-name">
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
									<div class="h5 fw-bold text-dark" name="pkm-name">${pkm.name}</div>
									<div class="h6 text-start">
										<div>
											<span><fmt:message key="card.natID"/> : </span>
											<span class="fw-bold text-dark">${pkm.nationalDex}</span>
										</div>
										<div>
											<span><fmt:message key="card.regID"/> : </span>
											<span class="fw-bold text-dark">${pkm.regionalDex}</span>
										</div>
										<div class="mt-2">
											<span><fmt:message key="card.weight"/> : </span>
											<span class="fw-bold text-dark">${pkm.weight} <fmt:message key="card.kg"/></span>
										</div>
										<div>
											<span><fmt:message key="card.height"/> : </span>
											<span class="fw-bold text-dark">${pkm.height} <fmt:message key="card.m"/></span>
										</div>
										<div class="mt-2">
											<span><fmt:message key="card.desc"/> : </span>
											<span class="fst-italic text-dark pkmDesc">${pkm.description}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<form class="fst-italic" action="Servlet_deletePkm" method="get">
				<div class="row m-3 fst-normal fw-bold">
					<fmt:message key="data.deleteSentence"/> ${pkm.name} ?
				</div>
				<div class="row m-4 justify-content-evenly">
					<input type="hidden" name="pkm-natDex" value="${pkm.nationalDex}">
					<input class="col-auto btn btn-dark btn-sm" type="submit" value="<fmt:message key="data.yes"/>">
					<a class="col-auto btn btn-dark btn-sm" type="button" href="Servlet_pokedexList">
						<fmt:message key="data.no"/>
					</a>
				</div>
			</form>
		</div>
	</div>
</c:if>

</body>
<footer>
</footer>
<script src="webjars/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="script/pokedex.js"></script>
</html>