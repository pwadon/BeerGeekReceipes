package packages.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import packages.entity.Comment;
import packages.entity.Recipe;
import packages.entity.Style;
import packages.entity.User;
import packages.repository.RecipeRepository;
import packages.repository.StyleRepository;
import packages.repository.UserRepository;
import packages.service.RecipeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

    @Autowired
    StyleRepository styleRepository;

    @Autowired
    RecipeRepository recipeRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RecipeService recipeService;

    @GetMapping("/save")
    public String addRecipe(Model model, HttpSession session){
        recipeService.addRecipeGet(model,session);
        return "recipe/form";
    }

    @PostMapping("/save")
    public String addRecipe(@Valid Recipe recipe, BindingResult errors, HttpServletRequest request) {
        if (errors.hasErrors()) {
            return "recipe/form";
        }
            recipeService.addRecipePost(request,recipe);
            return "redirect:" +request.getContextPath()+ "/home";
    }

    @GetMapping("/edit/{id}")
    private String editRecipe(Model model, @PathVariable Long id){
        recipeService.editRecipe(model,id);
        return "recipe/edit";
    }

    @GetMapping("/delete/{id}")
    private String deleteRecipe(@PathVariable Long id,HttpServletRequest request){
        recipeService.deleteRecipe(id);
        return "redirect:" +request.getContextPath()+ "/home";
    }

    @GetMapping("/{id}")
    public String showRecipe (Model model, HttpServletRequest request, @PathVariable Long id){
        recipeService.showRecipe(id,model,request);
        return "recipe/recipe";
    }
    @ModelAttribute("styles")
    public List<Style> styleList(){
        return styleRepository.findAll();
    }

    @ModelAttribute("users")
    public List<User> users(){
        return userRepository.findAll();
    }
}
