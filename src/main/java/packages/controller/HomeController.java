package packages.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import packages.entity.Recipe;
import packages.entity.User;
import packages.repository.RecipeRepository;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("")
public class HomeController {
    @Autowired
    private RecipeRepository recipeRepository;

    @RequestMapping("/home")
    public String home(Model model, HttpSession session){
//        User user = (User)session.getAttribute("user");
        List<Recipe> recipes = recipeRepository.findAll();
        model.addAttribute("recipes", recipes);
//        model.addAttribute("user",user);

        return "home/home";
    }

}
