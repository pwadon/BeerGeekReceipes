package packages.controller.web;

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
import packages.service.StyleService;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/style")
public class StyleController {

    @Autowired
    private StyleRepository styleRepository;

    @Autowired
    private StyleService styleService;

    @GetMapping("/save")
    public String addStyle(Model model, HttpSession session){
    styleService.addStyleGet(model,session);
        return "style/form";
    }

    @PostMapping("/save")
    public String addStyle(@Valid Style style, BindingResult errors,Model model){
        if (errors.hasErrors()){
            return "style/form";
        }
        styleService.addStylePost(style,model) ;
    return "redirect:/style/save";

    }

    @GetMapping("/edit/{id}")
    private String editStyle(Model model, @PathVariable Long id){
        styleService.editStyle(model,id);
        return "style/edit";
    }

    @GetMapping("/delete/{id}")
    private String deleteStyle(Model model, @PathVariable Long id){
        styleRepository.delete(id);
        return "home/home";
    }


}
