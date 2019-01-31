package packages.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import packages.entity.Recipe;
import packages.entity.User;

import java.util.List;

public interface RecipeRepository extends JpaRepository<Recipe, Long> {

    List<Recipe> getAllByUser(User user);
    @Query(value ="Select * from Recipe order by dateTime DESC ", nativeQuery = true)
    List<Recipe> allSortedByDate();

}
