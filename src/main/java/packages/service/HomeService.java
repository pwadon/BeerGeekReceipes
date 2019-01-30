package packages.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import packages.entity.Recipe;
import packages.repository.RecipeRepository;

import java.util.List;

@Service
public class HomeService {

    @Autowired
    private RecipeRepository recipeRepository;

    public void home(Model model){
        List<Recipe> recipes = recipeRepository.findAll();
        model.addAttribute("recipes", recipes);
    }
}
