package packages.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import packages.entity.Style;

public interface StyleRepository extends JpaRepository<Style, Long> {

    Style findByBeerStyle(String style);
}
