
function removeAllChildNodes(parent) {
    while (parent.firstChild) {
        parent.removeChild(parent.firstChild);
    }
}

/* When the user clicks on the button,
        toggle between hiding and showing the dropdown content */
        function myFunction() {
          document.getElementById("myDropdown").classList.toggle("show");
        }

        function filterFunction() {
           let input, filter, ul, li, a, i;
           input = document.getElementById("myInput");
           ul = document.getElementById("results");
           removeAllChildNodes(ul)


           if(input.value.length >= 3){
            //get the value of the input and check it against the database
            axios.get("/api/nutrient?q=" + input.value)
                        .then(function(response){

                        let results = response.data;
                        for(let i =0; i<results.length; i++){
                           let li = document.createElement("LI");
                           li.innerHTML = results[i].name ;
                           let button = document.createElement("BUTTON");
                           button.addEventListener("click", function(){
                                let div = document.createElement("DIV");
                                div.innerHTML = `<label>${results[i].name} (${results[i].measurement.name})</label>
                                 <input class='form-control' type="number" data-nutrient-id="${results[i].id}" name="nutrients" placeholder="value"/>
                                `;
                                //trying to do this with form:input impossible
                                document.getElementById("nutrients").appendChild(div);
                           })
                           button.innerText="ADD";
                           li.appendChild(button);
                           ul.appendChild(li)
                        }
                        });
           }

        /*<div>
            <label>${currentItem.nutrient.name} (${currentItem.nutrient.measurement.name})</label>
            <form:input class='form-control' path="ingredientNutrients[${currentIN.index}].amount" placeholder="value"/>
            <form:hidden path="ingredientNutrients[${currentIN.index}].nutrient.id" value="${currentItem.nutrient.id}" />
            <%--<form:input class='form-control' path="nutrientAmounts[${currentNutrientIndex.index}].second" placeholder="value"/>
             <form:errors path="nutrientAmounts[${currentNutrientIndex.index}].second" class='form-error' />
            <form:hidden path="nutrientAmounts[${currentNutrientIndex.index}].first" value="${currentNutrient.first.id}" />--%>
        </div>*/
         /*filter = input.value.toUpperCase();
          div = document.getElementById("myDropdown");
          a = div.getElementsByTagName("a");
          for (i = 0; i < a.length; i++) {
            txtValue = a[i].textContent || a[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
              a[i].style.display = "";
            } else {
              a[i].style.display = "none";
            }
          }*/
        }