<% String title = "Create Ingredient"; %>
<%@include file="../inc/head.jsp" %>
<style>
/* Dropdown Button */
.dropbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
  background-color: #3e8e41;
}

/* The search field */
#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

/* The search field when it gets focus/clicked on */
#myInput:focus {outline: 3px solid #ddd;}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  border: 1px solid #ddd;
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}
</style>
<%@include file="../inc/nav.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
<%--    <form:radiobuttons path="measurement.id" items="${measurements}" var="measurement" itemLabel="${measurement.name}" />--%>
        <c:forEach items="${measurements}" var="measurement">
         <form:radiobutton path="measurement.id" value="${measurement.id}" label="${measurement.name}" />
         </c:forEach>
        <%--            <label class='form-label'>${measurement.name}</label>--%><%--


            --%><%--<input type="radio" id="serving"  name="measurement" value="${measurement.id}" placeholder="Serving Size" />--%><%--
        --%>
    </div>
    <div class="mb-3">
                <label for="calories"  class='form-label'>Calories per Serving</label>
                <form:input id="calories" class='form-control' path="calories" type="number" placeholder="Calories" />
                <form:errors path="calories" class='form-error' />
    </div>
    <div class="mb-3">

    <%--<!-- HARDEST THING I had to DO ALL ASSIGNMENT SO FAR 6/4/21 -6/6/21 2 FULL DAYS -->
        Why not a list of IngredientNutrients? maybe but this works if there's time try this

    --%>
    <c:forEach items="${ingredient.ingredientNutrients}" var="currentItem" varStatus="currentIN">
        <div>
            <label>${currentItem.nutrient.name} (${currentItem.nutrient.measurement.name})</label>
            <form:input class='form-control' path="ingredientNutrients[${currentIN.index}].amount" placeholder="value"/>
            <form:hidden path="ingredientNutrients[${currentIN.index}].nutrient.id" value="${currentItem.nutrient.id}" />
            <%--<form:input class='form-control' path="nutrientAmounts[${currentNutrientIndex.index}].second" placeholder="value"/>
             <form:errors path="nutrientAmounts[${currentNutrientIndex.index}].second" class='form-error' />
            <form:hidden path="nutrientAmounts[${currentNutrientIndex.index}].first" value="${currentNutrient.first.id}" />--%><%----%><%--
            --%><%----%><%--
              <label>${currentNutrient.key} - (${currentNutrient.value.first.measurement.name})</label>
              <form:input class='form-control' path="nutrientMap[${currentNutrient.key}].second" placeholder="value"/>
              <form:hidden  path="nutrientMap[${currentNutrient.key}].first" value="${currentNutrient.value.first}"/>--%><%----%><%--
              --%><%----%><%--<form:input class='form-control' path="nutrientMap[${currentNutrient.key}].second" placeholder="value"/>
              <form:hidden  path="nutrientMap[${currentNutrient.key}].first" value="${currentNutrient.value.first}"/>--%><%----%><%--
             --%><%----%><%-- <form:input class='form-control' path="nutrientMap[${nutrientMap.key}].value" placeholder="value"/>--%><%----%><%--
              --%><%----%><%-- <form:hidden  path="nutrientMap[${nutrientMap.key}].key" value="nutrientMap[${nutrientMap.key}].key"/>--%><%----%><%--
              --%><%----%><%--<form:input path="ingredientNutrients[${currentNutrientIndex.index}].amount"/>
              <form:hidden path = "ingredientNutrients[${currentNutrientIndex.index}].nutrient.id" value = "${currentNutrient.value.key}" />
              <form:hidden path = "ingredientNutrients[${currentNutrientIndex.index}].nutrient.name" value = "${currentNutrient.key}" />--%><%--

        </div> --%>
        </c:forEach>


    </div>
    <button>Submit</button>
</form:form>
<div class="dropdown">
          <button onclick="myFunction()" class="dropbtn">Add Nutrient</button>
          <div id="myDropdown" class="dropdown-content">
            <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
            <ul id='results'>
                <!-- populate this area with results from the database after an ajax request -->
            </ul>
          </div>
 </div>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="/scripts/dynamicInput.js"></script>
<%@include file="../inc/foot.jsp" %>