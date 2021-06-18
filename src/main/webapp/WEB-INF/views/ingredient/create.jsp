<% String title = "Create Ingredient"; %>
<%@include file="../inc/head.jsp" %>
<%@include file="../inc/nav.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<form:form  method="POST" modelAttribute="form" class='container'>
    <div class="mb-3">
        <label for="name" class='form-label'>Ingredient Name</label>
        <form:input id="name" type="text" class='form-control' placeholder="Ingredient Name" path="ingredient.name"/>
        <form:errors path="ingredient.name" class='form-error' />
    </div>
    <div class="mb-3">
        <label for="serving"  class='form-label'>Serving Size</label>
        <form:input id="serving" class='form-control' path="ingredient.servingSize" type="number" placeholder="Serving Size" />
        <form:errors path="ingredient.servingSize" class='form-error' />
    </div>

    <div class='form-check form-check-inline mb-3'>
        <c:forEach items="${measurements}" var="measurement">
            <label class='form-label'>${measurement.name}</label>
            <input type="radio" id="serving"  name="measurement" value="${measurement.id}" placeholder="Serving Size" />
            <%--<input type="radio" class='' name="form.ingredient.measurement" value="${measurement.id}" />--%>
        </c:forEach>
    </div>
    <div class="mb-3">
                <label for="calories"  class='form-label'>Calories per Serving</label>
                <form:input id="calories" class='form-control' path="ingredient.calories" type="number" placeholder="Calories" />
                <form:errors path="ingredient.calories" class='form-error' />
    </div>
    <div class="mb-3">

    <%--<!-- HARDEST THING I had to DO ALL ASSIGNMENT SO FAR 6/4/21 -6/6/21 2 FULL DAYS -->
        Why not a list of IngredientNutrients? maybe but this works if there's time try this

    --%>
         <c:forEach items="${form.nutrientList}" var="currentNutrient" varStatus="currentNutrientIndex">
        <div>
            <label>${currentNutrient.first.name} (${currentNutrient.first.measurement.name})</label>
            <form:input class='form-control' path="nutrientAmounts[${currentNutrientIndex.index}].second" placeholder="value"/>
             <form:errors path="nutrientAmounts[${currentNutrientIndex.index}].second" class='form-error' />
            <form:hidden path="nutrientAmounts[${currentNutrientIndex.index}].first" value="${currentNutrient.first.id}" />
            <%--
              <label>${currentNutrient.key} - (${currentNutrient.value.first.measurement.name})</label>
              <form:input class='form-control' path="nutrientMap[${currentNutrient.key}].second" placeholder="value"/>
              <form:hidden  path="nutrientMap[${currentNutrient.key}].first" value="${currentNutrient.value.first}"/>--%>
              <%--<form:input class='form-control' path="nutrientMap[${currentNutrient.key}].second" placeholder="value"/>
              <form:hidden  path="nutrientMap[${currentNutrient.key}].first" value="${currentNutrient.value.first}"/>--%>
             <%-- <form:input class='form-control' path="nutrientMap[${nutrientMap.key}].value" placeholder="value"/>--%>
              <%-- <form:hidden  path="nutrientMap[${nutrientMap.key}].key" value="nutrientMap[${nutrientMap.key}].key"/>--%>
              <%--<form:input path="ingredientNutrients[${currentNutrientIndex.index}].amount"/>
              <form:hidden path = "ingredientNutrients[${currentNutrientIndex.index}].nutrient.id" value = "${currentNutrient.value.key}" />
              <form:hidden path = "ingredientNutrients[${currentNutrientIndex.index}].nutrient.name" value = "${currentNutrient.key}" />--%>

        </div>
        </c:forEach>
    </div>
    <button>Submit</button>
</form:form>
<%@include file="../inc/foot.jsp" %>