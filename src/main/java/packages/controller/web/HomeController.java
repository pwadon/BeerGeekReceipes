package packages.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import packages.entity.Recipe;
import packages.entity.User;
import packages.repository.RecipeRepository;
import packages.service.HomeService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("")
public class HomeController {


    @Autowired
    HomeService homeService;

    @RequestMapping("/home")
    public String home(Model model){
      homeService.home(model);
        return "home/home";
    }

}
