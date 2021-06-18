package com.casestudydraft.repository;

import com.casestudydraft.model.Recipe;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RecipeRepository extends JpaRepository<Recipe, Integer> {
    Recipe findByName(String name);
}
