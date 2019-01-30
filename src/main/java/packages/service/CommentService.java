package packages.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import packages.repository.CommentRepository;
import packages.repository.RecipeRepository;

@Service
public class CommentService {

    @Autowired
    RecipeRepository recipeRepository;

    @Autowired
    CommentRepository commentRepository;
}
