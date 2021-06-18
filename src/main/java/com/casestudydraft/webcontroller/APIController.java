package com.casestudydraft.webcontroller;

import com.casestudydraft.model.Ingredient;
import com.casestudydraft.model.IngredientNutrient;
import com.casestudydraft.model.Measurement;
import com.casestudydraft.model.Nutrient;
import com.casestudydraft.service.IngredientService;
import com.casestudydraft.service.MeasurementService;
import com.casestudydraft.service.NutrientService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class APIController {
    @Autowired
    MeasurementService measurementService;

    @Autowired
    NutrientService nutrientService;


    @Autowired
    IngredientService ingredientService;

    @ModelAttribute("measurements")
    public ArrayList<Measurement> measurements(){

        List<Measurement> measurements = measurementService.listAll();
        return (ArrayList<Measurement>) measurements;
    }

    @ModelAttribute("nutrients")
    public ArrayList<Nutrient> nutrients(){

        List<Nutrient> nutrients = nutrientService.findAll();
        return (ArrayList<Nutrient>) nutrients;
    }

    @ModelAttribute("ingredients")
    public ArrayList<Ingredient> ingredients(){
        List<Ingredient> ingredients = ingredientService.findAll();
        return (ArrayList<Ingredient>) ingredients;
    }

    @RequestMapping(value="/measurements")
    public List<Measurement> viewAllMeasurements(@ModelAttribute("measurements") List<Measurement> measurements) {
        return measurements;
    }

    @RequestMapping(value="/measurement/{id}")
    public Measurement findMeasurement(@PathVariable Long id) {
            return measurementService.get(id);
    }
    @RequestMapping(value="/measurement")
    public Measurement findMatchingMeasurements(@RequestParam String q) {
        return measurementService.findByNameIgnoreCaseContaining(q);
    }
    @RequestMapping(value="/nutrients")
    public List<Nutrient> viewAllNutrients(@ModelAttribute("nutrients") List<Nutrient> nutrients) {
        return nutrients;
    }

    @RequestMapping(value="/nutrient/{id}")
    public Nutrient findNutrient(@PathVariable Long id) {
        return nutrientService.get(id);
    }

    @RequestMapping(value="/nutrient")
    public List<Nutrient> findMatchingNutrients(@RequestParam String q) {
        return nutrientService.findByNameIgnoreCaseContaining(q);
    }

    @RequestMapping(value="/ingredients")
    public List<Ingredient> viewAllIngredients(@ModelAttribute("ingredients") List<Ingredient> ingredients) {
        return ingredients;
    }

    @RequestMapping(value="/ingredient")
    public List<Ingredient> findMatchingIngredients(@RequestParam String q) {
        return ingredientService.findByNameIgnoreCaseContaining(q);
    }
    @RequestMapping(value="/ingredient", method=RequestMethod.POST)
    public  @ResponseBody Ingredient storeIngredient( @RequestBody String string) throws JsonProcessingException { // Ingredient ingredient
        System.out.println(string);

        ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        JsonNode jsonObject = mapper.readTree(string);
        Ingredient ingredient = mapper.readValue(string, Ingredient.class); // this will try to parse what it can into a Ingredient pojo minus the stuff I explitcitly told it not to
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
        return new Ingredient();
    }


    @RequestMapping(value="/ingredient/{id}")
    public Ingredient findIngredient(@PathVariable Long id) {
        return ingredientService.get(id);
    }
}
