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
<%-- I'm going to lost a lot of the functionality of the form: stuff--%>
<form class='container' id="form" method="POST" action="/ingredient/create2" >
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="mb-3">
        <label for="name" class='form-label'>Ingredient Name</label>
        <input id="name" type="text" class='form-control' placeholder="Ingredient Name" name="name"/>
    </div>
    <div class="mb-3">
        <label for="serving"  class='form-label'>Serving Size</label>
        <input id="serving" class='form-control' name="serving" type="number" placeholder="Serving Size" />
    </div>

    <div class='form-check form-check-inline mb-3'>
        <c:forEach items="${measurements}" var="measurement">
        <input type="radio"  name="measurement" value="${measurement.id}">
        <label >${measurement.name}</label><br>
        </c:forEach>
    </div>
    <div class="mb-3">
        <label for="calories"  class='form-label'>Calories per Serving</label>
        <input id="calories" class='form-control' name="calories" type="number" placeholder="Calories" />
    </div>
    <div class="mb-3">
        <div id="nutrients"></div>
    </div>
    <button>Submit</button>
</form>
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
        <script src="/scripts/nutrientInput.js"></script>
        <script>
        let form = document.getElementById("form");
        let token = document.querySelector('input[name="_csrf"]').value;
        axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
        form.addEventListener("submit", function(event){
            event.preventDefault();
            //go through each input in id nutrients and see populate object with if ex: nutrients { 3: 10, 4: 10 } where key is id of nutrient and value is amount
            const ingredient = {};
            ingredient.name = document.querySelector('input[name="name"]').value
            ingredient.servingSize = parseInt(document.querySelector('input[name="serving"]').value,10)
            ingredient.measurement =  parseInt(document.querySelector('input[name="measurement"]:checked').value,10)
            ingredient.calories =  parseInt(document.querySelector('input[name="calories"]').value,10)
            ingredient.nutrients = [];
            let nutrientInputs = document.getElementsByName("nutrients");
            for(let i=0; i<nutrientInputs.length; i++){
                ingredient.nutrients.push({id: parseInt(nutrientInputs[i].dataset.nutrientId,10), amount: parseInt(nutrientInputs[i].value, 10)});
            }
            console.log(ingredient);
            //ensure validation at this point
            let json = JSON.stringify(ingredient);
            axios.post("/api/ingredient", json,  {
            headers: {'Content-Type': 'application/json', }
            }).then(response=>{
            //try to send person back to ingredient index after this
                    console.log("got response back"); });
            });
        </script>
<%@include file="../inc/foot.jsp" %>