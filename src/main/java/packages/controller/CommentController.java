package packages.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import packages.entity.Comment;
import packages.entity.Recipe;
import packages.repository.CommentRepository;
import packages.repository.RecipeRepository;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.time.LocalDate;

@Controller
public class CommentController {

    @Autowired
    RecipeRepository recipeRepository;

    @Autowired
    CommentRepository commentRepository;

    @GetMapping("/recipe/{id}/comment")
    public String commentRecipe(@PathVariable Long id,Model model){
        Recipe recipe = recipeRepository.findOne(id);
        model.addAttribute("recipe",recipe);
        model.addAttribute("comment", new Comment());

        return "recipe/recipe";

    }

    @PostMapping("/recipe/{id}/comment")
    public String commentRecipe(@Valid Comment comment, BindingResult errors, Model model, HttpServletRequest request, @PathVariable Long id){
        if(errors.hasErrors()){
            Recipe recipe = recipeRepository.findOne(id);
            model.addAttribute("recipe", recipe);
            return "recipe/recipe";
        }

        commentRepository.save(comment);
        return "redirect:" + request.getContextPath() +"/recipe/"+id;
    }
}
