package packages.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import packages.entity.User;
import packages.repository.UserRepository;


import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<String> registerUser(User user, String repeatedPassword) {

        List<String> errors = new ArrayList<>();

        if (userRepository.findByLogin(user.getLogin()) != null) {
            errors.add("userError");
        }

        if (userRepository.findByEmail(user.getEmail()) != null) {
            errors.add("emailError");
        }

        if (!user.getPassword().equals(repeatedPassword)) {
            errors.add("pwdError");
        }

        if (errors.size() == 0) {
            //create admin if this is first user
            if (userRepository.findAll().isEmpty()) {
                user.setAdmin(true);
            }

            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            userRepository.save(user);
        }

        return errors;
    }

    public boolean loginUser(String username, String password, HttpSession sess) {

        User user = userRepository.findByLogin(username);

        if (user != null && user.isEnabled() && BCrypt.checkpw(password, user.getPassword())) {
            sess.setAttribute("user", user);
            return true;
        } else {
            sess.setAttribute("user", null);
            return false;
        }
    }

    public boolean isLoggedIn(HttpSession sess) {
        return (sess.getAttribute("user") != null);
    }
}
