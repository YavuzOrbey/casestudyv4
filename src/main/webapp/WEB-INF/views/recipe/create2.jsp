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

<form method="POST" class='container'>
    <div class="mb-3">
        <label for="name" class='form-label'>Recipe Name</label>
        <input id="name" type="text" class='form-control' placeholder="Recipe Name" name="name"/>
        <!-- figure out how to do some validation errors without form:error -->
    </div>
    <div class="mb-3">
        <label for="cuisine"  class='form-label'>Cuisine</label>
        <input id="cuisine" class='form-control' name="cuisine" type="text" placeholder="Cuisine" />
    </div>
    <h4>Ingredients</h4>
     <a onclick="createNewIngredient()"  class="dropbtn">Add New Ingredient</a>
    <div class="dropdown">
          <a onclick="myFunction()" class="dropbtn">Add Ingredient</a>
          <div id="myDropdown" class="dropdown-content">
            <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
            <ul id='results'>
            </ul>
          </div>
    </div>

    <div id="ingredients"></div>
     <h4>Steps</h4>
    <a onclick="createNewStep()"  class="dropbtn">Add New Step</a>
<div id="steps"></div>

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
<script src="/scripts/ingredientInput.js"></script>
<script>
function createNewIngredient(){

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


 let form = document.getElementById("form");
 let measurements = [];
    // at the startup of the jsp page parse the measurements recieved from the controller into a javascript object
        <c:forEach items="${measurements}" var="measurement">
        measurements.push({id: ${measurement.id}, name: '${measurement.name}' });
        </c:forEach>
        let token = document.querySelector('input[name="_csrf"]').value;
        axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
        form.addEventListener("submit", function(event){
            event.preventDefault();
            //go through each input in id nutrients and see populate object with if ex: nutrients { 3: 10, 4: 10 } where key is id of nutrient and value is amount
            const recipe = {};
            recipe.name = document.querySelector('input[name="name"]').value
            recipe.cuisine =  document.querySelector('input[name="cuisine"]').value
            recipe.ingredients = [];
            let ingredientInputs = document.getElementsByName("ingredients");
            for(let i=0; i<nutrientInputs.length; i++){
                ingredient.nutrients.push({id: parseInt(nutrientInputs[i].dataset.nutrientId,10), amount: parseInt(nutrientInputs[i].value, 10)});
            }
            console.log(ingredient);
            //ensure validation at this point
            let json = JSON.stringify(ingredient);
            axios.post("/api/ingredient", json,  {
            headers: {'Content-Type': 'application/json', }
            }).then(response=>{
                    console.log("got response back"); });
            });
</script>
<script>
let step = 1;
function createNewStep(){
    let div = document.createElement("DIV");

    div.innerHTML =
    `<label>${step}.</label>
    <input class='form-control' type="text" data-step-id="${step}" name="steps" placeholder="Step ${step}"/>`;

    document.getElementById("steps").appendChild(div) ;
}
</script>
<%@include file="../inc/foot.jsp" %>