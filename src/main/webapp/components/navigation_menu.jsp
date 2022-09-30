<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="btn-group lang-group" role="group" aria-label="Basic example">
	<a class="btn btn-outline-danger btn-menu" href="${pageContext.request.contextPath}
	/I18nServlet?lang=en_US&path=${pageContext.request.requestURI}"><fmt:message key="choice.english"/></a>
	<a class="btn btn-outline-danger btn-menu" href="${pageContext.request.contextPath}
	/I18nServlet?lang=fr_CA&path=${pageContext.request.requestURI}"><fmt:message key="choice.french"/></a>
	<a class="btn btn-outline-danger btn-menu" href="${pageContext.request.contextPath}
	/I18nServlet?lang=ru_RU&path=${pageContext.request.requestURI}"><fmt:message key="choice.russian"/></a>
</div>
<div class="top-menu">
	<a class="btn btn-outline-danger btn-menu" href="index.jsp"><fmt:message key="nav.home"/></a>
	<a class="btn btn-outline-danger btn-menu" href="PokedexListServlet"><fmt:message key="nav.pokedex"/></a>
	<a class="btn btn-outline-danger btn-menu" href="team.jsp"><fmt:message key="nav.team"/></a>
</div>