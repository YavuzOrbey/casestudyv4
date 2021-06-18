package com.casestudydraft.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
@Entity
@Table(name="recipe")
public class Recipe extends BaseModel{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Integer id;

    @Column(name="name")
    private String name;

    @Column(name="cuisine")
    private String cuisine;

    @Column
    @ManyToMany(mappedBy = "recipe")
    Set<Meal> meal;

    @OneToMany(mappedBy = "recipe")
    List<Step> recipeSteps = new ArrayList<>();

    @OneToMany(mappedBy = "recipe", cascade = {
            CascadeType.ALL
    })
    private List<RecipeIngredient> recipeIngredients = new ArrayList<>();

    @ManyToMany(mappedBy = "recipes")
    Set<User> users;

    public Recipe() {
        super();
    }

    public Recipe(String name) {
        super();
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Set<Meal> getMeal() {
        return meal;
    }

    public void setMeal(Set<Meal> meal) {
        this.meal = meal;
    }

    public List<Step> getRecipeSteps() {
        return recipeSteps;
    }

    public void setRecipeSteps(List<Step> recipeSteps) {
        this.recipeSteps = recipeSteps;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Meal> getMealEntity() {
        return meal;
    }

    public void setMealEntity(Set<Meal> meal) {
        this.meal = meal;
    }

    public String getCuisine() {
        return cuisine;
    }

    public void setCuisine(String cuisine) {
        this.cuisine = cuisine;
    }

    public List<RecipeIngredient> getRecipeIngredients() {
        return recipeIngredients;
    }

    public void setRecipeIngredients(List<RecipeIngredient> recipeIngredients) {
        this.recipeIngredients = recipeIngredients;
    }
}
