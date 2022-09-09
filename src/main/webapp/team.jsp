<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=500px, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/team.css">
	<title>My Team</title>
</head>
<body>
<div class="main-container">
	<%@include file="components/navigation_menu.jsp"%>
	<h1 class="page-name">My Pokemon Team</h1>
	<div class="team col-12">
		<div class="team-row">
			<%@include file="components/team_pokeball.jsp"%>
			<%@include file="components/team_pokeball.jsp"%>
			<%@include file="components/team_pokeball.jsp"%>
		</div>
		<div class="team-row">
			<%@include file="components/team_pokeball.jsp"%>
			<%@include file="components/team_pokeball.jsp"%>
			<%@include file="components/team_pokeball.jsp"%>
		</div>
	</div>
</div>
</body>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="script/team.js"></script>
</html>
