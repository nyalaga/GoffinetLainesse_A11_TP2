<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setBundle basename="Lang"/>
<fmt:setLocale value="${sessionScope.Lang}"/>

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


