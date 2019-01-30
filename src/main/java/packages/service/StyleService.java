package packages.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import packages.entity.Style;
import packages.entity.User;
import packages.repository.StyleRepository;

import javax.servlet.http.HttpSession;

@Service
public class StyleService {

    @Autowired
    private StyleRepository styleRepository;

    public void addStyleGet(Model model, HttpSession session){
        User user =(User) session.getAttribute("user");
        model.addAttribute("style", new Style());
        model.addAttribute("user", user);
    }

    public void addStylePost(Style style, Model model){

        Style style1 =styleRepository.findByBeerStyle(style.getBeerStyle());
        if (style1 == null){
            styleRepository.save(style);
            model.addAttribute("styleError",false);
        }
        else{ model.addAttribute("styleError", true); }
    }

    public void editStyle(Model model, Long id){
        Style style = styleRepository.findOne(id);
        model.addAttribute("style", style);
    }

}
