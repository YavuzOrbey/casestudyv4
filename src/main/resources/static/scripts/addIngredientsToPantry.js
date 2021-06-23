
  let token = document.querySelector('input[name="_csrf"]').value;
  axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
  function addToPantry(id){
    let quantity = document.getElementsByName(`quantity[${id}]`)[0].value
    ingredientToAdd = {
        id: id,
        quantity: quantity
    }
    let json = JSON.stringify(ingredientToAdd);
    axios.post("/api/addIngredients", json,  { headers: {'Content-Type': 'application/json', }})
    .then(response=>{ console.log(response.data)});
    }
