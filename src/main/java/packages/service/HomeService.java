package packages.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import packages.entity.Recipe;
import packages.entity.User;
import packages.repository.RecipeRepository;
import packages.repository.UserRepository;

import java.util.List;

@Service
public class HomeService {

    @Autowired
    private RecipeRepository recipeRepository;

    @Autowired
    private UserRepository userRepository;

    public void home(Model model){
        List<Recipe> recipes = recipeRepository.allSortedByDate();
        model.addAttribute("recipes", recipes);
    }

    public void allUsers(Model model){
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
    }
}
