package com.casestudydraft.api.controller;

import com.casestudydraft.model.*;
import com.casestudydraft.service.*;
import com.casestudydraft.tools.NegativeIngredientException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.concurrent.atomic.AtomicBoolean;

@RestController
@CrossOrigin
@RequestMapping("api")
public class PantryAPIController {

    @Autowired
    PantryService pantryService;
    @Autowired
    UserService userService;
    @Autowired
    MeasurementService measurementService;

    @Autowired
    RecipeService recipeService;
    @Autowired
    IngredientService ingredientService;

    @RequestMapping(value="/addIngredients", method=RequestMethod.POST)
    public String addIngredientsToPantry(@RequestBody String string, Principal principal) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        JsonNode jsonObject = mapper.readTree(string);
        System.out.println(jsonObject);
        User user = userService.findByUsername(principal.getName());
        Ingredient ingredient = ingredientService.get(jsonObject.path("id").asLong());
        Pantry pantry = user.getPantry();
        PantryIngredient pantryIngredient = new PantryIngredient();
        pantryIngredient.setIngredient(ingredient);
        pantryIngredient.setMeasurement(measurementService.get(1L));
        pantryIngredient.setPantry(pantry);
        pantryIngredient.setQuantity(jsonObject.path("quantity").asInt());
        System.out.println(pantryIngredient);

        pantryService.addIngredient(pantryIngredient);
        /*System.out.println(user.getPantry().g);*/
/*        JsonNode measurementJson = jsonObject.path("measurement");
        Measurement measurement = measurementService.get(Long.parseLong(measurementJson.toString()));*/
        return "DONE";
    }
    @RequestMapping(value="/checkpantry")
    public void makeRecipe(@RequestParam Integer recipeId, Principal principal) throws NegativeIngredientException {
        User user = userService.findByUsername(principal.getName());
        //how many ingredients does recipe require?
        Recipe recipe = recipeService.get(recipeId);
        boolean readyToMake = true;

        for (RecipeIngredient recipeIngredient: recipe.getRecipeIngredients()) {
            if(!pantryService.hasEnough(user.getPantry(),recipeIngredient.getIngredient(),recipeIngredient.getQuantity())){
                readyToMake = false;
                System.out.println("Not Enough ingredients!");
                break;
            }
        }

        if(readyToMake){
            for (RecipeIngredient recipeIngredient: recipe.getRecipeIngredients()) {
                PantryIngredient pantryIngredient = new PantryIngredient();
                pantryIngredient.setIngredient(recipeIngredient.getIngredient());
                pantryIngredient.setPantry(user.getPantry());
                pantryIngredient.setQuantity(recipeIngredient.getQuantity());
                pantryService.removeIngredient(pantryIngredient);
            }
        }
    }
}
