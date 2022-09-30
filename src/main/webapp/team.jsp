<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=500px, initial-scale=1">
	<link rel="stylesheet" href="webjars/bootstrap/5.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/team.css">
	<title>My Team</title>
</head>
<body>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="main-container">
	<%@include file="components/navigation_menu.jsp"%>
	<h1 class="page-name"><fmt:message key="title.team"/></h1>
	<div class="team team-row col-12">
		<c:forEach var="pkm" items="${sessionScope.team}">
			<div class="team-pokeball">
				<img class="pokemon" alt="Pokemon image" src="resources/img/pkm/${pkm.nationalDex}.png">
				<img class="pokeball pkb-top" alt="Pokeball image" src="resources/img/pkb_top.png">
				<img class="pokeball pkb-bottom" alt="Pokeball image" src="resources/img/pkb_bottom.png">
			</div>
		</c:forEach>
	</div>
</div>
</body>
<footer>
</footer>
<script src="webjars/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
<script src="script/team.js"></script>
</html>
