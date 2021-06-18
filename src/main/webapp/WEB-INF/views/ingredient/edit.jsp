<% String title = "Edit Ingredient"; %>
<%@include file="../inc/head.jsp" %>
<%@include file="../inc/nav.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<form:form  method="POST" modelAttribute="ingredient" class='container'>
    <div class="mb-3">
        <label for="name" class='form-label'>Ingredient Name</label>
        <form:input id="name" type="text" class='form-control' placeholder="Ingredient Name" path="name"/>
        <form:errors path="name" class='form-error' />
    </div>
    <div class="mb-3">
        <label for="serving"  class='form-label'>Serving Size</label>
        <form:input id="serving" class='form-control' path="servingSize" type="number" placeholder="Serving Size" />
        <form:errors path="servingSize" class='form-error' />
    </div>

    <div class='form-check form-check-inline mb-3'>
        <c:forEach items="${measurements}" var="measurement">
         <form:radiobutton path="measurement.id" value="${measurement.id}" label="${measurement.name}" />
         </c:forEach>
    </div>
    <div class="mb-3">
                <label for="calories"  class='form-label'>Calories per Serving</label>
                <form:input id="calories" class='form-control' path="calories" type="number" placeholder="Calories" />
                <form:errors path="calories" class='form-error' />
    </div>
    <div class="mb-3">
         <c:forEach items="${ingredient.ingredientNutrients}" var="currentItem" varStatus="currentIN">
        <div>
            <label>${currentItem.nutrient.name} (${currentItem.nutrient.measurement.name})</label>
            <form:input class='form-control' path="ingredientNutrients[${currentIN.index}].amount" placeholder="value"/>
            <form:hidden path="ingredientNutrients[${currentIN.index}].nutrient.id" value="${currentItem.nutrient.id}" />
        </div>
        </c:forEach>
    </div>
    <button>Submit</button>
</form:form>
<%@include file="../inc/foot.jsp" %>