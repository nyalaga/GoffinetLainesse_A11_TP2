<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
