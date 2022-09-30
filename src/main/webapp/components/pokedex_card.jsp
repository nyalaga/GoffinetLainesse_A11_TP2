<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="Lang"/>

<div class="pokedex">
    <div class="pokedex-row">
        <c:forEach var="pkm" items="${sessionScope.pkmList}">
            <div class="pokedex-card">
                <div class="pokedex-card-inner text-white ${sessionScope.team.contains(pkm) ? "selected" : ""}">
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
        </c:forEach>
    </div>
</div>
