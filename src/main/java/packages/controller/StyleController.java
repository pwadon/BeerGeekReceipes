package packages.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import packages.entity.Style;
import packages.entity.User;
import packages.repository.StyleRepository;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/style")
public class StyleController {

    @Autowired
    private StyleRepository styleRepository;

    @GetMapping("/save")
    public String addStyle(Model model, HttpSession session){
        User user =(User) session.getAttribute("user");
        model.addAttribute("style", new Style());
        model.addAttribute("user", user);
        return "style/form";
    }

    @PostMapping("/save")
    public String addStyle(@Valid Style style, BindingResult errors,Model model){
        if (errors.hasErrors()){
            return "style/form";
        }
        try {
            if (style.getBeerStyle().equalsIgnoreCase(styleRepository.findByBeerStyle(style.getBeerStyle()).getBeerStyle())) {
                model.addAttribute("styleError", true);
                return "style/form";
            }
        }catch (NullPointerException n){}

        try {
            styleRepository.save(style);
        }
        catch (Exception e){
            return "home/home";
        }
        return "home/home";
    }

    @GetMapping("/edit/{id}")
    private String editStyle(Model model, @PathVariable Long id){
        Style style = styleRepository.findOne(id);
        model.addAttribute("style", style);
        return "style/edit";
    }

    @GetMapping("/delete/{id}")
    private String deleteStyle(Model model, @PathVariable Long id){
        styleRepository.delete(id);
        return "home/home";
    }


}
