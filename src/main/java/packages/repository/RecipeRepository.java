package packages.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import packages.entity.Recipe;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {
}
