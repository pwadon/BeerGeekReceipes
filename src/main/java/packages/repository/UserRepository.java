package packages.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import packages.entity.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByLogin(String string);
    User findByEmail(String email);
    User findByPassword(String password);
    List<User> findAllByEmail(String email);
    List<User> findAllByLogin(String login);
}
