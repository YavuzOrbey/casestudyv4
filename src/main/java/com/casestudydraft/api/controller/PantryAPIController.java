package com.casestudydraft.api.controller;

import com.casestudydraft.model.*;
import com.casestudydraft.service.*;
import com.casestudydraft.tools.IngredientException;
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
        //find currently logged in user
        User user = userService.findByUsername(principal.getName());
        Ingredient ingredient = ingredientService.get(jsonObject.path("id").asLong());
        Pantry pantry = user.getPantry();

        PantryIngredient pantryIngredient = new PantryIngredient();
        pantryIngredient.setIngredient(ingredient);
        pantryIngredient.setMeasurement(measurementService.get(jsonObject.path("measurement").asLong()));
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
    public void makeRecipe(@RequestParam Integer recipeId, Principal principal) throws IngredientException {
        User user = userService.findByUsername(principal.getName());
        //how many ingredients does recipe require?
        Recipe recipe = recipeService.get(recipeId);
        boolean readyToMake = true;
        System.out.println(user);
        for (RecipeIngredient recipeIngredient: recipe.getRecipeIngredients()) {
            if(!pantryService.hasEnough(user.getPantry(),recipeIngredient.getIngredient(),recipeIngredient.getQuantity())){
                readyToMake = false;
                System.out.println("Not Enough ingredients!");
                throw new IngredientException("Not Enough ingredients!");
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
