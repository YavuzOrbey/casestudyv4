package com.casestudydraft.service;

import com.casestudydraft.model.Nutrient;
import com.casestudydraft.model.Recipe;
import com.casestudydraft.repository.RecipeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RecipeService {
    @Autowired
    RecipeRepository recipeRepository;

    public void save(Recipe recipe){
        recipeRepository.save(recipe);
    }
    public List<Recipe> findAll() {
        return recipeRepository.findAll();
    }

    public Recipe get(int id){
        return recipeRepository.getById(id);
    }
    public Recipe findByName(String name){
        return recipeRepository.findByName(name);
    }
    public void delete(Recipe recipe){
        recipeRepository.delete(recipe);
    }
}
