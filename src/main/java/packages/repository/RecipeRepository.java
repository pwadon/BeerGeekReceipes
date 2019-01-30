package packages.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import packages.entity.Recipe;
import packages.entity.User;

import java.util.List;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {

    List<Recipe> getAllByUser(User user);

}
