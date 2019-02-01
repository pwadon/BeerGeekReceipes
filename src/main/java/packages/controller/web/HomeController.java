package packages.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import packages.entity.Recipe;
import packages.entity.User;
import packages.repository.RecipeRepository;
import packages.service.HomeService;
import packages.service.RecipeService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("")
public class HomeController {


    @Autowired
    HomeService homeService;

    @Autowired
    RecipeRepository recipeRepository;

    @RequestMapping("/home")
    public String home(Model model){
      homeService.home(model);
        return "home/home";
    }

    @RequestMapping("/home/all")
    public String homeAll(Model model){
        homeService.home(model);
        return "home/AllRecipes";
    }

    @RequestMapping("/home/allUsers")
    public String homeAllUsers(Model model){
        homeService.allUsers(model);
        return "home/AllUsers";
    }
    @RequestMapping("/home/user/recipes/{id}")
    public String homeAllUsers(Model model, @PathVariable Long id){
        model.addAttribute("recipes",recipeRepository.getAllByUserId(id));
        return "home/userRecipes";
    }
}
