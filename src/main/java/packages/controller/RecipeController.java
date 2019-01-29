package packages.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import packages.entity.Recipe;
import packages.entity.Style;
import packages.entity.User;
import packages.repository.RecipeRepository;
import packages.repository.StyleRepository;

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


    @GetMapping("/save")
    public String addRecipe(Model model, HttpSession session){
        User user =(User) session.getAttribute("user");
        model.addAttribute("recipe", new Recipe());
        model.addAttribute("user", user);
        return "recipe/form";
    }

    @PostMapping("/save")
    public String addRecipe(@Valid Recipe recipe, BindingResult errors, HttpServletRequest request) {
        if (errors.hasErrors()) {
            return "recipe/form";
        }
            recipeRepository.save(recipe);
            return "redirect:" +request.getContextPath()+ "/home";
    }

    @GetMapping("/edit/{id}")
    private String editRecipe(Model model, @PathVariable Long id){
        Recipe recipe = recipeRepository.findOne(id);
        model.addAttribute("recipe", recipe);
        return "recipe/edit";
    }

    @GetMapping("/delete/{id}")
    private String deleteRecipe(Model model, @PathVariable Long id){
        styleRepository.delete(id);
        return "home/home";
    }
    @ModelAttribute("styles")
    public List<Style> styleList(){
        return styleRepository.findAll();
    }
}
