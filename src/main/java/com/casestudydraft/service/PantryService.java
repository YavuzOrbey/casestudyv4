package com.casestudydraft.service;

import com.casestudydraft.model.Ingredient;
import com.casestudydraft.repository.PantryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PantryService {

    @Autowired
    PantryRepository pantryRepository;
    public void addIngredient(Ingredient ingredient){
//        pantryRepository.addIngredient(ingredient);
    }

    public void removeIngredient(Ingredient ingredient){
//        pantryRepository.removeIngredient(ingredient);
    }
    public void decreaseQuantity(Ingredient ingredient){

    }
    public void increaseQuantity(Ingredient ingredient){

    }

}
