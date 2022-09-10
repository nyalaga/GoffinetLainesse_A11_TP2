<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setBundle basename="Lang"/>
<fmt:setLocale value="${sessionScope.Lang}"/>

<form action="Servlet_in18" method="get">
	<div class="btn-group" role="group" aria-label="Basic example">
		<button type="submit" class="btn btn-outline-danger btn-menu" value="en_US" name="Lang"><fmt:message key="choice.english"/></button>
		<button type="submit" class="btn btn-outline-danger btn-menu" value="fr_CA" name="Lang"><fmt:message key="choice.french"/></button>
		<button type="submit" class="btn btn-outline-danger btn-menu" value="ru_RU" name="Lang"><fmt:message key="choice.russian"/></button>
	</div>
</form>

<div class="top-menu">
	<a class="btn btn-outline-danger btn-menu" href="index.jsp"><fmt:message key="nav.home"/></a>
	<a class="btn btn-outline-danger btn-menu" href="Servlet_pokedexList"><fmt:message key="nav.pokedex"/></a>
	<a class="btn btn-outline-danger btn-menu" href="team.jsp"><fmt:message key="nav.team"/></a>
	<a class="btn btn-outline-danger btn-menu" href="stats.jsp"><fmt:message key="nav.stat"/></a>
	<a class="btn btn-outline-danger btn-menu" href="transaction.jsp">My Transactions</a>
</div>