package com.casestudydraft.api.controller;

import com.casestudydraft.model.Ingredient;
import com.casestudydraft.model.IngredientNutrient;
import com.casestudydraft.model.Measurement;
import com.casestudydraft.service.IngredientService;
import com.casestudydraft.service.MeasurementService;
import com.casestudydraft.service.NutrientService;
import com.casestudydraft.tools.IngredientException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/*Because my app is using a lot of javascript and making AJAX requests I needed to make my own API Endpoints to retrieve
my data */

@RestController
@RequestMapping("api")
@CrossOrigin
public class IngredientAPIController {


    //Autowiring the services I'm going to use in this class
    @Autowired
    IngredientService ingredientService;

    @Autowired
    NutrientService nutrientService;

    @Autowired
    MeasurementService measurementService;

    // the route localhost:8080/api/ingredients will send a json string with all of the ingredients in the database
    @RequestMapping(value="/ingredients")
    public List<Ingredient> viewAllIngredients(@ModelAttribute("ingredients") List<Ingredient> ingredients) {
        return ingredients;
    }

    @RequestMapping(value="/ingredient")
    public List<Ingredient> findMatchingIngredients(@RequestParam String q) {
        return ingredientService.findByNameIgnoreCaseContaining(q);
    }
    @RequestMapping(value="/ingredient", method= RequestMethod.POST)
    public  @ResponseBody
    String storeIngredient(@RequestBody String string) throws JsonProcessingException, IngredientException {
        System.out.println(string);
        /*  The string that goes through this method is a JSON string in a specific format
         *
         *
         */
        ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Ingredient ingredient = mapper.readValue(string, Ingredient.class); // this will try to parse what it can into a Ingredient pojo minus the stuff I explitcitly told it not to
        JsonNode jsonObject = mapper.readTree(string); // this is for the other stuff that can't be parsed

        //if there is already ingredient with the same name stop right here
        if(ingredientService.findByName(ingredient.getName())!=null)
            throw new IngredientException("Duplicate Value!");

        JsonNode measurementJson = jsonObject.path("measurement");
        Measurement measurement = measurementService.get(Long.parseLong(measurementJson.toString()));
        System.out.println(measurement);
        ingredient.setMeasurement(measurement);
        JsonNode nutrients = jsonObject.path("nutrients");
        List<IngredientNutrient> ingredientNutrients = new ArrayList<>();
        nutrients.forEach(nutrient-> {
            try {
                JsonNode currentNutrient = mapper.readTree(nutrient.toString());
                System.out.println(currentNutrient.path("id").toString());

                IngredientNutrient ingredientNutrient = new IngredientNutrient(nutrientService.get(Long.parseLong(currentNutrient.path("id").toString())));
                ingredientNutrient.setIngredient(ingredient);
                ingredientNutrient.setAmount(Integer.parseInt(currentNutrient.path("amount").toString()));
                ingredientNutrients.add(ingredientNutrient);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }

        });
        ingredient.setIngredientNutrients(ingredientNutrients);
        ingredientService.save(ingredient);
        return "Completed";
    }


    @RequestMapping(value="/ingredient/{id}")
    public Ingredient findIngredient(@PathVariable Long id) {
        return ingredientService.get(id);
    }


}
