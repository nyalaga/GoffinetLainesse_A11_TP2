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
	<fmt:setBundle basename="Lang"/>
	<fmt:setLocale value="${sessionScope.Lang}"/>
	<div class="main-container">
		<%@include file="components/navigation_menu.jsp"%>
		<h1 class="page-name"><fmt:message key="title.checkout"/></h1>
		<div class="col-12">
			<ul>
				<c:forEach var="pkm" items="${sessionScope.transactionsAdded}">
					<li>
						<span>Adding to your team: ${pkm.name}</span>
						<span><img class="pkm-img-checkout" src="resources/img/pkm/${pkm.nationalDex}.png"></span>
					</li>
				</c:forEach>
			</ul>
			<ul>
				<c:forEach var="pkm" items="${sessionScope.transactionsRemoved}">
					<li>
						<span>Removing from your team: ${pkm.name}</span>
						<span><img class="pkm-img-checkout" src="resources/img/pkm/${pkm.nationalDex}.png"></span>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<a class="btn btn-outline-danger btn-menu" href="${pageContext.request.contextPath}/ServletCheckout">Confirm</a>
		</div>
	</div>
</body>
<footer>
</footer>
<script src="webjars/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
<script src="script/team.js"></script>
</html>