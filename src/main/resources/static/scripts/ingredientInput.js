

function removeAllChildNodes(parent) {
    while (parent.firstChild) {
        parent.removeChild(parent.firstChild);
    }
}
let input = document.getElementById("ingredientInput");
let ul = document.getElementById("ingredient-results");
let recipeIngredients = document.getElementById("ingredients");
let numberOfIngredients = 0;
function showAddIngredient() {
    document.getElementById("showAddIngredient").classList.toggle("show");
}

function showAddStep() {
    document.getElementById("showAddStep").classList.toggle("show");
}

function clearInput(){
    document.getElementById("showAddIngredient").classList.toggle("show");
    removeAllChildNodes(ul)
    input.value ="";
}

function createIngredient(ingredient){ //ingredient should be an single ingredient object from an api call

     /*example ingredient = {
                              "created_on" : "2021-06-19T02:54:59.000+00:00",
                              "updated_on" : "2021-06-19T02:54:59.000+00:00",
                              "id" : 3,
                              "servingSize" : 2,
                              "calories" : 12,
                              "name" : "Yeast",
                              "category" : null
                            }*/
    let li = document.createElement("LI");
    li.classList.add("ingredient-list-item");

    let ingredientLabel = document.createElement("LABEL")
        ingredientLabel.innerText = ingredient.name
    li.appendChild(ingredientLabel);

    let amountInput = document.createElement("INPUT");
        amountInput.setAttribute("type", "number");
        amountInput.setAttribute("name", "ingredients")
        amountInput.setAttribute("data-ingredient-id", ingredient.id)
        amountInput.setAttribute("placeholder", "value")
    li.appendChild(amountInput)

    let div = document.createElement("DIV")
    div.classList.add("ingredient-list-item-measurements")

    let fragment = document.createDocumentFragment();
    measurements.forEach((measurement)=> {
        let measurementLabel = document.createElement("LABEL");
        measurementLabel.innerText = measurement.name
        let radioButton = document.createElement("INPUT")
        radioButton.setAttribute("type", "radio")
        radioButton.setAttribute("name", `measurements[${numberOfIngredients++}]` )
        radioButton.setAttribute("data-nutrient-id", measurement.id)
        radioButton.setAttribute("value", measurement.id)
        div.appendChild(measurementLabel)
        div.appendChild(radioButton)
        });
    li.appendChild(div)
    recipeIngredients.appendChild(li)

}
function showIngredients() {
    let  li, a, i;
    removeAllChildNodes(ul)
    if(input.value.length < 2){
        ul.classList.remove("show");
    }
    if(input.value.length >= 2){
        ul.classList.add("show");
        //get the value of the input and check it against the database
        axios.get("/api/ingredient?q=" + input.value)
        .then(function(response){
            let results = response.data;
            for(let i =0; i<results.length; i++){
               let li = document.createElement("LI");
               let ingredient = results[i];
               li.innerHTML = "<a href='#'>" +ingredient.name + "</a>";
               //what happens when you click on a list element that pops up
               li.addEventListener("click", function(){

               //abstract this away...for readability and also because createElement is faster than innerHTML
               //when you click a search result create a new li element and inside of that create a label and input
               //inside of
                        createIngredient(ingredient);
                       /* let li = document.createElement("LI");
                        li.classList.add("ingredient-list-item");
                        li.innerHTML =
                        `<label >${ingredient.name}</label>
                        <input type="number" data-ingredient-id="${ingredient.id}" name="ingredients" placeholder="value"/>
                          <div class='ingredient-list-item-measurements'>`;
                            measurements.forEach((x)=> {
                                    li.innerHTML+= `
                                    <label>${x.name}</label>
                                    <input type='radio' name='measurements[${numberOfIngredients}]' data-nutrient-id=${x.id} value=${x.id} >`
                            });
                         li.innerHTML += `</div>
                         `
                        document.getElementById("ingredients").appendChild(li) ;*/
                        clearInput();
                        numberOfIngredients++;
                   });

               ul.appendChild(li);
            }
          });
    }
}