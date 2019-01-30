package packages.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import packages.entity.Recipe;
import packages.entity.User;
import packages.repository.RecipeRepository;
import packages.repository.UserRepository;
import packages.service.UserService;
import packages.validator.User.FullUserValidation;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RecipeRepository recipeRepository;

    @Autowired
    UserService userService;


    @GetMapping("/save")
    public String addUser(Model model, HttpServletRequest request) {
        model.addAttribute("user", new User());
        model.addAttribute("formAction", request.getContextPath() + "/user/save");
        return "user/form";
    }

    @PostMapping("/save")
    public String saveUser(@Valid User user, BindingResult errors, @RequestParam String rp, HttpServletRequest request, Model model, HttpSession session) {

        if(errors.hasErrors()) return "user/form";

        List<String> violations = userService.registerUser(user, rp);

        if(violations.size() > 0){
            violations.forEach( err -> {
                switch(err){
                    case "userError":
                        model.addAttribute("userError", true);
                        break;
                    case "emailError":
                        model.addAttribute("emailError", true);
                        break;
                    case "pwdError":
                        model.addAttribute("pwdError", true);
                        break;
                } });
            return "user/form";
        }
        session.setAttribute("user", user);
        return "redirect:" + request.getContextPath() + "/home";
    }
    @GetMapping("/login")
    private String logUser() {
        return "user/login";

    }

    @PostMapping("/login")
    private String logUser( @RequestParam String login, @RequestParam String password, HttpSession session, Model model) {
        List<String> violations = userService.loginUser(login,password,session);
        if (violations.size()>0){
            violations.forEach(err ->{
                switch (err){
                    case "e":
                        model.addAttribute("e", true);
                        break;
                    case "errorPassword":
                        model.addAttribute("errorPassword",true);
                        break;
                } });
         return "user/login";
        }
        return "home/home";
    }

    @GetMapping("/logout")
    private String logOutUser( HttpSession session, HttpServletRequest request){
        session.removeAttribute("user");
        return "redirect:" + request.getContextPath() +"/home";
    }
    @GetMapping("/edit")
    private String editUser(@SessionAttribute User user, HttpSession session, Model model) {

        model.addAttribute("user", user);
        return "user/edit";
    }

    @PostMapping("/edit")
    private String editUser(@Validated ({FullUserValidation.class}) User user, BindingResult errors,@RequestParam String rp,HttpSession session, HttpServletRequest request, Model model) {
        if (errors.hasErrors()) { return "user/edit"; }

        List<String> violations = userService.editUser(user,rp,user.getLogin());
//mozna poprawic dodac metode
        if(violations.size() > 0){
            violations.forEach( err -> {
                switch(err){
                    case "userError":
                        model.addAttribute("userError", true);
                        break;
                    case "emailError":
                        model.addAttribute("emailError", true);
                        break;
                    case "pwdError":
                        model.addAttribute("pwdError", true);
                        break;
                } });
            return "user/edit";
        }
        session.setAttribute("user", user);
        return "redirect:" + request.getContextPath() + "/home";
    }



    @GetMapping("/delete")
    public String delUser(HttpSession session, HttpServletRequest request){
        userService.delUser(session,request);
        return "redirect:" + request.getContextPath() +"/home";
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model){

        userService.userProfile(session,model);
            return "user/profile";
    }


}



