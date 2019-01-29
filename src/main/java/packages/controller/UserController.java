package packages.controller;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import packages.entity.User;
import packages.repository.UserRepository;
import packages.service.UserService;
import packages.validator.User.FullUserValidation;

import javax.servlet.annotation.HttpConstraint;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

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

        if (errors.hasErrors()) {
            return "user/form";
        }

        if (userRepository.findByLogin(user.getLogin()) != null) {
            model.addAttribute("usererror", true);
            return "user/form";
        }

        if (userRepository.findByEmail(user.getEmail()) != null) {
            model.addAttribute("emailError", true);
            return "user/form";
        } else {
            if (user.getPassword().equals(rp)) {
                try {
                    userService.registerUser(user, rp);
                    session.setAttribute("user", user);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                return "redirect:" + request.getContextPath() + "/home";
            } else {
                model.addAttribute("error", true);
                return "user/form";
            }
        }

    }

    @GetMapping("/login")
    private String logUser(Model model) {
        model.addAttribute("user", new User());
        return "user/login";

    }

    @PostMapping("/login")
    private String logUser(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {

        boolean log = userService.loginUser(username, password, session);

        if (log) {
            model.addAttribute("user", userRepository.findByLogin(username));
            return "home/home";
        } else {
            model.addAttribute("error", true);
            return "user/login";
        }

    }

    @GetMapping("/edit")
    private String editUser(HttpSession session, Model model) {

        User user =(User) session.getAttribute("user");
        model.addAttribute("user", user);
        return "user/edit";
    }

    @PostMapping("/edit")
    private String editUser(@Validated ({FullUserValidation.class}) User user, BindingResult errors,@RequestParam String rp,HttpSession session, HttpServletRequest request, Model model){
        if (errors.hasErrors()){
            return "user/edit";
        }
        try{
            if (!userRepository.findByLogin(user.getLogin()).getId().equals(user.getId())) {
            model.addAttribute("usererror", true);
            return "user/edit";
        }

        }  catch (NullPointerException e) { }

        try{

        if (userRepository.findByEmail(user.getEmail()).getId() !=(user.getId())) {
            model.addAttribute("emailError", true);
            return "user/edit";
        }
        }catch (NullPointerException e){ }

        if (user.getPassword().equals(rp)) {
            try {
                userService.registerUser(user, rp);
                session.setAttribute("user", user);
            }
            catch (Exception e){}
                return "redirect:" + request.getContextPath() + "/home";
            } else {
                model.addAttribute("error", true);
                return "user/edit";
            }
    }

    @GetMapping("/delete")
    public String delUser(HttpSession session, HttpServletRequest request){
        User user = (User)session.getAttribute("user");
        userRepository.delete(user);
        session.removeAttribute("user");
        return "redirect:" + request.getContextPath() +"/home";
    }
}


