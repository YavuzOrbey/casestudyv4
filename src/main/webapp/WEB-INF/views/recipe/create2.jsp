<% String title = "Create Recipe"; %>
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
#ingredientInput {
  box-sizing: border-box;
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 20px;
  border: none;
  border-bottom: 1px solid #ddd;
}

/* The search field when it gets focus/clicked on */
#ingredientInput:focus {box-shadow: 0 1px 6px rgb(32 33 36 / 28%);
                            border-color: rgba(223,225,229,0);}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
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
#ingredientInput{
width:100%;
}
.results{
display:none;
    overflow-y: scroll;
    padding: 0;
    margin: 0;
    list-style:none;
    background: white
}
.ingredient-amount{
    width: 60px;
}
#ingredients{
margin-top: 10px;
}
/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}

.input{
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  background: rgba(223, 225, 229, 0);
}

.error{
color: red;
}
</style>
<%@include file="../inc/nav.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form method="POST" class='container shadow-lg p-3 mb-5 bg-body rounded' id="form" >
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="mb-3">
        <label for="name" class='form-label'>Recipe Name</label>
        <input id="name" type="text" class='form-control' placeholder="Recipe Name" name="name"/>
        <!-- figure out how to do some validation errors without form:error EDIT:6/20 got it!-->
        <span id="name-error" class='error'></span>
    </div>
    <div class="mb-3">
        <label for="cuisine"  class='form-label'>Cuisine</label>
        <input id="cuisine" class='form-control' name="cuisine" type="text" placeholder="Cuisine" />
    </div>

              <a onclick="showElement('showAddIngredient')" class="dropbtn d-block">Add Ingredient</a>

    <h4>Ingredients</h4>
    <span id="ingredient-error" class='error'></span>
    <div id="showAddIngredient" class="dropdown-content">
        <input type="text" placeholder="Search.." id="ingredientInput" class='input' onkeyup="showIngredients()">
        <ul id='ingredient-results' class='results'>
        </ul>
    </div>
    <ul id="ingredients" style="min-height: 300px">

    </ul>
     <h4>Steps</h4>
     <span id="step-error" class='error'></span>
    <a onclick="showElement('showAddStep')"  class="dropbtn d-block">Add New Step</a>
        <div id="showAddStep" class="dropdown-content row">
            <div class="form-floating" >
              <textarea class="form-control" placeholder="Step Instruction" id="stepInput" ></textarea>
              <label for="floatingTextarea">Step Instruction</label>
            </div>
            <div >
                <a onclick="createNewStep()" class="dropbtn"><i class="fas fa-plus-square"></i></a>
            </div>
        </div>
    <ol id="steps"></ol>

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
</form>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

<%--
<div class='new-ingredient' >
        <div class="mb-3">
            <label class='form-label'>Name</label>
            <input type="text" name="ingredient">
            <label  class='form-label'>Quanity</label>
            <input type="number" name="quantity">
            <div class='form-check form-check-inline mb-3'>
                <c:forEach items="${measurements}" var="measurement">
                <label>${meas}
                <input type="radio" name="measurement" value="${measurement}"

                 </c:forEach>
            </div>
        </div>
    </div>--%>

let measurements = [];
// at the startup of the jsp page parse the measurements recieved from the controller into a javascript object
<c:forEach items="${measurements}" var="measurement">
    measurements.push({id: ${measurement.id}, name: '${measurement.name}' });
</c:forEach>
console.log(measurements);
    <%--
    for(let i=0; i<nutrientInputs.length; i++){
        ingredient.nutrients.push({id: parseInt(nutrientInputs[i].dataset.nutrientId,10), amount: parseInt(nutrientInputs[i].value, 10)});
    }
    console.log(ingredient);
    //ensure validation at this point
    let json = JSON.stringify(ingredient);
    axios.post("/api/ingredient", json,  {
    headers: {'Content-Type': 'application/json', }
    }).then(response=>{
            console.log("got response back"); });--%>
</script>
<script src="/scripts/ingredientInput.js"></script>

<%@include file="../inc/foot.jsp" %>