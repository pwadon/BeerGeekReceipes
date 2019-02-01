package packages.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import packages.entity.Comment;
import packages.entity.Recipe;

public interface CommentRepository extends JpaRepository<Comment, Long> {
}
