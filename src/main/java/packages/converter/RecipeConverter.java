package packages.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import packages.entity.Recipe;
import packages.repository.RecipeRepository;

public class RecipeConverter implements Converter<String, Recipe> {

    @Autowired
    private RecipeRepository recipeRepository;

    @Override
    public Recipe convert(String s) {
        return recipeRepository.findOne(Long.parseLong(s));
    }
}
