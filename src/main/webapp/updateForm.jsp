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
	<title>Update form</title>
</head>
<body>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="main-container">
	<%@include file="components/navigation_menu.jsp"%>
	<h1 class="page-name"><fmt:message key="data.update"/></h1>

	<form class="fst-italic" action="PkmByIdServlet" method="get">
		<div class="row border border-2 border-danger rounded m-2 p-3">
			<label class="col-auto" for="searchNatId"><fmt:message key="card.natID"/></label>
			<input class="col-auto" type="text" id="searchNatId" name="searchNatId" value="${pkm.nationalDex}"/>
			<input type="hidden" name="dest" value="saveForm.jsp"/>
			<input class="col-auto ms-2 btn btn-dark btn-sm" type="submit" value="<fmt:message key="search"/>">
		</div>
	</form>
</div>
</body>
<footer>
</footer>
<script src="webjars/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script>
</html>