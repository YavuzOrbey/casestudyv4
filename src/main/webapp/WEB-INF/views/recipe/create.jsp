<% String title = "Create Recipe"; %>
<%@include file="../inc/head.jsp" %>
<%@include file="../inc/nav.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<form:form  method="POST" modelAttribute="recipe" class='container'>
    <div class="mb-3">
        <label for="name" class='form-label'>Recipe Name</label>
        <form:input id="name" type="text" class='form-control' placeholder="Recipe Name" path="name"/>
        <form:errors path="name" class='form-error' />
    </div>
    <div class="mb-3">
            <label for="cuisine"  class='form-label'>Cuisine</label>
            <form:input id="cuisine" class='form-control' path="cuisine" type="text" placeholder="Cuisine" />
            <form:errors path="cuisine" class='form-error' />
    </div>
    <a href="#" onclick="doSomething = function(e){e.preventDefault(); console.log('clicked')}">Add New Ingredient</a>
    <div class='new-ingredient' >
        <div class="mb-3">
            <label  class='form-label'>Ingredient</label>

            <form:select path="recipeIngredients[0].ingredient.id" items="${ingredients}" class="ingredient"/>
            <form:errors path="recipeIngredients[0].ingredient.id" class='form-error' />
                    <label  class='form-label'>Quanity</label>
                    <form:input path="recipeIngredients[0].quantity" type="text" placeholder="Ingredient Name" />
                    <form:errors path="recipeIngredients[0].quantity" class='form-error' />
            <div class='form-check form-check-inline mb-3'>
                <c:forEach items="${measurements}" var="measurement">
                 <form:radiobutton path="recipeIngredients[0].measurement.id" value="${measurement.id}" label="${measurement.name}" />
                 </c:forEach>
            </div>
        </div>
    </div>
    <div class='new-ingredient' >
            <div class="mb-3">
                <label  class='form-label'>Ingredient</label>

                <form:select path="recipeIngredients[1].ingredient.id" items="${ingredients}" class="ingredient"/>
                <form:errors path="recipeIngredients[1].ingredient.id" class='form-error' />
                        <label  class='form-label'>Quanity</label>
                        <form:input path="recipeIngredients[1].quantity" type="text" placeholder="Ingredient Name" />
                        <form:errors path="recipeIngredients[1].quantity" class='form-error' />
                <div class='form-check form-check-inline mb-3'>
                    <c:forEach items="${measurements}" var="measurement">
                     <form:radiobutton path="recipeIngredients[1].measurement.id" value="${measurement.id}" label="${measurement.name}" />
                     </c:forEach>
                </div>
            </div>
        </div>
<button onclick="()->console.log('step clicked')">Add New Step</button>
    <%--<div class='new-step' >
        <div class="mb-3">
                    <label  class='form-label'>Quanity</label>
                    <form:input class='form-control' path="recipe.recipeIngredients[]" type="text" placeholder="Ingredient Name" />
                    <form:errors path="recipe.recipeIngredients[]" class='form-error' />
        </div>
        <div class='form-check form-check-inline mb-3'>
            <c:forEach items="${measurements}" var="measurement">
             <form:radiobutton path="recipe.recipeIngredients[].measurement.id" value="${measurement.id}" label="${measurement.name}" />
             </c:forEach>
        </div>
    </div>--%>

    <button>Submit</button>
</form:form>
<%@include file="../inc/foot.jsp" %>