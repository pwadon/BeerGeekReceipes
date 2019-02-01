package packages.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import packages.entity.Comment;
import packages.entity.Recipe;
import packages.entity.User;
import packages.repository.RecipeRepository;
import packages.repository.StyleRepository;
import packages.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class RecipeService {

    @Autowired
    StyleRepository styleRepository;

    @Autowired
    RecipeRepository recipeRepository;

    @Autowired
    UserRepository userRepository;

    public void addRecipeGet(Model model, HttpSession session){
        User user =(User) session.getAttribute("user");
        model.addAttribute("recipe", new Recipe());
        model.addAttribute("user", user);
    }



    public void editRecipe(Model model, Long id){
        Recipe recipe = recipeRepository.findOne(id);
        model.addAttribute("recipe", recipe);
    }

    public void deleteRecipe(Long id){
        recipeRepository.delete(id);
    }

    public void showRecipe(Long id, Model model, HttpServletRequest request){
        Recipe recipe =  recipeRepository.findOne(id);
        model.addAttribute("recipe", recipe);
        model.addAttribute("comment",new Comment());
        model.addAttribute("user",request.getParameter("user"));
    }
}
