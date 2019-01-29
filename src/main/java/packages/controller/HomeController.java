package packages.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import packages.entity.User;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("")
public class HomeController {

    @RequestMapping("/home")
    public String home(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");

        return "home/home";
    }

}
