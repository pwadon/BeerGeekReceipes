package packages.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import packages.entity.Recipe;

import java.util.List;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {

}
